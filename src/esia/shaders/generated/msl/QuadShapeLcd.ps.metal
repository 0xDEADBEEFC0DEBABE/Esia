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

constant float2 _2467 = {};

constant spvUnsafeArray<float4, 13> _491 = spvUnsafeArray<float4, 13>({ float4(0.0), float4(0.01659999974071979522705078125, -0.080700002610683441162109375, 0.22269999980926513671875, -0.075099997222423553466796875), float4(0.0350000001490116119384765625, -0.17599999904632568359375, 0.43250000476837158203125, -0.1369999945163726806640625), float4(0.0542999990284442901611328125, -0.2820999920368194580078125, 0.63020002841949462890625, -0.18760000169277191162109375), float4(0.07389999926090240478515625, -0.3962999880313873291015625, 0.816699981689453125, -0.22869999706745147705078125), float4(0.09329999983310699462890625, -0.516099989414215087890625, 0.992600023746490478515625, -0.2615999877452850341796875), float4(0.112099997699260711669921875, -0.63950002193450927734375, 1.15880000591278076171875, -0.287699997425079345703125), float4(0.12999999523162841796875, -0.764900028705596923828125, 1.31589996814727783203125, -0.3079999983310699462890625), float4(0.146899998188018798828125, -0.891099989414215087890625, 1.4644000530242919921875, -0.3233999907970428466796875), float4(0.162699997425079345703125, -1.0169999599456787109375, 1.60510003566741943359375, -0.33469998836517333984375), float4(0.1773000061511993408203125, -1.1419999599456787109375, 1.73849999904632568359375, -0.34259998798370361328125), float4(0.19079999625682830810546875, -1.26520001888275146484375, 1.8650000095367431640625, -0.3476000130176544189453125), float4(0.2030999958515167236328125, -1.3863999843597412109375, 1.9851000308990478515625, -0.3501000106334686279296875) });

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
    float i_kind [[user(locn4), flat]];
};

