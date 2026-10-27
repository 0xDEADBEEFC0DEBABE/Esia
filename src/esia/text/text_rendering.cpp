// Esia - TextRendering's presets and parser (include/esia/text/text.hpp).
#include "esia/text/text.hpp"

namespace esia::text
{
    TextRendering NativeTextRendering()
    {
        TextRendering r;
#if defined(_WIN32)
        // DirectWrite's look on FreeType: the fonts' hints, vertical only (v40, ClearType's interpreter), FreeType's
        // rasterizer, the design's widths
        r.hinting = Hinting::Full;
        r.interpreter = TrueTypeInterpreter::V40;
        r.rasterizer = GlyphRasterizer::FreeType;
#elif defined(__APPLE__) || defined(__ANDROID__)
        // Core Text and Android draw the design's outlines
#else
        // the Linux desktops' fontconfig defaults: hintslight, FreeType's rasterizer and stem darkening
        r.hinting = Hinting::Light;
        r.rasterizer = GlyphRasterizer::FreeType;
        r.stemDarkening = true;
#endif
        return r;
    }

    namespace
    {
        std::string_view Trim(std::string_view s)
        {
            while (!s.empty() && (s.front() == ' ' || s.front() == '\t'))
                s.remove_prefix(1);
            while (!s.empty() && (s.back() == ' ' || s.back() == '\t'))
                s.remove_suffix(1);
            return s;
        }

        // "1", "on", "yes", "true" / "0", "off", "no", "false"; an empty value (a flag alone) is true
        bool Flag(std::string_view value, bool& out)
        {
            if (value.empty() || value == "1" || value == "on" || value == "yes" || value == "true")
                out = true;
            else if (value == "0" || value == "off" || value == "no" || value == "false")
                out = false;
            else
                return false;
            return true;
        }
    }

    bool ParseTextRendering(std::string_view spec, TextRendering& out, std::string* error)
    {
        TextRendering r = out;
        while (!spec.empty())
        {
            const std::size_t comma = spec.find(',');
            const std::string_view item = Trim(spec.substr(0, comma));
            spec = comma == std::string_view::npos ? std::string_view() : spec.substr(comma + 1);
            if (item.empty())
                continue;
            const std::size_t eq = item.find('=');
            const std::string_view name = Trim(item.substr(0, eq));
            const std::string_view value = eq == std::string_view::npos ? std::string_view() : Trim(item.substr(eq + 1));
            bool ok = true;
            if (eq == std::string_view::npos && name == "design")
                r = TextRendering::Design();
            else if (eq == std::string_view::npos && name == "light")
                r = TextRendering::Light();
            else if (eq == std::string_view::npos && name == "crisp")
                r = TextRendering::Crisp();
            else if (eq == std::string_view::npos && name == "native")
                r = NativeTextRendering();
            else if (name == "hinting")
            {
                if (value == "none")
                    r.hinting = Hinting::None;
                else if (value == "light")
                    r.hinting = Hinting::Light;
                else if (value == "full")
                    r.hinting = Hinting::Full;
                else if (value == "auto")
                    r.hinting = Hinting::Auto;
                else
                    ok = false;
            }
            else if (name == "interpreter")
            {
                if (value == "35" || value == "v35")
                    r.interpreter = TrueTypeInterpreter::V35;
                else if (value == "40" || value == "v40")
                    r.interpreter = TrueTypeInterpreter::V40;
                else
                    ok = false;
            }
            else if (name == "rasterizer")
            {
                if (value == "analytic" || value == "esia")
                    r.rasterizer = GlyphRasterizer::Analytic;
                else if (value == "freetype")
                    r.rasterizer = GlyphRasterizer::FreeType;
                else
                    ok = false;
            }
            else if (name == "stem-darkening")
                ok = Flag(value, r.stemDarkening);
            else if (name == "hinted-advances")
                ok = Flag(value, r.hintedAdvances);
            else
                ok = false;
            if (!ok)
            {
                if (error)
                    *error = "unknown text rendering setting '" + std::string(item) + "'";
                return false;
            }
        }
        out = r;
        return true;
    }
}
