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

constant float2 _1925 = {};

constant spvUnsafeArray<float4, 13> _485 = spvUnsafeArray<float4, 13>({ float4(0.0), float4(0.01659999974071979522705078125, -0.080700002610683441162109375, 0.22269999980926513671875, -0.075099997222423553466796875), float4(0.0350000001490116119384765625, -0.17599999904632568359375, 0.43250000476837158203125, -0.1369999945163726806640625), float4(0.0542999990284442901611328125, -0.2820999920368194580078125, 0.63020002841949462890625, -0.18760000169277191162109375), float4(0.07389999926090240478515625, -0.3962999880313873291015625, 0.816699981689453125, -0.22869999706745147705078125), float4(0.09329999983310699462890625, -0.516099989414215087890625, 0.992600023746490478515625, -0.2615999877452850341796875), float4(0.112099997699260711669921875, -0.63950002193450927734375, 1.15880000591278076171875, -0.287699997425079345703125), float4(0.12999999523162841796875, -0.764900028705596923828125, 1.31589996814727783203125, -0.3079999983310699462890625), float4(0.146899998188018798828125, -0.891099989414215087890625, 1.4644000530242919921875, -0.3233999907970428466796875), float4(0.162699997425079345703125, -1.0169999599456787109375, 1.60510003566741943359375, -0.33469998836517333984375), float4(0.1773000061511993408203125, -1.1419999599456787109375, 1.73849999904632568359375, -0.34259998798370361328125), float4(0.19079999625682830810546875, -1.26520001888275146484375, 1.8650000095367431640625, -0.3476000130176544189453125), float4(0.2030999958515167236328125, -1.3863999843597412109375, 1.9851000308990478515625, -0.3501000106334686279296875) });

struct esia_main_out
{
    float4 _entryPointOutput [[color(0)]];
};

struct esia_main_in
{
    float4 i_col [[user(locn0)]];
    float2 i_uv [[user(locn1)]];
    float4 i_shapeRect [[user(locn2), flat]];
    float4 i_shape [[user(locn3), flat]];
    float i_kind [[user(locn4), flat]];
};

