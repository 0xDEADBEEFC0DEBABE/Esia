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

constant float2 _1956 = {};

constant spvUnsafeArray<float4, 13> _525 = spvUnsafeArray<float4, 13>({ float4(0.0), float4(0.01659999974071979522705078125, -0.080700002610683441162109375, 0.22269999980926513671875, -0.075099997222423553466796875), float4(0.0350000001490116119384765625, -0.17599999904632568359375, 0.43250000476837158203125, -0.1369999945163726806640625), float4(0.0542999990284442901611328125, -0.2820999920368194580078125, 0.63020002841949462890625, -0.18760000169277191162109375), float4(0.07389999926090240478515625, -0.3962999880313873291015625, 0.816699981689453125, -0.22869999706745147705078125), float4(0.09329999983310699462890625, -0.516099989414215087890625, 0.992600023746490478515625, -0.2615999877452850341796875), float4(0.112099997699260711669921875, -0.63950002193450927734375, 1.15880000591278076171875, -0.287699997425079345703125), float4(0.12999999523162841796875, -0.764900028705596923828125, 1.31589996814727783203125, -0.3079999983310699462890625), float4(0.146899998188018798828125, -0.891099989414215087890625, 1.4644000530242919921875, -0.3233999907970428466796875), float4(0.162699997425079345703125, -1.0169999599456787109375, 1.60510003566741943359375, -0.33469998836517333984375), float4(0.1773000061511993408203125, -1.1419999599456787109375, 1.73849999904632568359375, -0.34259998798370361328125), float4(0.19079999625682830810546875, -1.26520001888275146484375, 1.8650000095367431640625, -0.3476000130176544189453125), float4(0.2030999958515167236328125, -1.3863999843597412109375, 1.9851000308990478515625, -0.3501000106334686279296875) });

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
    float2 i_kind [[user(locn4), flat]];
};

