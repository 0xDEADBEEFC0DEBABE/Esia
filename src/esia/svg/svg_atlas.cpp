// Esia - SVG textures (svg.hpp): rasterized documents packed into RGBA8 pages by text::GlyphAtlas, and Draw - a document
// on the painter's pixel grid, rasterized at the size it is drawn.
#include "esia/core/texture.hpp"
#include "esia/render/painter.hpp"
#include "esia/text/glyph_atlas.hpp"
#include "svg_internal.hpp"
#include <cmath>

namespace esia::svg
{
    namespace
    {
        // one texel of transparent border around every drawing: sampled between texels, its edges keep their color
        constexpr int kBorder = 1;

        std::uint64_t Mix(std::uint64_t h, std::uint64_t v)
        {
            h ^= v + 0x9E3779B97F4A7C15ull + (h << 6) + (h >> 2);
            return h * 0x100000001B3ull;
        }
    }

    Atlas::Atlas(TextureRegistry& textures, int pageSize, int maxPages) : pageSize_(pageSize)
    {
        text::GlyphAtlasDesc desc;
        desc.pageSize = pageSize;
        desc.maxPages = maxPages;
        desc.format = TextureFormat::RGBA8;
        pages_ = std::make_unique<text::GlyphAtlas>(textures, desc);
    }

    Atlas::~Atlas() = default;

    void Atlas::BeginFrame() { pages_->BeginFrame(); }

    const Atlas::Entry* Atlas::Get(const Document& doc, int width, int height, const RasterOptions& options)
    {
        if (doc.Empty() || width <= 0 || height <= 0 || width + 2 * kBorder + 1 > pageSize_ || height + 2 * kBorder + 1 > pageSize_)
            return nullptr;
        std::uint64_t key = Mix(doc.Id(), ((std::uint64_t)(std::uint32_t)width << 32) | (std::uint32_t)height);
        key = Mix(key, options.mask ? 1u : 0u);
        // currentColor only where it paints something (and only its alpha for a mask)
        if (doc.UsesCurrentColor())
        {
            const Color c = options.currentColor;
            key = Mix(key, options.mask ? Color(1.0f, 1.0f, 1.0f, c.a).ToRgba8() : c.ToRgba8());
        }
        const text::GlyphSlot* slot = pages_->Find(key);
        if (!slot)
        {
            RasterOptions o = options;
            o.border = kBorder;
            if (!Rasterize(doc, width, height, o, scratch_))
                return nullptr;
            ++rasterized_;
            text::GlyphBitmap bitmap;
            bitmap.width = scratch_.width;
            bitmap.height = scratch_.height;
            bitmap.channels = 4;
            bitmap.pixels = std::move(scratch_.pixels);
            slot = pages_->Add(key, bitmap, Rect(0.0f, 0.0f, (float)width, (float)height));
            scratch_.pixels = std::move(bitmap.pixels);
            if (!slot)
                return nullptr;
        }
        if (slot->page == 0)
            return nullptr;
        // the drawing inside its border
        const float texel = 1.0f / (float)pageSize_;
        entry_.texture = slot->page;
        entry_.uv0 = slot->uv0 + Vec2(texel, texel) * (float)kBorder;
        entry_.uv1 = slot->uv1 - Vec2(texel, texel) * (float)kBorder;
        return &entry_;
    }

    void Draw(Painter& painter, Atlas& atlas, const Document& doc, const Rect& r, Color color, bool mask)
    {
        if (doc.Empty() || r.Empty() || !(color.a > 0.0f))
            return;
        // whole physical pixels: the texels land on pixels one to one
        const float px = painter.Env().pixelScale > 0.0f ? painter.Env().pixelScale : 1.0f;
        const float x0 = std::round(r.min.x * px), y0 = std::round(r.min.y * px);
        const int w = std::max(1, (int)std::lround(r.Width() * px)), h = std::max(1, (int)std::lround(r.Height() * px));
        const Rect snapped(x0 / px, y0 / px, (x0 + (float)w) / px, (y0 + (float)h) / px);
        RasterOptions o;
        o.mask = mask || doc.Monochrome();
        Color tint = Color::White(color.a);
        if (o.mask)
        {
            o.currentColor = Color::White();   // one mask for every color: the color tints it
            tint = color;
        }
        else
            o.currentColor = color.WithAlpha(1.0f);
        const Atlas::Entry* e = atlas.Get(doc, w, h, o);
        if (e)
            painter.Image(e->texture, snapped, 0.0f, tint, e->uv0, e->uv1);
    }
}
