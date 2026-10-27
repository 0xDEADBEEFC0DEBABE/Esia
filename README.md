# Esia

<p align="center">
  <img src="docs/images/showcase-dark.jpg" width="100%"
       alt="EsiaGUI's showcase: Settings, Effects Lab, Components, Languages, Control Center, Telemetry and a plugin panel as liquid-glass windows over the wallpaper, the island at the top, the dock at the bottom">
</p>
<p align="center">
  <img src="docs/images/workbench.jpg" width="66%"
       alt="EsiaGUI's workbench: an outline tree, a scene view, an inspector with number, vector and color fields, and a table of 100 000 assets, docked side by side">
  <img src="docs/images/glass-closeup.jpg" width="32%" alt="Clear, regular, thick and tinted glass over moving content">
</p>
<p align="center"><sub>What Esia draws: <a href="https://github.com/0xDEADBEEFC0DEBABE/EsiaGUI">EsiaGUI</a>'s showcase and workbench on
Windows 11 with Direct3D 11 at UI scale 1.5. The widgets are EsiaGUI's (<code>esia::ui</code>); the core, the renderer
with its glass, shadows and glows, the text and the backend under them are this repository.</sub></p>

A UI engine for games and tools, in C++20: an immediate-mode UI core, a renderer, a text system and a render hardware
interface (RHI) with backends for Direct3D 9 to 12, OpenGL / OpenGL ES, Vulkan and Metal, and platform layers, on
Windows, Linux, macOS, iOS and Android. Esia has no widget set of its own: an application draws its UI with the Painter
on the core's windows, items and layout, or uses a widget layer built on Esia.
[EsiaGUI](https://github.com/0xDEADBEEFC0DEBABE/EsiaGUI), the liquid-glass widgets in the iOS 26 style, is one.

* [Esia and EsiaGUI](#esia-and-esiagui) · [What is in it](#what-is-in-it) · [Building](#building) ·
  [Using it in your project](#using-it-in-your-project) · [Running the example](#running-the-example)
* Per system: [Windows](#windows) · [Linux](#linux) · [macOS](#macos) · [iOS](#ios) · [Android](#android)
* [Changing the shaders](#changing-the-shaders) · [Documents](#documents) · [Roadmap](#roadmap) · [Third-party](#third-party) ·
  [License](#license)

## Esia and EsiaGUI

| | Esia (this repository) | [EsiaGUI](https://github.com/0xDEADBEEFC0DEBABE/EsiaGUI) |
| --- | --- | --- |
| What | the engine: the UI core (`esia::core`), the renderer (`esia::render`: the Painter, the frame planner, liquid-glass materials, shadows, glows), text (`esia::text`, `esia::text_ft`), the RHI and its backends (`esia::backends`), the platform layers | Esia and a widget layer on it: `esia::ui`, the liquid-glass widgets (controls, lists, navigation, popups, text fields, data widgets, docking, plots, the island and the dock) |
| Examples | `glass_window` | `glass_window`, `showcase` (the widgets' demo), `workbench` (a tool's layout on the data widgets) |
| Changes | everything below the widgets | the widgets, their demos and documents |

EsiaGUI is this repository with the widget layer added: it shares Esia's history and takes every change made here
(it merges Esia's `main` as its upstream). A widget layer of your own goes on Esia the same way: the build adds
`src/esia/ui`, `tests/ui` and the examples on it when their directories exist.

## What is in it

| Part | State |
| --- | --- |
| UI core (`src/esia/core`) | ([UI_CORE.md](docs/UI_CORE.md)) ids, input (touch included), windows with per-window DPI, front-to-back hit testing, press and key ownership, containers and layout providers, child scroll regions, popups and tooltips, per-id state, draw lists, texture registry, debug checks for mistakes in UI code |
| Renderer (`src/esia/render`) | the Painter (rectangles, capsules, circles, lines, polylines, arcs, rings, sectors and areas as signed-distance shapes, shadows, inner and outer glow, images, icons, text, masks, scales, glow layers, edge fades), the frame planner, glyphs and flat tiles as instanced quads (32 bytes each, expanded on the GPU), liquid glass (backdrop captures, blur pyramid, refraction, dispersion), glow layers, edge fades, custom HLSL effects on Direct3D, GPU profiling |
| Text (`src/esia/text`) | analytic glyph rasterizer, glyph atlas, FreeType + HarfBuzz text system (bundled or the system's) with FreeType's rendering to choose from (hinting: light, the fonts' own with the v35 or v40 interpreter, the autohinter; its rasterizer, stem darkening, whole-pixel advances), sub-pixel (LCD) antialiasing from either rasterizer (dual-source blending on every backend but Direct3D 9, following the window's monitor on Windows), multi-channel distance fields (MTSDF, made by Esia: overlapping contours resolved, sharp corners at any scale) for large and transformed text and for text with any Painter material - outlines, glows, shadows, gradients, glass, weight - in one draw, hinted text that moves smoothly (drawn unhinted at quarter pixels while it moves, settling into its hinting when it stops), a halo that keeps text legible where the backdrop comes close to its color, system font lookup with fallback chains for every major script, color emoji from bitmap strikes (sbix, CBDT) and COLR fonts (gradients, transforms, composite modes), text outlines (glyphs grown by exact distance), bitmap fonts (BDF, PCF, Windows FNT / FON, pixel for pixel) |
| Backends (`src/esia/rhi/<name>`) | DirectX (Direct3D 9 / 10 / 11 / 12, in `rhi/directx`), OpenGL 3.3 / OpenGL ES 3.0, Vulkan 1.1+, Metal; and `rhi/null`, a device without a GPU that records the command stream and checks the call rules |
| Platform | layers as libraries for Win32 (`src/esia/platform/win32`, [PLATFORM_WIN32.md](docs/PLATFORM_WIN32.md)), X11 (`src/esia/platform/x11`) and Android (`src/esia/platform/android`); the example's own frames on AppKit (macOS) and UIKit (iOS) |
| Example | `glass_window`: the whole path (platform input, core, renderer, RHI, swap chain) in a window, on every system |

| Backend | CMake option | Systems | Verified on |
| --- | --- | --- | --- |
| DirectX: Direct3D 11, 12, 10, 9 | `ESIA_BACKEND_DIRECTX` | Windows | Windows 11, NVIDIA RTX 4080 SUPER and an AMD Radeon iGPU, debug layers (the tests: D3D12 GPU-based validation); WARP in CI; Direct3D 9 - 11 under Wine |
| OpenGL, OpenGL ES | `ESIA_BACKEND_OPENGL` | Windows, Linux, Android | NVIDIA (WGL), Mesa llvmpipe (WGL, EGL), VMware SVGA3D (EGL on X11), the Android 15 emulator (OpenGL ES) |
| Vulkan | `ESIA_BACKEND_VULKAN` | Windows, Linux, Android | NVIDIA and Mesa lavapipe, Khronos validation layer; the Android 15 emulator |
| Metal | `ESIA_BACKEND_METAL` | macOS, iOS | MacBook Pro (M3 Pro, macOS 27), GitHub's arm64 runner (macOS 15), iPhone 18 Pro Max (A20 Pro, iOS 27); Metal API and shader validation |

Every backend passes the conformance suite (17 scenes against golden images, single frame and across frames, with
the API's validation counted) on the hardware above; on the iPhone only the examples ran. CI runs it on Linux
(llvmpipe, lavapipe), on Windows (WARP: Direct3D 9 and Vulkan only compile there) and on macOS ([CI.md](docs/CI.md)).
Details and numbers are in [REWRITE_STATUS.md](docs/REWRITE_STATUS.md); each backend's `STATUS.md` is the dated
record of its bring-up.

| System | Library and tests | Example window |
| --- | --- | --- |
| Windows 10 / 11 | yes | yes: DirectX, OpenGL, Vulkan |
| Linux | yes | yes: OpenGL, Vulkan (X11, XWayland on Wayland) |
| macOS 11+ | yes | yes: Metal |
| iOS 16+ | the library (CI builds it); the tests do not run on iOS | yes: Metal |
| Android 9+ (API 28) | yes, on the Android 15 emulator (no real phone yet) | yes: OpenGL ES, Vulkan (APKs) |

## Building

Every system builds with a CMake preset, and the backends of the system are on by default: nothing to choose first.
The commands and what to install are in each system's section: [Windows](#windows), [Linux](#linux), [macOS](#macos),
[iOS](#ios), [Android](#android).

| System | Presets | Backends built by default |
| --- | --- | --- |
| Windows | `windows-msvc`, `windows-clang-cl` | DirectX (Direct3D 9, 10, 11, 12) and OpenGL; Vulkan too when the Vulkan SDK is installed |
| Linux | `linux-clang`, `linux-clang-release`; `windows-mingw-cross`, `windows-cross` build the Windows backends (from macOS too) | OpenGL; Vulkan too when the Vulkan headers are installed |
| macOS | `macos-clang` | Metal |
| iOS | `ios`, `ios-simulator` | Metal |
| Android (from any of them) | `android` | OpenGL ES and Vulkan |

* Configuring prints the list (`-- Esia backends: ...`). `-DESIA_BACKEND_<NAME>=ON` or `OFF` adds or drops one
  (`DIRECTX`, `OPENGL`, `VULKAN`, `METAL`); with DirectX on, the advanced `ESIA_BACKEND_D3D9` / `D3D10` / `D3D11` /
  `D3D12` leave out single Direct3D versions.
* `-DESIA_WERROR=ON` turns warnings into errors. CI builds these presets with it, without a warning: `windows-msvc`,
  `windows-clang-cl`, `linux-clang`, `linux-clang-release`, `windows-mingw-cross`, `macos-clang` and `ios`.
* Text: with `ESIA_TEXT_FREETYPE` on (the default), FreeType and HarfBuzz come from the system, or are downloaded at
  configure time and built with the project (`ESIA_TEXT_DEPS=auto|bundled|system`). Offline, point
  `FETCHCONTENT_SOURCE_DIR_ESIA_FREETYPE` / `..._HARFBUZZ` at extracted sources. How glyphs become pixels is the text
  system's `TextRendering` (`include/esia/text/text.hpp`): the design's outlines by default; the environment variable
  `ESIA_TEXT_RENDERING` sets it for any program (`crisp`, `light`, `native`, or settings such as
  `hinting=full,interpreter=35,rasterizer=freetype`, see `ParseTextRendering`).
* Every preset puts the example in `build/<preset>/bin` (Visual Studio's generator in `bin\Release` or `bin\Debug`;
  Android: an APK in `build/android/apk`). `ESIA_BUILD_EXAMPLES` builds it when Esia is the top-level project.
* Tests: `ctest --preset <preset>` runs them, the conformance suite on the machine's GPU included, for the presets
  that build them: `windows-msvc` (a Debug build: `cmake --build --preset windows-msvc-debug` first),
  `windows-clang-cl`, `linux-clang`, `linux-clang-release` and `macos-clang`. `ios`, `ios-simulator`, `android` and
  `windows-cross` build no tests.
* Benchmark: `esia_bench` (with the tests, `tests/bench/esia_bench.cpp`) draws fixed scenes - a page of Latin and
  Chinese text, a grid of controls (regular and flat), ten thousand shapes, twenty glass panels - through a headless
  device of any backend and prints each frame's build, submit and GPU time (median and 99th percentile) and what it
  uploads: `esia_bench --backend d3d11 --scene all`. Compare builds by alternating their runs on one machine.

## Using it in your project

Add the repository as a subdirectory, or install it and find its package; either way the targets have the same names:

```cmake
add_subdirectory(Esia)   # the example is left out when Esia is not the top-level project
# or, after `cmake --install build/<preset> --prefix <dir>` (and CMAKE_PREFIX_PATH=<dir> for the application):
find_package(Esia CONFIG REQUIRED)

target_link_libraries(my_app PRIVATE
    esia::render            # the Painter and the renderer, with the core and the text interface
    esia::text_ft           # the FreeType + HarfBuzz text system
    esia::backends          # every backend this build has, behind the RHI's registry
    esia::platform_win32)   # or esia::platform_x11, esia::platform_android; none on macOS and iOS
```

The install holds the static libraries of the backends that build had, their headers and the package
(`lib/cmake/Esia`); the package finds again what the libraries need (FreeType and HarfBuzz when they came from the
system, X11, fontconfig). `tests/package` is such an application, built and run by the `esia_package` test.

A frame is `Context::NewFrame`, the UI - windows (`Context::Begin` / `End`), items (`ItemAdd`, `ButtonBehavior`),
layout, drawing with a `Painter` on a window's draw list -, `Context::EndFrame`, then the renderer draws
`Context::GetDrawData()` into the host's target. `examples/glass_window` is the smallest complete program: its frame
(`app.hpp`, a `host_*.cpp` per API, a frame per system) and its UI (`scene.cpp`: a button, a text field and glass cards
on the core alone). The core's model, its items and how a widget is made on it are in [UI_CORE.md](docs/UI_CORE.md);
the Win32 layer in [PLATFORM_WIN32.md](docs/PLATFORM_WIN32.md). In a debug build, the core reports ids two items share
and items laid out of view ([UI_CORE.md](docs/UI_CORE.md) section 16).

## Running the example

```
glass_window                               # the core's windows, a button, a text field, glass over moving content
glass_window --api vulkan --vsync off      # another backend, uncapped frame rate
```

| Option | Meaning |
| --- | --- |
| `--api name` | the backend, where more than one is built: see [Windows](#windows), [Linux](#linux) and [Android](#android); macOS and iOS have Metal only |
| `--size WxH`, `--scale s` | client area in UI units (default 1280 x 800), and pixels per UI unit (default: the monitor's); `--size 1512x945 --scale 2` is 3024 x 1890 pixels. On iOS and Android the app takes the whole screen |
| `--vsync on \| off` | off: no frame cap |
| `--frames N`, `--screenshot out.png`, `--fixed-dt s` | quit after N frames, write the last one (alone: after 60 frames), advance the UI clock by `s` per frame (deterministic captures) |
| `--debug` | the API's validation layer; the message count is printed at exit |
| `--font file` | font files instead of the system's (the first is the main one, the others its fallbacks) |
| `--text-rendering spec` | how glyphs become pixels: `crisp` (the fonts' hints, the classic interpreter, whole pixels), `light`, `cleartype` (sub-pixel), `native` (the platform's look; on Windows the ClearType setup of the window's monitor, from monitor to monitor), `design` (the default), or settings: `hinting=none\|light\|full\|auto`, `interpreter=35\|40`, `rasterizer=analytic\|freetype`, `stem-darkening`, `hinted-advances`, `subpixel=none\|rgb\|bgr`, `lcd-filter=default\|light\|none`, `distance-field=N` (text of N pixels per em and more from distance fields), `smooth-motion[=0\|1]` (moving text unhinted at quarter pixels) |

## Windows

**Build.** With Visual Studio 2022 and nothing else (or open the folder in Visual Studio: it lists the presets):

```
cmake --preset windows-msvc
cmake --build --preset windows-msvc-release
```

The example is in `build\windows-msvc\bin\Release`. The tests: `cmake --build --preset windows-msvc-debug`, then
`ctest --preset windows-msvc`. With LLVM instead (clang-cl and lld on PATH, from an "x64 Native Tools" prompt):
`cmake --preset windows-clang-cl`, `cmake --build --preset windows-clang-cl`, `ctest --preset windows-clang-cl`.

**Things to know on Windows**

* **Path length.** Visual Studio's build fails on paths over 260 characters: keep the clone's path under about 140
  characters (`C:\Users\<you>\source\repos\Esia` is fine), or enable long paths in Windows.
* **Choosing the API.** `--api directx` (the default) starts the first Direct3D version that works on the machine: 11,
  then 12, 10, 9. `--api d3d11 | d3d12 | d3d10 | d3d9 | opengl | vulkan` picks one. The first line printed names the
  API and the GPU that started; the Direct3D hosts ask DXGI for the high-performance GPU.
* **Vulkan** needs the LunarG Vulkan SDK (https://vulkan.lunarg.com; its installer sets `VULKAN_SDK`) at configure
  time; without it the build has no Vulkan backend and says so.
* **Debug layers.** `--debug` turns on the Direct3D debug layer, which comes with Windows' optional feature "Graphics
  Tools", or the SDK's Khronos validation layer for Vulkan. The tests can add D3D12's GPU-based validation
  (`ESIA_D3D_DEBUG=2`).
* **Shaders.** The Direct3D backends compile their shaders at run time with `d3dcompiler_47.dll`, part of Windows; the
  example keeps them in `%LOCALAPPDATA%\Esia\ShaderCache` (`--no-shader-cache` compiles them again). The same compiler
  runs custom HLSL effects (`Renderer::SetEffectSource`): only the Direct3D backends run them; OpenGL and Vulkan draw
  those shapes with the built-in shader.
* **Fonts.** Segoe UI with the system's fallback chain (Microsoft YaHei, Yu Gothic UI, Malgun Gothic, Nirmala UI ...);
  color emoji come from Segoe UI Emoji, a COLR font painted with its gradients.
* **Mouse and touch.** The Win32 layer marks the mouse messages a touch screen makes, so a finger's drag can scroll
  from any item (the core's touch rules, [UI_CORE.md](docs/UI_CORE.md) section 5; not yet tried on touch hardware).
* **Wine.** Direct3D 9 - 11, OpenGL and Vulkan run under Wine (screenshots in
  `examples/glass_window/wine_screenshots`); the Direct3D 12 window host does not start there.
* **Cross-compiling** from Linux or macOS: `cmake --preset windows-mingw-cross` (MinGW-w64), or `windows-cross`
  (clang-cl with the Windows SDK from xwin; not built in CI).

## Linux

**Build.** clang, lld, Ninja and CMake; X11 for the example's window, EGL for OpenGL, the Vulkan headers for Vulkan,
fontconfig for the fonts (Ubuntu 24.04):

```
sudo apt install clang lld ninja-build cmake libfreetype-dev libharfbuzz-dev libfontconfig-dev libx11-dev libegl-dev libvulkan-dev
cmake --preset linux-clang
cmake --build --preset linux-clang && ctest --preset linux-clang
```

The example is `build/linux-clang/bin/glass_window` (`linux-clang-release` for an optimized build).

**Things to know on Linux**

* **The window** is an X11 window (the X11 platform layer `esia_platform_x11`, used by
  `examples/glass_window/app_linux.cpp`); on a Wayland desktop (Ubuntu's and Fedora's default) it runs through
  XWayland. `--api opengl` is the default (EGL on the window); `--api vulkan` uses `VK_KHR_xlib_surface`. The UI scale
  follows the desktop's scaling through `Xft.dpi`, or `--scale`.
* **Input.** Mouse, wheel, keyboard and the clipboard (`CLIPBOARD`). Text comes through the input method (IBus, Fcitx
  over XIM): what it commits arrives, but the composition is not shown inline yet.
* **Fonts.** The text system finds fonts through fontconfig when it is installed at configure time
  (`libfontconfig-dev`; `-DESIA_TEXT_FONTCONFIG=OFF` to not use it), otherwise by scanning the standard font
  directories. The UI font is Noto Sans (else DejaVu Sans), with Noto Sans CJK, WenQuanYi Zen Hei or Droid Sans
  Fallback for Chinese, Japanese and Korean, a Noto font for every other script (Arabic, Hebrew, the Indic scripts,
  Thai ...) and Noto Color Emoji: install `fonts-noto-core fonts-noto-cjk fonts-noto-color-emoji` for all of them.
* **Headless.** The tests need no window system: OpenGL runs through EGL without one (Mesa's llvmpipe, or the GPU's
  driver), Vulkan without a surface (lavapipe or the GPU's driver), so they run on servers and in CI. `--debug` and the
  tests use the Khronos validation layer when it is installed (`vulkan-validationlayers`).
* **Virtual machines.** In VMware, OpenGL needs 3D acceleration; on virtual hardware 21 (VMware Workstation 17, what
  was used) SVGA3D offers OpenGL 4.3 core. Older hardware versions offer less, down to OpenGL 2.1, which the OpenGL
  host refuses. VMware has no Vulkan driver: `--api vulkan` runs on lavapipe, on the CPU.
* **Custom HLSL effects** need Direct3D: on Linux those shapes draw with the built-in shader.

## macOS

**Build.** macOS 11 or later; Xcode (the SDK and the Metal compiler) and Homebrew:

```
brew install llvm lld ninja cmake freetype harfbuzz
xcodebuild -downloadComponent MetalToolchain     # only if `xcrun metal` says the Metal toolchain is missing
cmake --preset macos-clang
cmake --build --preset macos-clang && ctest --preset macos-clang
```

The example is `build/macos-clang/bin/glass_window`.

**Things to know on macOS**

* **Which Macs.** Apple silicon; Intel Macs should work but were never tried. The preset builds for the Mac it runs
  on: for macOS 11, add `-DCMAKE_OSX_DEPLOYMENT_TARGET=11.0` (CI compiles that; it ran on macOS 15 and 27 only).
  `macos-clang` is a Debug build; there is no release preset yet.
* **Validation.** `ctest` runs the Metal conformance suite on the Mac's GPU; set
  `MTL_DEBUG_LAYER=1 MTL_SHADER_VALIDATION=1` for Metal's API and shader validation (CI does). `--debug` turns on the
  API validation for the example.
* **Frame rate.** A window cannot present faster than the display: with `--vsync off` frames render into offscreen
  targets as fast as they can and the newest is presented each refresh.
* **Options of its own:** `--stats` prints once a second the frame rate, UI / encode / wait times, the GPU time of the
  frame's command buffer, passes, backdrop captures, frames shown and dropped. `--fullscreen` starts in full screen;
  `--fullscreen-at N` toggles full screen at frame N, `--hide-at N` hides the app after frame N (tests: the frame loop
  keeps its speed while hidden, and it declares itself latency critical, so macOS does not nap it).
* **Fonts.** The system fonts (SF, the fallback chain of `system_fonts_apple.cpp`, Apple Color Emoji). The fonts
  FreeType cannot read (PingFang's `hvgl` glyphs) go through Core Text.
* **Limitations.** Custom HLSL effects need Direct3D: Metal draws those shapes with the built-in shader. SF is a
  variable font and the FreeType text system loads its default instance: bold weights draw as regular.

## iOS

**Build** (iPhones and iPads, iOS 16 or later; on a Mac with Xcode). The example becomes an app bundle, signed after the
link with a provisioning profile Xcode has for it (`tools/ios/codesign.py`: sign in to Xcode with your Apple ID; a
development or ad hoc profile that lists the device). With the iPhone connected and unlocked:

```
cmake --preset ios && cmake --build --preset ios
xcrun devicectl list devices
xcrun devicectl device install app --device "<name>" build/ios/bin/glass_window.app
xcrun devicectl device process launch --console --device "<name>" org.esia.glass-window --stats
```

The simulator needs no signing: `cmake --preset ios-simulator && cmake --build --preset ios-simulator`, then
`xcrun simctl install booted build/ios-simulator/bin/glass_window.app` and
`xcrun simctl launch booted org.esia.glass-window`.

**Things to know on iOS**

* **Signing.** `-DESIA_IOS_PROVISIONING_PROFILE=<file>` picks the profile. Without a matching one the build warns and
  the bundle stays unsigned: a device does not install it. `-DESIA_IOS_BUNDLE_PREFIX=` sets the bundle identifiers'
  prefix (default `org.esia`: `org.esia.glass-window`).
* **Options** are launch arguments (`devicectl device process launch ... org.esia.glass-window --vsync off`). The app
  takes the whole screen; `--scale` defaults to the screen's (UI units are points). `--stats` prints the frame
  statistics as on macOS.
* **Input.** The first finger is the mouse, marked as a touch: a tap clicks, a drag along a scroll area scrolls it from
  anywhere; two fingers scroll anywhere. The keyboard comes up for text fields with the system's input methods (pinyin
  and the like compose inline); a hardware keyboard works.
* **Layout.** The frame passes on the safe area (`FrameParams::safeArea`: clear of the camera housing and the home
  indicator); glass_window keeps to it and stacks its windows.
* **Fonts.** As on macOS; the system's emoji (`emjc` strikes) go through Core Text.
* **Limitations.** As on macOS.

## Android

**Build** (from Windows, Linux or macOS). The Android NDK and SDK (a platform, build-tools and platform-tools; Android
Studio's SDK manager installs them), a JDK for the APK signing tools, CMake and Ninja:

```
export ANDROID_NDK_HOME=<the NDK> ANDROID_HOME=<the SDK>     # set ... in a Windows prompt
cmake --preset android
cmake --build --preset android
adb install build/android/apk/glass_window.apk
adb shell "am start -n org.esia.glass_window/android.app.NativeActivity -e args '--api vulkan'"
```

The example becomes an APK in `build/android/apk`, built for arm64 phones; `-DANDROID_ABI=x86_64` builds it for the
emulator. No Gradle and no Java code: the example is a shared library behind Android's `NativeActivity`, packed and
signed with a debug key by `tools/android/package.py`. Without the SDK's build-tools only the shared library is built.

**Things to know on Android**

* **Options** come from the launch intent's `args` extra (above: the whole command in one string, or the device's
  shell splits the options): `--api opengl` (OpenGL ES 3.0, the default) or `--api vulkan`, and the options of
  [Running the example](#running-the-example). stdout and stderr go to the log (`adb logcat -s esia`); a `--screenshot`
  lands in the app's files (`adb exec-out run-as org.esia.glass_window cat files/shot.png > shot.png`).
* **Packages** are `org.esia.<example>` (`ESIA_ANDROID_PACKAGE_PREFIX` changes the prefix).
* **Touch.** The first finger is the mouse, marked as a touch: a tap clicks, a drag along a scroll area scrolls it from
  anywhere; two fingers scroll anywhere. UI units are dp: the scale is the screen's density. The soft keyboard comes
  up for text fields; the clipboard is Android's. The safe area is the window's insets (the camera's cutout, the system
  bars, the gesture bar).
* **The app's lifetime.** Sent to the background, the app drops its window surface and keeps its device, textures and
  UI; brought back, it carries on where it was.
* **Fonts and icons.** Roboto, then a Noto font per script, Noto Color Emoji (a COLR font) and its flags font. Android
  has no icon font for apps: the example frame brings Google's Material Icons (Outlined, Apache License 2.0) for icon
  code points, downloaded when configuring (`ESIA_ANDROID_ICON_FONT` names a local copy for offline builds) and packed
  into each APK.
* **Tests.** The preset builds none (`BUILD_TESTING=OFF`); configured with `-DBUILD_TESTING=ON` they are command-line
  programs to run on the device through `adb shell`. They and the conformance suite passed on the Android 15 emulator
  (OpenGL ES and Vulkan, 2026-10-02).
* **Validation.** The Vulkan validation layer is not in the NDK, and `tools/android/package.py` does not pack it:
  `--debug` on Vulkan says it is missing (Android's loader would find Khronos' `libVkLayer_khronos_validation.so`
  among the APK's libraries). OpenGL ES debug output works where the driver has `KHR_debug`.
* **Limitations.** Verified on the emulator only (Android 15 on an RTX 4080 SUPER); input methods that compose
  (pinyin, kana) do not reach a NativeActivity, so only directly typed text arrives; custom HLSL effects need Direct3D.

## Changing the shaders

`src/esia/shaders/generated` (SPIR-V, GLSL, ESSL, MSL) is generated from the HLSL in `src/esia/shaders` by
`tools/shaders/build_shaders.py`, with the glslang and SPIRV-Cross of Ubuntu 24.04 (CI checks the files byte for byte).
Without those packages, push the shader change to a branch named `shaders/<anything>`: the `Shaders` workflow
regenerates the library and commits it to that branch ([CI.md](docs/CI.md), section 5). Take the generated files into
the commit for `main` and delete the branch.

## Documents

* [CI.md](docs/CI.md): the GitHub Actions jobs (Linux, Windows, macOS), what they prove, how to reproduce them.
* [REWRITE.md](docs/REWRITE.md): the architecture (layers, renderer, RHI, shaders, text, threading, phases).
* [UI_CORE.md](docs/UI_CORE.md): the UI core (input, hit testing, layout, windows, scrolling, popups, debug checks)
  and how widgets are made on it.
* [PLATFORM_WIN32.md](docs/PLATFORM_WIN32.md): the Win32 platform layer and `glass_window`.
* [REWRITE_STATUS.md](docs/REWRITE_STATUS.md): what is done and verified, known issues, next steps (the record from
  before the split names EsiaGUI's widgets and examples too).
* [backends/README.md](docs/backends/README.md): how to write and test an RHI backend.
* The backends' bring-up records: [DirectX](src/esia/rhi/directx/common/STATUS.md),
  [OpenGL](src/esia/rhi/opengl/STATUS.md), [Vulkan](src/esia/rhi/vulkan/STATUS.md), [Metal](src/esia/rhi/metal/STATUS.md).
* [tests/fonts/README.md](tests/fonts/README.md): where the test fonts come from.
* The widget layer: EsiaGUI's [UI_WIDGETS.md](https://github.com/0xDEADBEEFC0DEBABE/EsiaGUI/blob/main/docs/UI_WIDGETS.md).

## Roadmap

1. Text: the bidi algorithm, variable-font instances (SF's weights), fallback per language and fallback fonts
   loaded when first needed.
2. Platform layers: Cocoa and UIKit as libraries (the example's AppKit and UIKit frames are the start), then Wayland,
   SDL, and inline IME composition on Linux and Android.
3. Performance: fewer render-pass breaks per backdrop capture on tile-based GPUs; FX feature variants on Vulkan and
   OpenGL (the specialization constant is already in the shader library).
4. An API reference; vcpkg and Conan ports.
5. Android on real phones (Adreno, Mali GPUs; Android before 15), the Vulkan validation layer in debug APKs.

Known issues (no device-loss handling yet; sRGB targets blend in linear light) are in
[REWRITE_STATUS.md](docs/REWRITE_STATUS.md), section 6.

## Third-party

The text tests use DroidSans (Apache License 2.0), Karla and a subset of Noto Sans SC (SIL Open Font License 1.1) in
`tests/fonts` ([its README](tests/fonts/README.md)). With `ESIA_TEXT_FREETYPE` on (the default), FreeType (FreeType
License) and HarfBuzz (MIT) come from the system or are downloaded at configure time and built from source:
`ESIA_TEXT_DEPS=auto|bundled|system`. The Android example downloads Google's Material Icons (Outlined, Apache License
2.0) at configure time and packs the font into its APK, and compiles the NDK's `android_native_app_glue`.

## License

Esia is under the MIT License: [LICENSE](LICENSE). The third-party fonts and libraries above keep their own licenses.
