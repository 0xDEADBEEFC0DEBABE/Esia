// Esia - the text interface: what Painter and widgets need from a text stack.
//
// One interface, one implementation per platform family (docs/REWRITE.md, "Text"):
//   * FreeType + HarfBuzz (esia_text_ft, every platform; the only one on Linux / Android / consoles),
//   * DirectWrite on Windows and Core Text on Apple (later: system fallback fonts and the platform's rendering).
// A TextSystem shapes UTF-8 text, rasterizes glyphs into atlas pages it owns in the TextureRegistry and emits
// glyph quads into a DrawList (Geometry commands on those pages). Glyph pages are Alpha8 coverage, which the renderer
// recognizes from the page's TextureInfo and draws with its text pipeline, so text needs no special draw commands.
// Text is antialiased in grayscale on every platform: there is no sub-pixel (LCD / ClearType) text. How outlines become
// pixels - hinting, the rasterizer - is a text system's TextRendering (the design's outlines unless asked otherwise).
// Bitmap fonts draw their own pixels (freetype.hpp).
//
// Threading: a TextSystem belongs to one UI thread (like the Context that uses it).
#pragma once
#include "esia/base/math.hpp"
#include "esia/base/utf8.hpp"
#include <cstdint>
#include <string>
#include <string_view>
#include <vector>

namespace esia
{
    class DrawList;
}

namespace esia::text
{
    struct GlyphSlot;
    struct GlyphBitmap;

    // Handle of a loaded font face (a file / memory blob + face index, or a system family). 0 = none.
    using FontId = std::uint32_t;

    // A font at a size in UI units (already multiplied by the metrics scale).
    struct FontRef
    {
        FontId id = 0;
        float size = 0.0f;
    };

    enum TextFlags_ : std::uint32_t
    {
        TextFlags_None = 0,
        TextFlags_Ellipsis = 1u << 0,      // trim with "…" when wider than the wrap width (single line)
        TextFlags_AlignCenter = 1u << 1,   // paragraph alignment of wrapped lines
        TextFlags_AlignRight = 1u << 2,
    };

    struct TextMetrics
    {
        Vec2 size;               // box of the laid-out text (UI units)
        float baseline = 0.0f;   // first baseline, from the top of the box
        int lines = 0;
    };

    // A place a caret can stand in a line of text: a grapheme cluster boundary.
    struct CaretStop
    {
        std::uint32_t offset = 0;   // bytes into the UTF-8 text
        float x = 0.0f;             // where the caret is drawn, from the start of the line (UI units)
    };

    // An outline around text and icons (Painter::SetTextOutline, ui::ItemStyle::TextOutline): `width` UI units of
    // `color` all around every glyph, under it - the glyph's coverage grown by the width, round at its corners (up to
    // 32 physical pixels). The text's box does not grow: the outline reaches past it by the width. Color glyphs
    // (emoji) get none.
    struct TextOutline
    {
        float width = 0.0f;
        Color color = Color::Black();
        constexpr bool Visible() const { return width > 0.0f && color.a > 0.0f; }
    };

    // How glyph outlines become pixels (TextSystem::SetRendering; the FreeType text system also takes it from
    // FreeTypeDesc::rendering and the ESIA_TEXT_RENDERING environment variable). The default is the design's outline as
    // it is: no hinting, exact area coverage (Esia's analytic rasterizer), the pen at quarter pixels - shapes, weights
    // and spacing true to the font at every size and density, and one layout at every density. Hinting first fits the
    // outline to the pixel grid: crisper small text on a low-density display, at the cost of the design's exact shapes
    // (and, with hinted advances, of a layout independent of the density). Fonts drawn by the platform (Apple's Core
    // Text faces), color glyphs and bitmap fonts are not hinted.
    enum class Hinting : std::uint8_t
    {
        None,    // the design's outline
        Light,   // vertical only: baselines, x-heights and horizontal stems on whole pixels; widths and spacing unchanged
        Full,    // the font's own hints: its TrueType instructions (as `TrueTypeInterpreter` runs them), its CFF hints
        Auto,    // FreeType's autohinter, the font's own hints left aside (fonts with poor hints or none)
    };