fragment esia_main_out esia_main(esia_main_in in [[stage_in]], constant WgtFrame& _101 [[buffer(0)]], constant WgtDraw& _133 [[buffer(2)]], texture2d<float> gTex [[texture(3)]], sampler gLinear [[sampler(11)]], float4 gl_FragCoord [[position]])
{
    esia_main_out out = {};
    float4 _1924;
    do
    {
        float4 _987 = gTex.sample(gLinear, in.i_uv);
        float _990 = dfdx(in.i_uv.x);
        float _994 = dfdy(in.i_uv.x);
        float _997 = fast::max(abs(_990) + abs(_994), 9.9999997473787516355514526367188e-05);
        if (in.i_kind > (-0.5))
        {
            float _1919;
            do
            {
                float _1061 = floor(in.i_kind + 0.5);
                if (_1061 > 4.5)
                {
                    float _1918;
                    do
                    {
                        float2 _1185 = in.i_uv - in.i_shapeRect.xy;
                        if (_1061 < 5.5)
                        {
                            _1918 = fast::clamp((in.i_shape.y - abs(dot(_1185, fast::normalize(float2(in.i_shapeRect.y - in.i_shapeRect.w, in.i_shapeRect.z - in.i_shapeRect.x))))) / fast::max(in.i_shape.y - in.i_shape.x, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                            break;
                        }
                        if (dot(_1185, _1185) < 9.9999999600419720025001879548654e-13)
                        {
                            _1918 = 1.0;
                            break;
                        }
                        float _1222 = floor(in.i_shape.z + 0.5);
                        float _1224 = 3.1415927410125732421875 / _1222;
                        float2 _1228 = fast::normalize(in.i_shapeRect.xy - in.i_shapeRect.zw);
                        float2 _1234 = float2(-_1228.y, _1228.x);
                        float _1252 = (fast::clamp(floor(precise::atan2(fast::max(dot(_1185, _1228), 0.0), dot(_1185, _1234)) / _1224), 0.0, _1222 - 1.0) + 0.5) * _1224;
                        float _1255 = cos(1.57079637050628662109375 / _1222);
                        _1918 = fast::clamp(((in.i_shape.y * _1255) - dot(_1185, (_1234 * cos(_1252)) + (_1228 * sin(_1252)))) / fast::max((in.i_shape.y - in.i_shape.x) * _1255, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                        break;
                    } while(false);
                    _1919 = _1918;
                    break;
                }
                if (_1061 > 3.5)
                {
                    _1919 = 1.0;
                    break;
                }
                float _1917;
                if (_1061 >= 1.5)
                {
                    float2 _1288 = in.i_uv - in.i_shapeRect.xy;
                    float2 _1291 = in.i_shapeRect.zw - in.i_shapeRect.xy;
                    _1917 = length(_1288 - (_1291 * fast::clamp(dot(_1288, _1291) / fast::max(dot(_1291, _1291), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_shape.x;
                }
                else
                {
                    float2 _1098 = in.i_uv - ((in.i_shapeRect.xy + in.i_shapeRect.zw) * 0.5);
                    float2 _1107 = fast::max((in.i_shapeRect.zw - in.i_shapeRect.xy) * 0.5, float2(0.001000000047497451305389404296875));
                    float _1344 = fast::min(_1107.x, _1107.y);
                    float _1347 = fast::min((_1098.x > 0.0) ? ((_1098.y > 0.0) ? in.i_shape.x : in.i_shape.x) : ((_1098.y > 0.0) ? in.i_shape.x : in.i_shape.x), _1344);
                    float _1353 = _1347 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                    float _1911;
                    float _1912;
                    if (_1353 > _1344)
                    {
                        float _1367 = in.i_shape.y * fast::clamp((_1344 - _1347) / fast::max(0.60000002384185791015625 * _1347, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _1912 = _1367;
                        _1911 = _1347 * (1.0 + (0.60000002384185791015625 * _1367));
                    }
                    else
                    {
                        _1912 = in.i_shape.y;
                        _1911 = _1353;
                    }
                    float2 _1380 = (abs(_1098) - _1107) + float2(_1911);
                    float2 _1382 = fast::max(_1380, float2(0.0));
                    float _1913;
                    if ((_1382.x > 0.0) && (_1382.y > 0.0))
                    {
                        float _1914;
                        if ((_1912 > 0.001000000047497451305389404296875) && (_1911 > 9.9999997473787516355514526367188e-05))
                        {
                            float _1399 = 2.0 + (2.0 * _1912);
                            float2 _1404 = _1382 / float2(fast::max(_1911, 9.9999997473787516355514526367188e-05));
                            _1914 = pow(pow(_1404.x, _1399) + pow(_1404.y, _1399), 1.0 / _1399) * _1911;
                        }
                        else
                        {
                            _1914 = length(_1382);
                        }
                        _1913 = _1914;
                    }
                    else
                    {
                        _1913 = fast::max(_1382.x, _1382.y);
                    }
                    _1917 = (fast::min(fast::max(_1380.x, _1380.y), 0.0) + _1913) - _1911;
                }
                if ((_1061 - (2.0 * floor(_1061 * 0.5))) > 0.5)
                {
                    _1919 = fast::clamp(0.5 - ((_1917 - (in.i_shape.z * in.i_shape.w)) / _997), 0.0, 1.0) - fast::clamp(0.5 - ((_1917 + (in.i_shape.z * (1.0 - in.i_shape.w))) / _997), 0.0, 1.0);
                    break;
                }
                _1919 = fast::clamp(0.5 - (_1917 / _997), 0.0, 1.0);
                break;
            } while(false);
            float2 _1448 = gl_FragCoord.xy + _101.gConv.yy;
            float2 _1920;
            if (_101.gConv.x > 0.5)
            {
                float2 _1875;
                _1875.y = _101.gTarget.y - _1448.y;
                _1920 = _1875;
            }
            else
            {
                _1920 = _1448;
            }
            float _1921;
            if (_133.gFade.z > 0.0)
            {
                _1921 = smoothstep(0.0, 1.0, fast::clamp((_1920.y - _133.gFade.x) / _133.gFade.z, 0.0, 1.0));
            }
            else
            {
                _1921 = 1.0;
            }
            float _1922;
            if (_133.gFade.w > 0.0)
            {
                _1922 = _1921 * smoothstep(0.0, 1.0, fast::clamp((_133.gFade.y - _1920.y) / _133.gFade.w, 0.0, 1.0));
            }
            else
            {
                _1922 = _1921;
            }
            float4 _1011 = float4(in.i_col.xyz, (in.i_col.w * _1919) * _1922);
            float4 _1923;
            if (_101.gTime.w > 0.5)
            {
                float3 _1520 = fast::clamp(_1011.xyz, float3(0.0), float3(1.0));
                float3 _1532 = select(pow((_1520 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _1520 * float3(0.077399380505084991455078125), _1520 <= float3(0.040449999272823333740234375));
                float4 _1877 = _1011;
                _1877.x = _1532.x;
                _1877.y = _1532.y;
                _1877.z = _1532.z;
                _1923 = _1877;
            }
            else
            {
                _1923 = _1011;
            }
            _1924 = _1923;
            break;
        }
        float _1017 = _987.x;
        float _1591 = _101.gText.y * fast::clamp(4.0 * (0.75 - dot(in.i_col.xyz, float3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375))), 0.0, 1.0);
        float _1575 = dot(in.i_col.xyz, float3(0.25, 0.5, 0.25));
        float _1602 = (_1017 * (_1591 + 1.0)) / ((_1017 * _1591) + 1.0);
        float _1643 = fast::clamp((_101.gText.x - 1.0) * 10.0, 0.0, 12.0);
        int _1646 = min(int(_1643), 11);
        float4 _1660 = mix(_485[_1646], _485[_1646 + 1], float4(_1643 - float(_1646))) * 0.25;
        float2 _1669 = gl_FragCoord.xy + _101.gConv.yy;
        float2 _1907;
        if (_101.gConv.x > 0.5)
        {
            float2 _1890;
            _1890.y = _101.gTarget.y - _1669.y;
            _1907 = _1890;
        }
        else
        {
            _1907 = _1669;
        }
        float _1908;
        if (_133.gFade.z > 0.0)
        {
            _1908 = smoothstep(0.0, 1.0, fast::clamp((_1907.y - _133.gFade.x) / _133.gFade.z, 0.0, 1.0));
        }
        else
        {
            _1908 = 1.0;
        }
        float _1909;
        if (_133.gFade.w > 0.0)
        {
            _1909 = _1908 * smoothstep(0.0, 1.0, fast::clamp((_133.gFade.y - _1907.y) / _133.gFade.w, 0.0, 1.0));
        }
        else
        {
            _1909 = _1908;
        }
        float4 _1557 = float4(in.i_col.xyz, (in.i_col.w * fast::clamp(_1602 + ((_1602 * (1.0 - _1602)) * ((((_1660.x * _1575) + _1660.y) * _1602) + ((_1660.z * _1575) + _1660.w))), 0.0, 1.0)) * _1909);
        float4 _1910;
        if (_101.gTime.w > 0.5)
        {
            float3 _1741 = fast::clamp(_1557.xyz, float3(0.0), float3(1.0));
            float3 _1753 = select(pow((_1741 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _1741 * float3(0.077399380505084991455078125), _1741 <= float3(0.040449999272823333740234375));
            float4 _1892 = _1557;
            _1892.x = _1753.x;
            _1892.y = _1753.y;
            _1892.z = _1753.z;
            _1910 = _1892;
        }
        else
        {
            _1910 = _1557;
        }
        _1924 = _1910;
        break;
    } while(false);
    out._entryPointOutput = _1924;
    return out;
}