fragment esia_main_out esia_main(esia_main_in in [[stage_in]], constant WgtFrame& _113 [[buffer(0)]], constant WgtDraw& _145 [[buffer(2)]], texture2d<float> gTex [[texture(3)]], sampler gLinear [[sampler(11)]], float4 gl_FragCoord [[position]])
{
    esia_main_out out = {};
    float4 _1955;
    do
    {
        float4 _1002 = gTex.sample(gLinear, in.i_uv);
        if (in.i_kind.x > (-0.5))
        {
            float _1062 = floor(in.i_kind.x + 0.5);
            float _1065 = fast::max(in.i_kind.y, 9.9999997473787516355514526367188e-05);
            float _1949;
            if (_1062 > 4.5)
            {
                float2 _1186 = in.i_uv - in.i_shapeRect.xy;
                float _1948;
                if (_1062 < 5.5)
                {
                    _1948 = fast::clamp((in.i_shape.y - abs(dot(_1186, fast::normalize(float2(in.i_shapeRect.y - in.i_shapeRect.w, in.i_shapeRect.z - in.i_shapeRect.x))))) / fast::max(in.i_shape.y - in.i_shape.x, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                }
                else
                {
                    float _1217 = floor(in.i_shape.z + 0.5);
                    float _1219 = 3.1415927410125732421875 / _1217;
                    float2 _1223 = fast::normalize(in.i_shapeRect.xy - in.i_shapeRect.zw);
                    float2 _1229 = float2(-_1223.y, _1223.x);
                    float _1247 = (fast::clamp(floor(precise::atan2(fast::max(dot(_1186, _1223), 0.0), dot(_1186, _1229)) / _1219), 0.0, _1217 - 1.0) + 0.5) * _1219;
                    float _1250 = cos(1.57079637050628662109375 / _1217);
                    _1948 = (dot(_1186, _1186) < 9.9999999600419720025001879548654e-13) ? 1.0 : fast::clamp(((in.i_shape.y * _1250) - dot(_1186, (_1229 * cos(_1247)) + (_1223 * sin(_1247)))) / fast::max((in.i_shape.y - in.i_shape.x) * _1250, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                }
                _1949 = _1948;
            }
            else
            {
                float _1950;
                if (_1062 < 3.5)
                {
                    float _1947;
                    if (_1062 >= 1.5)
                    {
                        float2 _1288 = in.i_uv - in.i_shapeRect.xy;
                        float2 _1291 = in.i_shapeRect.zw - in.i_shapeRect.xy;
                        _1947 = length(_1288 - (_1291 * fast::clamp(dot(_1288, _1291) / fast::max(dot(_1291, _1291), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_shape.x;
                    }
                    else
                    {
                        float2 _1101 = in.i_uv - ((in.i_shapeRect.xy + in.i_shapeRect.zw) * 0.5);
                        float2 _1110 = fast::max((in.i_shapeRect.zw - in.i_shapeRect.xy) * 0.5, float2(0.001000000047497451305389404296875));
                        float _1356 = fast::min(_1110.x, _1110.y);
                        float _1359 = fast::min((_1101.x > 0.0) ? ((_1101.y > 0.0) ? in.i_shape.x : in.i_shape.x) : ((_1101.y > 0.0) ? in.i_shape.x : in.i_shape.x), _1356);
                        float _1365 = _1359 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _1943;
                        float _1944;
                        if (_1365 > _1356)
                        {
                            float _1379 = in.i_shape.y * fast::clamp((_1356 - _1359) / fast::max(0.60000002384185791015625 * _1359, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _1944 = _1379;
                            _1943 = _1359 * (1.0 + (0.60000002384185791015625 * _1379));
                        }
                        else
                        {
                            _1944 = in.i_shape.y;
                            _1943 = _1365;
                        }
                        float2 _1408 = (abs(_1101) - _1110) + float2(_1943);
                        float2 _1410 = fast::max(_1408, float2(0.0));
                        float _1945;
                        if ((_1410.x > 0.0) && (_1410.y > 0.0))
                        {
                            float _1946;
                            if ((_1944 > 0.001000000047497451305389404296875) && (_1943 > 9.9999997473787516355514526367188e-05))
                            {
                                float _1427 = 2.0 + (2.0 * _1944);
                                float2 _1432 = _1410 / float2(fast::max(_1943, 9.9999997473787516355514526367188e-05));
                                _1946 = pow(pow(_1432.x, _1427) + pow(_1432.y, _1427), 1.0 / _1427) * _1943;
                            }
                            else
                            {
                                _1946 = length(_1410);
                            }
                            _1945 = _1946;
                        }
                        else
                        {
                            _1945 = fast::max(_1410.x, _1410.y);
                        }
                        _1947 = (fast::min(fast::max(_1408.x, _1408.y), 0.0) + _1945) - _1943;
                    }
                    _1950 = ((_1062 - (2.0 * floor(_1062 * 0.5))) > 0.5) ? (fast::clamp(0.5 - ((_1947 - (in.i_shape.z * in.i_shape.w)) / _1065), 0.0, 1.0) - fast::clamp(0.5 - ((_1947 + (in.i_shape.z * (1.0 - in.i_shape.w))) / _1065), 0.0, 1.0)) : fast::clamp(0.5 - (_1947 / _1065), 0.0, 1.0);
                }
                else
                {
                    _1950 = 1.0;
                }
                _1949 = _1950;
            }
            float2 _1476 = gl_FragCoord.xy + _113.gConv.yy;
            float2 _1951;
            if (_113.gConv.x > 0.5)
            {
                float2 _1907;
                _1907.y = _113.gTarget.y - _1476.y;
                _1951 = _1907;
            }
            else
            {
                _1951 = _1476;
            }
            float _1952;
            if (_145.gFade.z > 0.0)
            {
                _1952 = smoothstep(0.0, 1.0, fast::clamp((_1951.y - _145.gFade.x) / _145.gFade.z, 0.0, 1.0));
            }
            else
            {
                _1952 = 1.0;
            }
            float _1953;
            if (_145.gFade.w > 0.0)
            {
                _1953 = _1952 * smoothstep(0.0, 1.0, fast::clamp((_145.gFade.y - _1951.y) / _145.gFade.w, 0.0, 1.0));
            }
            else
            {
                _1953 = _1952;
            }
            float4 _1015 = float4(in.i_col.xyz, (in.i_col.w * _1949) * _1953);
            float4 _1954;
            if (_113.gTime.w > 0.5)
            {
                float3 _1548 = fast::clamp(_1015.xyz, float3(0.0), float3(1.0));
                float3 _1560 = select(pow((_1548 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _1548 * float3(0.077399380505084991455078125), _1548 <= float3(0.040449999272823333740234375));
                float4 _1909 = _1015;
                _1909.x = _1560.x;
                _1909.y = _1560.y;
                _1909.z = _1560.z;
                _1954 = _1909;
            }
            else
            {
                _1954 = _1015;
            }
            _1955 = _1954;
            break;
        }
        float _1021 = _1002.w;
        float _1619 = _113.gText.y * fast::clamp(4.0 * (0.75 - dot(in.i_col.xyz, float3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375))), 0.0, 1.0);
        float _1603 = dot(in.i_col.xyz, float3(0.25, 0.5, 0.25));
        float _1630 = (_1021 * (_1619 + 1.0)) / ((_1021 * _1619) + 1.0);
        float _1671 = fast::clamp((_113.gText.x - 1.0) * 10.0, 0.0, 12.0);
        int _1674 = min(int(_1671), 11);
        float4 _1688 = mix(_525[_1674], _525[_1674 + 1], float4(_1671 - float(_1674))) * 0.25;
        float2 _1697 = gl_FragCoord.xy + _113.gConv.yy;
        float2 _1939;
        if (_113.gConv.x > 0.5)
        {
            float2 _1922;
            _1922.y = _113.gTarget.y - _1697.y;
            _1939 = _1922;
        }
        else
        {
            _1939 = _1697;
        }
        float _1940;
        if (_145.gFade.z > 0.0)
        {
            _1940 = smoothstep(0.0, 1.0, fast::clamp((_1939.y - _145.gFade.x) / _145.gFade.z, 0.0, 1.0));
        }
        else
        {
            _1940 = 1.0;
        }
        float _1941;
        if (_145.gFade.w > 0.0)
        {
            _1941 = _1940 * smoothstep(0.0, 1.0, fast::clamp((_145.gFade.y - _1939.y) / _145.gFade.w, 0.0, 1.0));
        }
        else
        {
            _1941 = _1940;
        }
        float4 _1585 = float4(in.i_col.xyz, (in.i_col.w * fast::clamp(_1630 + ((_1630 * (1.0 - _1630)) * ((((_1688.x * _1603) + _1688.y) * _1630) + ((_1688.z * _1603) + _1688.w))), 0.0, 1.0)) * _1941);
        float4 _1942;
        if (_113.gTime.w > 0.5)
        {
            float3 _1769 = fast::clamp(_1585.xyz, float3(0.0), float3(1.0));
            float3 _1781 = select(pow((_1769 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _1769 * float3(0.077399380505084991455078125), _1769 <= float3(0.040449999272823333740234375));
            float4 _1924 = _1585;
            _1924.x = _1781.x;
            _1924.y = _1781.y;
            _1924.z = _1781.z;
            _1942 = _1924;
        }
        else
        {
            _1942 = _1585;
        }
        _1955 = _1942;
        break;
    } while(false);
    out._entryPointOutput = _1955;
    return out;
}