    enum class TrueTypeInterpreter : std::uint8_t
    {
        V40,   // FreeType's default: the instructions' vertical part only, as fonts made for ClearType expect it
        V35,   // the classic interpreter, both directions: the shapes of black-and-white and grayscale GDI text
    };

    enum class GlyphRasterizer : std::uint8_t
    {
        Analytic,   // Esia's (glyph_raster.hpp): exact area coverage, the same whichever library read the font
        FreeType,   // FreeType's anti-aliasing rasterizer (the FreeType text system; others draw Analytic)
    };

    struct TextRendering
    {
        Hinting hinting = Hinting::None;
        TrueTypeInterpreter interpreter = TrueTypeInterpreter::V40;   // Full hinting of TrueType fonts
        GlyphRasterizer rasterizer = GlyphRasterizer::Analytic;
        bool stemDarkening = false;    // FreeType's darkening of thin stems at small sizes (CFF fonts, the autohinter)
        // Full or Auto hinting: the layout takes the hinted advance widths, on whole pixels, instead of the design's -
        // as GDI-era text did. A text's width then depends on the density (Measure gives the width at the density of
        // the last NewFrame), and the pen stays on whole pixels.
        bool hintedAdvances = false;

        bool operator==(const TextRendering&) const = default;

        // The design's outlines (the default).
        static constexpr TextRendering Design() { return {}; }
        // Light hinting: sharper horizontals, the design's widths.
        static constexpr TextRendering Light()
        {
            TextRendering r;
            r.hinting = Hinting::Light;
            return r;
        }
        // GDI-era sharpness: the fonts' own hints in both directions (the classic interpreter), FreeType's rasterizer,
        // hinted advances on whole pixels.
        static constexpr TextRendering Crisp()
        {
            TextRendering r;
            r.hinting = Hinting::Full;
            r.interpreter = TrueTypeInterpreter::V35;
            r.rasterizer = GlyphRasterizer::FreeType;
            r.hintedAdvances = true;
            return r;
        }
    };

    // What the platform's own text looks like: Windows - the fonts' hints with FreeType's default interpreter and
    // rasterizer; Linux - light hinting, FreeType's rasterizer and stem darkening (the desktops' defaults); Apple and
    // Android - the design's outlines.
    ESIA_API TextRendering NativeTextRendering();

    // A rendering from text, for command lines and environment variables: comma-separated presets and settings, later
    // ones overriding earlier ones -
    //   design | light | crisp | native
    //   hinting=none|light|full|auto   interpreter=35|40   rasterizer=analytic|freetype
    //   stem-darkening[=0|1]   hinted-advances[=0|1]
    // e.g. "crisp", "native,stem-darkening=0", "hinting=full,interpreter=35". False (and `out` unchanged) on a word it
    // does not know, which `error` then names.
    ESIA_API bool ParseTextRendering(std::string_view spec, TextRendering& out, std::string* error = nullptr);

    // How glyphs are rasterized this frame.
    struct RasterParams
    {
        float pixelsPerUnit = 1.0f;   // render-target pixels per UI unit (metrics x render scale is already in the sizes)
    };

    class TextSystem
    {
    public:
        virtual ~TextSystem() = default;

        // ---- fonts
        // Loads a font file (TTF / OTF / TTC face `faceIndex`); 0 on failure.
        virtual FontId AddFontFile(const char* path, int faceIndex = 0) = 0;
        // The data must stay alive as long as the TextSystem (bundled fonts in the executable).
        virtual FontId AddFontMemory(const void* data, std::size_t size, int faceIndex = 0) = 0;
        // Characters a font lacks are looked up in the fallback chain, in the order the fonts were added here.
        virtual void AddFallback(FontId font) = 0;

