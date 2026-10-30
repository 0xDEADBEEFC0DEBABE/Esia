#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

struct WgtFrame
{
    float4 gXform;
    float4 gTarget;
    float4 gDisplay;
    float4 gTime;
    float4 gLevel[6];
    float4 gText;
    float4 gConv;
};

struct WgtDraw
{
    float4 gFade;
    float4 gDrawInfo;
};

constant float2 _2498 = {};

constant spvUnsafeArray<float4, 13> _531 = spvUnsafeArray<float4, 13>({ float4(0.0), float4(0.01659999974071979522705078125, -0.080700002610683441162109375, 0.22269999980926513671875, -0.075099997222423553466796875), float4(0.0350000001490116119384765625, -0.17599999904632568359375, 0.43250000476837158203125, -0.1369999945163726806640625), float4(0.0542999990284442901611328125, -0.2820999920368194580078125, 0.63020002841949462890625, -0.18760000169277191162109375), float4(0.07389999926090240478515625, -0.3962999880313873291015625, 0.816699981689453125, -0.22869999706745147705078125), float4(0.09329999983310699462890625, -0.516099989414215087890625, 0.992600023746490478515625, -0.2615999877452850341796875), float4(0.112099997699260711669921875, -0.63950002193450927734375, 1.15880000591278076171875, -0.287699997425079345703125), float4(0.12999999523162841796875, -0.764900028705596923828125, 1.31589996814727783203125, -0.3079999983310699462890625), float4(0.146899998188018798828125, -0.891099989414215087890625, 1.4644000530242919921875, -0.3233999907970428466796875), float4(0.162699997425079345703125, -1.0169999599456787109375, 1.60510003566741943359375, -0.33469998836517333984375), float4(0.1773000061511993408203125, -1.1419999599456787109375, 1.73849999904632568359375, -0.34259998798370361328125), float4(0.19079999625682830810546875, -1.26520001888275146484375, 1.8650000095367431640625, -0.3476000130176544189453125), float4(0.2030999958515167236328125, -1.3863999843597412109375, 1.9851000308990478515625, -0.3501000106334686279296875) });

struct esia_main_out
{
    float4 _entryPointOutput_color [[color(0)]];
    float4 _entryPointOutput_alpha [[color(0), index(1)]];
};

struct esia_main_in
{
    float4 i_col [[user(locn0)]];
    float2 i_uv [[user(locn1)]];
    float4 i_shapeRect [[user(locn2), flat]];
    float4 i_shape [[user(locn3), flat]];
    float2 i_kind [[user(locn4), flat]];
};