fragment esia_main_out esia_main(esia_main_in in [[stage_in]], constant WgtFrame& _107 [[buffer(0)]], constant WgtDraw& _139 [[buffer(2)]], texture2d<float> gTex [[texture(3)]], sampler gLinear [[sampler(11)]], float4 gl_FragCoord [[position]])
{
    esia_main_out out = {};
    float4 _2465;
    float4 _2466;
    do
    {
        float4 _1100 = gTex.sample(gLinear, in.i_uv);
        float _1103 = dfdx(in.i_uv.x);
        float _1107 = dfdy(in.i_uv.x);
        float _1110 = fast::max(abs(_1103) + abs(_1107), 9.9999997473787516355514526367188e-05);
        if (in.i_kind > (-0.5))
        {
            float _2460;
            do
            {
                float _1169 = floor(in.i_kind + 0.5);
                if (_1169 > 4.5)
                {
                    float _2459;
                    do
                    {
                        float2 _1293 = in.i_uv - in.i_shapeRect.xy;
                        if (_1169 < 5.5)
                        {
                            _2459 = fast::clamp((in.i_shape.y - abs(dot(_1293, fast::normalize(float2(in.i_shapeRect.y - in.i_shapeRect.w, in.i_shapeRect.z - in.i_shapeRect.x))))) / fast::max(in.i_shape.y - in.i_shape.x, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                            break;
                        }
                        if (dot(_1293, _1293) < 9.9999999600419720025001879548654e-13)
                        {
                            _2459 = 1.0;
                            break;
                        }
                        float _1330 = floor(in.i_shape.z + 0.5);
                        float _1332 = 3.1415927410125732421875 / _1330;
                        float2 _1336 = fast::normalize(in.i_shapeRect.xy - in.i_shapeRect.zw);
                        float2 _1342 = float2(-_1336.y, _1336.x);
                        float _1360 = (fast::clamp(floor(precise::atan2(fast::max(dot(_1293, _1336), 0.0), dot(_1293, _1342)) / _1332), 0.0, _1330 - 1.0) + 0.5) * _1332;
                        float _1363 = cos(1.57079637050628662109375 / _1330);
                        _2459 = fast::clamp(((in.i_shape.y * _1363) - dot(_1293, (_1342 * cos(_1360)) + (_1336 * sin(_1360)))) / fast::max((in.i_shape.y - in.i_shape.x) * _1363, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                        break;
                    } while(false);
                    _2460 = _2459;
                    break;
                }
                if (_1169 > 3.5)
                {
                    _2460 = 1.0;
                    break;
                }
                float _2458;
                if (_1169 >= 1.5)
                {
                    float2 _1396 = in.i_uv - in.i_shapeRect.xy;
                    float2 _1399 = in.i_shapeRect.zw - in.i_shapeRect.xy;
                    _2458 = length(_1396 - (_1399 * fast::clamp(dot(_1396, _1399) / fast::max(dot(_1399, _1399), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_shape.x;
                }
                else
                {
                    float2 _1206 = in.i_uv - ((in.i_shapeRect.xy + in.i_shapeRect.zw) * 0.5);
                    float2 _1215 = fast::max((in.i_shapeRect.zw - in.i_shapeRect.xy) * 0.5, float2(0.001000000047497451305389404296875));
                    float _1452 = fast::min(_1215.x, _1215.y);
                    float _1455 = fast::min((_1206.x > 0.0) ? ((_1206.y > 0.0) ? in.i_shape.x : in.i_shape.x) : ((_1206.y > 0.0) ? in.i_shape.x : in.i_shape.x), _1452);
                    float _1461 = _1455 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                    float _2452;
                    float _2453;
                    if (_1461 > _1452)
                    {
                        float _1475 = in.i_shape.y * fast::clamp((_1452 - _1455) / fast::max(0.60000002384185791015625 * _1455, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _2453 = _1475;
                        _2452 = _1455 * (1.0 + (0.60000002384185791015625 * _1475));
                    }
                    else
                    {
                        _2453 = in.i_shape.y;
                        _2452 = _1461;
                    }
                    float2 _1488 = (abs(_1206) - _1215) + float2(_2452);
                    float2 _1490 = fast::max(_1488, float2(0.0));
                    float _2454;
                    if ((_1490.x > 0.0) && (_1490.y > 0.0))
                    {
                        float _2455;
                        if ((_2453 > 0.001000000047497451305389404296875) && (_2452 > 9.9999997473787516355514526367188e-05))
                        {
                            float _1507 = 2.0 + (2.0 * _2453);
                            float2 _1512 = _1490 / float2(fast::max(_2452, 9.9999997473787516355514526367188e-05));
                            _2455 = pow(pow(_1512.x, _1507) + pow(_1512.y, _1507), 1.0 / _1507) * _2452;
                        }
                        else
                        {
                            _2455 = length(_1490);
                        }
                        _2454 = _2455;
                    }
                    else
                    {
                        _2454 = fast::max(_1490.x, _1490.y);
                    }
                    _2458 = (fast::min(fast::max(_1488.x, _1488.y), 0.0) + _2454) - _2452;
                }
                if ((_1169 - (2.0 * floor(_1169 * 0.5))) > 0.5)
                {
                    _2460 = fast::clamp(0.5 - ((_2458 - (in.i_shape.z * in.i_shape.w)) / _1110), 0.0, 1.0) - fast::clamp(0.5 - ((_2458 + (in.i_shape.z * (1.0 - in.i_shape.w))) / _1110), 0.0, 1.0);
                    break;
                }
                _2460 = fast::clamp(0.5 - (_2458 / _1110), 0.0, 1.0);
                break;
            } while(false);
            float2 _1556 = gl_FragCoord.xy + _107.gConv.yy;
            float2 _2461;
            if (_107.gConv.x > 0.5)
            {
                float2 _2380;
                _2380.y = _107.gTarget.y - _1556.y;
                _2461 = _2380;
            }
            else
            {
                _2461 = _1556;
            }
            float _2462;
            if (_139.gFade.z > 0.0)
            {
                _2462 = smoothstep(0.0, 1.0, fast::clamp((_2461.y - _139.gFade.x) / _139.gFade.z, 0.0, 1.0));
            }
            else
            {
                _2462 = 1.0;
            }
            float _2463;
            if (_139.gFade.w > 0.0)
            {
                _2463 = _2462 * smoothstep(0.0, 1.0, fast::clamp((_139.gFade.y - _2461.y) / _139.gFade.w, 0.0, 1.0));
            }
            else
            {
                _2463 = _2462;
            }
            float _1148 = (in.i_col.w * _2460) * _2463;
            float4 _1614 = float4(in.i_col.xyz, 1.0);
            float4 _2464;
            if (_107.gTime.w > 0.5)
            {
                float3 _1655 = fast::clamp(_1614.xyz, float3(0.0), float3(1.0));
                float3 _1667 = select(pow((_1655 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _1655 * float3(0.077399380505084991455078125), _1655 <= float3(0.040449999272823333740234375));
                float4 _2382 = _1614;
                _2382.x = _1667.x;
                _2382.y = _1667.y;
                _2382.z = _1667.z;
                _2464 = _2382;
            }
            else
            {
                _2464 = _1614;
            }
            _2466 = _2464;
            _2465 = float4(_1148, _1148, _1148, fast::max(_1148, fast::max(_1148, _1148)));
            break;
        }
        float3 _2447;
        if ((_1100.x == _1100.y) && (_1100.y == _1100.z))
        {
            float _1709 = _1100.x;
            float _1802 = _107.gText.y * fast::clamp(4.0 * (0.75 - dot(in.i_col.xyz, float3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375))), 0.0, 1.0);
            float _1786 = dot(in.i_col.xyz, float3(0.25, 0.5, 0.25));
            float _1813 = (_1709 * (_1802 + 1.0)) / ((_1709 * _1802) + 1.0);
            float _1854 = fast::clamp((_107.gText.x - 1.0) * 10.0, 0.0, 12.0);
            int _1857 = min(int(_1854), 11);
            float4 _1871 = mix(_491[_1857], _491[_1857 + 1], float4(_1854 - float(_1857))) * 0.25;
            _2447 = float3(fast::clamp(_1813 + ((_1813 * (1.0 - _1813)) * ((((_1871.x * _1786) + _1871.y) * _1813) + ((_1871.z * _1786) + _1871.w))), 0.0, 1.0));
        }
        else
        {
            float3 _1722 = mix(_1100.www, _1100.xyz, float3(_107.gText.w));
            float _1880 = _107.gText.z * fast::clamp(4.0 * (0.75 - dot(in.i_col.xyz, float3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375))), 0.0, 1.0);
            float _1729 = _1722.x;
            float _1891 = (_1729 * (_1880 + 1.0)) / ((_1729 * _1880) + 1.0);
            float _1932 = fast::clamp((_107.gText.x - 1.0) * 10.0, 0.0, 12.0);
            int _1935 = min(int(_1932), 11);
            float4 _1949 = mix(_491[_1935], _491[_1935 + 1], float4(_1932 - float(_1935))) * 0.25;
            float _1739 = _1722.y;
            float _1960 = (_1739 * (_1880 + 1.0)) / ((_1739 * _1880) + 1.0);
            float _2001 = fast::clamp((_107.gText.x - 1.0) * 10.0, 0.0, 12.0);
            int _2004 = min(int(_2001), 11);
            float4 _2018 = mix(_491[_2004], _491[_2004 + 1], float4(_2001 - float(_2004))) * 0.25;
            float _1749 = _1722.z;
            float _2029 = (_1749 * (_1880 + 1.0)) / ((_1749 * _1880) + 1.0);
            float _2070 = fast::clamp((_107.gText.x - 1.0) * 10.0, 0.0, 12.0);
            int _2073 = min(int(_2070), 11);
            float4 _2087 = mix(_491[_2073], _491[_2073 + 1], float4(_2070 - float(_2073))) * 0.25;
            _2447 = float3(fast::clamp(_1891 + ((_1891 * (1.0 - _1891)) * ((((_1949.x * in.i_col.x) + _1949.y) * _1891) + ((_1949.z * in.i_col.x) + _1949.w))), 0.0, 1.0), fast::clamp(_1960 + ((_1960 * (1.0 - _1960)) * ((((_2018.x * in.i_col.y) + _2018.y) * _1960) + ((_2018.z * in.i_col.y) + _2018.w))), 0.0, 1.0), fast::clamp(_2029 + ((_2029 * (1.0 - _2029)) * ((((_2087.x * in.i_col.z) + _2087.y) * _2029) + ((_2087.z * in.i_col.z) + _2087.w))), 0.0, 1.0));
        }
        float2 _2096 = gl_FragCoord.xy + _107.gConv.yy;
        float2 _2448;
        if (_107.gConv.x > 0.5)
        {
            float2 _2426;
            _2426.y = _107.gTarget.y - _2096.y;
            _2448 = _2426;
        }
        else
        {
            _2448 = _2096;
        }
        float _2449;
        if (_139.gFade.z > 0.0)
        {
            _2449 = smoothstep(0.0, 1.0, fast::clamp((_2448.y - _139.gFade.x) / _139.gFade.z, 0.0, 1.0));
        }
        else
        {
            _2449 = 1.0;
        }
        float _2450;
        if (_139.gFade.w > 0.0)
        {
            _2450 = _2449 * smoothstep(0.0, 1.0, fast::clamp((_139.gFade.y - _2448.y) / _139.gFade.w, 0.0, 1.0));
        }
        else
        {
            _2450 = _2449;
        }
        float3 _1767 = _2447 * (in.i_col.w * _2450);
        float4 _2154 = float4(in.i_col.xyz, 1.0);
        float4 _2451;
        if (_107.gTime.w > 0.5)
        {
            float3 _2195 = fast::clamp(_2154.xyz, float3(0.0), float3(1.0));
            float3 _2207 = select(pow((_2195 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _2195 * float3(0.077399380505084991455078125), _2195 <= float3(0.040449999272823333740234375));
            float4 _2428 = _2154;
            _2428.x = _2207.x;
            _2428.y = _2207.y;
            _2428.z = _2207.z;
            _2451 = _2428;
        }
        else
        {
            _2451 = _2154;
        }
        _2466 = _2451;
        _2465 = float4(_1767, fast::max(_1767.x, fast::max(_1767.y, _1767.z)));
        break;
    } while(false);
    out._entryPointOutput_color = _2466;
    out._entryPointOutput_alpha = _2465;
    return out;
}