        // ---- frame
        // Call once per frame before drawing: sets the pixel density and grows / trims the glyph pages.
        virtual void NewFrame(const RasterParams& params) = 0;
        // How glyphs become pixels from the next NewFrame on (TextRendering); the glyph pages start over when it changes.
        // A text system without the choice keeps its own: this default ignores it.
        virtual void SetRendering(const TextRendering& rendering) { (void)rendering; }
        virtual TextRendering Rendering() const { return {}; }

        // ---- layout and drawing (UTF-8)
        virtual TextMetrics Measure(FontRef font, std::string_view text, float wrapWidth = 0.0f, std::uint32_t flags = 0) = 0;
        // Draws `text` with its box's top-left at `pos` and returns the box size at scale 1 (what Measure returns).
        // `scale` draws it scaled around `pos` (press / pop animations) by rasterizing at the scaled size instead
        // of stretching the bitmaps.
        virtual Vec2 Draw(DrawList& dl, FontRef font, Vec2 pos, Color color, std::string_view text, float wrapWidth = 0.0f,
                          std::uint32_t flags = 0, float scale = 1.0f) = 0;
        // One glyph (icon fonts) optically centered on `center`; `size` = em size in UI units.
        virtual void DrawGlyph(DrawList& dl, FontRef font, char32_t codepoint, Vec2 center, Color color) = 0;
        // The outline of what Draw / DrawGlyph with the same arguments draws (TextOutline), to be drawn just before it:
        // the same layout and placement, every glyph grown by the outline's width in its color. This default draws
        // none (a text system without outlines); the FreeType system draws them.
        virtual void DrawOutline(DrawList& dl, FontRef font, Vec2 pos, const TextOutline& outline, std::string_view text, float wrapWidth = 0.0f,
                                 std::uint32_t flags = 0, float scale = 1.0f)
        {
            (void)dl, (void)font, (void)pos, (void)outline, (void)text, (void)wrapWidth, (void)flags, (void)scale;
        }
        virtual void DrawGlyphOutline(DrawList& dl, FontRef font, char32_t codepoint, Vec2 center, const TextOutline& outline)
        {
            (void)dl, (void)font, (void)codepoint, (void)center, (void)outline;
        }
        // Coverage tiles other than glyphs, in the texture text is drawn with (the corners of Painter's flat shapes, so
        // they batch with the text) and kept apart from the glyphs: the tile cached under `key`, else null; AddTile packs
        // one the caller rasterized (8-bit coverage). Gone when the glyph pages start over. Null from both: no tiles.
        virtual const GlyphSlot* FindTile(std::uint64_t key)
        {
            (void)key;
            return nullptr;
        }
        virtual const GlyphSlot* AddTile(std::uint64_t key, const GlyphBitmap& bitmap)
        {
            (void)key;
            (void)bitmap;
            return nullptr;
        }
        // Changes when the tiles found so far are gone (the pages started over), and differs between text systems (one
        // made where another was): a caller may keep their slots while it stays.
        virtual std::uint64_t TileGeneration() { return 0; }

        // ---- editing
        // The caret stops of `text` laid out as one line (line breaks are not honored: single-line fields), in logical
        // order: the first at offset 0, the last at text.size(). x is where Draw puts the caret, so it decreases
        // through a right-to-left run; a ligature of several characters is split evenly. This default stops at every
        // code point and measures the text before it; the FreeType system stops at grapheme cluster boundaries.
        virtual void CaretStops(FontRef font, std::string_view text, std::vector<CaretStop>& out)
        {
            out.clear();
            for (std::size_t i = 0;;)
            {
                out.push_back({(std::uint32_t)i, i > 0 ? Measure(font, text.substr(0, i)).size.x : 0.0f});
                if (i >= text.size())
                    break;
                DecodeUtf8(text, i);
            }
        }
    };
}