fragment esia_main_out esia_main(esia_main_in in [[stage_in]], constant WgtFrame& _119 [[buffer(0)]], constant WgtDraw& _151 [[buffer(2)]], texture2d<float> gTex [[texture(3)]], sampler gLinear [[sampler(11)]], float4 gl_FragCoord [[position]])
{
    esia_main_out out = {};
    float4 _2496;
    float4 _2497;
    do
    {
        float4 _1115 = gTex.sample(gLinear, in.i_uv);
        if (in.i_kind.x > (-0.5))
        {
            float _1170 = floor(in.i_kind.x + 0.5);
            float _1173 = fast::max(in.i_kind.y, 9.9999997473787516355514526367188e-05);
            float _2490;
            if (_1170 > 4.5)
            {
                float2 _1294 = in.i_uv - in.i_shapeRect.xy;
                float _2489;
                if (_1170 < 5.5)
                {
                    _2489 = fast::clamp((in.i_shape.y - abs(dot(_1294, fast::normalize(float2(in.i_shapeRect.y - in.i_shapeRect.w, in.i_shapeRect.z - in.i_shapeRect.x))))) / fast::max(in.i_shape.y - in.i_shape.x, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                }
                else
                {
                    float _1325 = floor(in.i_shape.z + 0.5);
                    float _1327 = 3.1415927410125732421875 / _1325;
                    float2 _1331 = fast::normalize(in.i_shapeRect.xy - in.i_shapeRect.zw);
                    float2 _1337 = float2(-_1331.y, _1331.x);
                    float _1355 = (fast::clamp(floor(precise::atan2(fast::max(dot(_1294, _1331), 0.0), dot(_1294, _1337)) / _1327), 0.0, _1325 - 1.0) + 0.5) * _1327;
                    float _1358 = cos(1.57079637050628662109375 / _1325);
                    _2489 = (dot(_1294, _1294) < 9.9999999600419720025001879548654e-13) ? 1.0 : fast::clamp(((in.i_shape.y * _1358) - dot(_1294, (_1337 * cos(_1355)) + (_1331 * sin(_1355)))) / fast::max((in.i_shape.y - in.i_shape.x) * _1358, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                }
                _2490 = _2489;
            }
            else
            {
                float _2491;
                if (_1170 < 3.5)
                {
                    float _2488;
                    if (_1170 >= 1.5)
                    {
                        float2 _1396 = in.i_uv - in.i_shapeRect.xy;
                        float2 _1399 = in.i_shapeRect.zw - in.i_shapeRect.xy;
                        _2488 = length(_1396 - (_1399 * fast::clamp(dot(_1396, _1399) / fast::max(dot(_1399, _1399), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_shape.x;
                    }
                    else
                    {
                        float2 _1209 = in.i_uv - ((in.i_shapeRect.xy + in.i_shapeRect.zw) * 0.5);
                        float2 _1218 = fast::max((in.i_shapeRect.zw - in.i_shapeRect.xy) * 0.5, float2(0.001000000047497451305389404296875));
                        float _1464 = fast::min(_1218.x, _1218.y);
                        float _1467 = fast::min((_1209.x > 0.0) ? ((_1209.y > 0.0) ? in.i_shape.x : in.i_shape.x) : ((_1209.y > 0.0) ? in.i_shape.x : in.i_shape.x), _1464);
                        float _1473 = _1467 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _2484;
                        float _2485;
                        if (_1473 > _1464)
                        {
                            float _1487 = in.i_shape.y * fast::clamp((_1464 - _1467) / fast::max(0.60000002384185791015625 * _1467, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _2485 = _1487;
                            _2484 = _1467 * (1.0 + (0.60000002384185791015625 * _1487));
                        }
                        else
                        {
                            _2485 = in.i_shape.y;
                            _2484 = _1473;
                        }
                        float2 _1516 = (abs(_1209) - _1218) + float2(_2484);
                        float2 _1518 = fast::max(_1516, float2(0.0));
                        float _2486;
                        if ((_1518.x > 0.0) && (_1518.y > 0.0))
                        {
                            float _2487;
                            if ((_2485 > 0.001000000047497451305389404296875) && (_2484 > 9.9999997473787516355514526367188e-05))
                            {
                                float _1535 = 2.0 + (2.0 * _2485);
                                float2 _1540 = _1518 / float2(fast::max(_2484, 9.9999997473787516355514526367188e-05));
                                _2487 = pow(pow(_1540.x, _1535) + pow(_1540.y, _1535), 1.0 / _1535) * _2484;
                            }
                            else
                            {
                                _2487 = length(_1518);
                            }
                            _2486 = _2487;
                        }
                        else
                        {
                            _2486 = fast::max(_1518.x, _1518.y);
                        }
                        _2488 = (fast::min(fast::max(_1516.x, _1516.y), 0.0) + _2486) - _2484;
                    }
                    _2491 = ((_1170 - (2.0 * floor(_1170 * 0.5))) > 0.5) ? (fast::clamp(0.5 - ((_2488 - (in.i_shape.z * in.i_shape.w)) / _1173), 0.0, 1.0) - fast::clamp(0.5 - ((_2488 + (in.i_shape.z * (1.0 - in.i_shape.w))) / _1173), 0.0, 1.0)) : fast::clamp(0.5 - (_2488 / _1173), 0.0, 1.0);
                }
                else
                {
                    _2491 = 1.0;
                }
                _2490 = _2491;
            }
            float2 _1584 = gl_FragCoord.xy + _119.gConv.yy;
            float2 _2492;
            if (_119.gConv.x > 0.5)
            {
                float2 _2412;
                _2412.y = _119.gTarget.y - _1584.y;
                _2492 = _2412;
            }
            else
            {
                _2492 = _1584;
            }
            float _2493;
            if (_151.gFade.z > 0.0)
            {
                _2493 = smoothstep(0.0, 1.0, fast::clamp((_2492.y - _151.gFade.x) / _151.gFade.z, 0.0, 1.0));
            }
            else
            {
                _2493 = 1.0;
            }
            float _2494;
            if (_151.gFade.w > 0.0)
            {
                _2494 = _2493 * smoothstep(0.0, 1.0, fast::clamp((_151.gFade.y - _2492.y) / _151.gFade.w, 0.0, 1.0));
            }
            else
            {
                _2494 = _2493;
            }
            float _1150 = (in.i_col.w * _2490) * _2494;
            float4 _1642 = float4(in.i_col.xyz, 1.0);
            float4 _2495;
            if (_119.gTime.w > 0.5)
            {
                float3 _1683 = fast::clamp(_1642.xyz, float3(0.0), float3(1.0));
                float3 _1695 = select(pow((_1683 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _1683 * float3(0.077399380505084991455078125), _1683 <= float3(0.040449999272823333740234375));
                float4 _2414 = _1642;
                _2414.x = _1695.x;
                _2414.y = _1695.y;
                _2414.z = _1695.z;
                _2495 = _2414;
            }
            else
            {
                _2495 = _1642;
            }
            _2497 = _2495;
            _2496 = float4(_1150, _1150, _1150, fast::max(_1150, fast::max(_1150, _1150)));
            break;
        }
        float3 _2479;
        if ((_1115.x == _1115.y) && (_1115.y == _1115.z))
        {
            float _1737 = _1115.x;
            float _1830 = _119.gText.y * fast::clamp(4.0 * (0.75 - dot(in.i_col.xyz, float3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375))), 0.0, 1.0);
            float _1814 = dot(in.i_col.xyz, float3(0.25, 0.5, 0.25));
            float _1841 = (_1737 * (_1830 + 1.0)) / ((_1737 * _1830) + 1.0);
            float _1882 = fast::clamp((_119.gText.x - 1.0) * 10.0, 0.0, 12.0);
            int _1885 = min(int(_1882), 11);
            float4 _1899 = mix(_531[_1885], _531[_1885 + 1], float4(_1882 - float(_1885))) * 0.25;
            _2479 = float3(fast::clamp(_1841 + ((_1841 * (1.0 - _1841)) * ((((_1899.x * _1814) + _1899.y) * _1841) + ((_1899.z * _1814) + _1899.w))), 0.0, 1.0));
        }
        else
        {
            float3 _1750 = mix(_1115.www, _1115.xyz, float3(_119.gText.w));
            float _1908 = _119.gText.z * fast::clamp(4.0 * (0.75 - dot(in.i_col.xyz, float3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375))), 0.0, 1.0);
            float _1757 = _1750.x;
            float _1919 = (_1757 * (_1908 + 1.0)) / ((_1757 * _1908) + 1.0);
            float _1960 = fast::clamp((_119.gText.x - 1.0) * 10.0, 0.0, 12.0);
            int _1963 = min(int(_1960), 11);
            float4 _1977 = mix(_531[_1963], _531[_1963 + 1], float4(_1960 - float(_1963))) * 0.25;
            float _1767 = _1750.y;
            float _1988 = (_1767 * (_1908 + 1.0)) / ((_1767 * _1908) + 1.0);
            float _2029 = fast::clamp((_119.gText.x - 1.0) * 10.0, 0.0, 12.0);
            int _2032 = min(int(_2029), 11);
            float4 _2046 = mix(_531[_2032], _531[_2032 + 1], float4(_2029 - float(_2032))) * 0.25;
            float _1777 = _1750.z;
            float _2057 = (_1777 * (_1908 + 1.0)) / ((_1777 * _1908) + 1.0);
            float _2098 = fast::clamp((_119.gText.x - 1.0) * 10.0, 0.0, 12.0);
            int _2101 = min(int(_2098), 11);
            float4 _2115 = mix(_531[_2101], _531[_2101 + 1], float4(_2098 - float(_2101))) * 0.25;
            _2479 = float3(fast::clamp(_1919 + ((_1919 * (1.0 - _1919)) * ((((_1977.x * in.i_col.x) + _1977.y) * _1919) + ((_1977.z * in.i_col.x) + _1977.w))), 0.0, 1.0), fast::clamp(_1988 + ((_1988 * (1.0 - _1988)) * ((((_2046.x * in.i_col.y) + _2046.y) * _1988) + ((_2046.z * in.i_col.y) + _2046.w))), 0.0, 1.0), fast::clamp(_2057 + ((_2057 * (1.0 - _2057)) * ((((_2115.x * in.i_col.z) + _2115.y) * _2057) + ((_2115.z * in.i_col.z) + _2115.w))), 0.0, 1.0));
        }
        float2 _2124 = gl_FragCoord.xy + _119.gConv.yy;
        float2 _2480;
        if (_119.gConv.x > 0.5)
        {
            float2 _2458;
            _2458.y = _119.gTarget.y - _2124.y;
            _2480 = _2458;
        }
        else
        {
            _2480 = _2124;
        }
        float _2481;
        if (_151.gFade.z > 0.0)
        {
            _2481 = smoothstep(0.0, 1.0, fast::clamp((_2480.y - _151.gFade.x) / _151.gFade.z, 0.0, 1.0));
        }
        else
        {
            _2481 = 1.0;
        }
        float _2482;
        if (_151.gFade.w > 0.0)
        {
            _2482 = _2481 * smoothstep(0.0, 1.0, fast::clamp((_151.gFade.y - _2480.y) / _151.gFade.w, 0.0, 1.0));
        }
        else
        {
            _2482 = _2481;
        }
        float3 _1795 = _2479 * (in.i_col.w * _2482);
        float4 _2182 = float4(in.i_col.xyz, 1.0);
        float4 _2483;
        if (_119.gTime.w > 0.5)
        {
            float3 _2223 = fast::clamp(_2182.xyz, float3(0.0), float3(1.0));
            float3 _2235 = select(pow((_2223 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _2223 * float3(0.077399380505084991455078125), _2223 <= float3(0.040449999272823333740234375));
            float4 _2460 = _2182;
            _2460.x = _2235.x;
            _2460.y = _2235.y;
            _2460.z = _2235.z;
            _2483 = _2460;
        }
        else
        {
            _2483 = _2182;
        }
        _2497 = _2483;
        _2496 = float4(_1795, fast::max(_1795.x, fast::max(_1795.y, _1795.z)));
        break;
    } while(false);
    out._entryPointOutput_color = _2497;
    out._entryPointOutput_alpha = _2496;
    return out;
}

