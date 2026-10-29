#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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

constant float2 _1605 = {};

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

fragment esia_main_out esia_main(esia_main_in in [[stage_in]], constant WgtFrame& _77 [[buffer(0)]], constant WgtDraw& _109 [[buffer(2)]], texture2d<float> gTex [[texture(3)]], sampler gLinear [[sampler(11)]], float4 gl_FragCoord [[position]])
{
    esia_main_out out = {};
    float4 _1603;
    do
    {
        float4 _776 = gTex.sample(gLinear, in.i_uv);
        float _779 = dfdx(in.i_uv.x);
        float _783 = dfdy(in.i_uv.x);
        float _786 = fast::max(abs(_779) + abs(_783), 9.9999997473787516355514526367188e-05);
        if (in.i_kind > (-0.5))
        {
            float _1598;
            do
            {
                float _849 = floor(in.i_kind + 0.5);
                if (_849 > 4.5)
                {
                    float _1597;
                    do
                    {
                        float2 _973 = in.i_uv - in.i_shapeRect.xy;
                        if (_849 < 5.5)
                        {
                            _1597 = fast::clamp((in.i_shape.y - abs(dot(_973, fast::normalize(float2(in.i_shapeRect.y - in.i_shapeRect.w, in.i_shapeRect.z - in.i_shapeRect.x))))) / fast::max(in.i_shape.y - in.i_shape.x, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                            break;
                        }
                        if (dot(_973, _973) < 9.9999999600419720025001879548654e-13)
                        {
                            _1597 = 1.0;
                            break;
                        }
                        float _1010 = floor(in.i_shape.z + 0.5);
                        float _1012 = 3.1415927410125732421875 / _1010;
                        float2 _1016 = fast::normalize(in.i_shapeRect.xy - in.i_shapeRect.zw);
                        float2 _1022 = float2(-_1016.y, _1016.x);
                        float _1040 = (fast::clamp(floor(precise::atan2(fast::max(dot(_973, _1016), 0.0), dot(_973, _1022)) / _1012), 0.0, _1010 - 1.0) + 0.5) * _1012;
                        float _1043 = cos(1.57079637050628662109375 / _1010);
                        _1597 = fast::clamp(((in.i_shape.y * _1043) - dot(_973, (_1022 * cos(_1040)) + (_1016 * sin(_1040)))) / fast::max((in.i_shape.y - in.i_shape.x) * _1043, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                        break;
                    } while(false);
                    _1598 = _1597;
                    break;
                }
                if (_849 > 3.5)
                {
                    _1598 = 1.0;
                    break;
                }
                float _1596;
                if (_849 >= 1.5)
                {
                    float2 _1076 = in.i_uv - in.i_shapeRect.xy;
                    float2 _1079 = in.i_shapeRect.zw - in.i_shapeRect.xy;
                    _1596 = length(_1076 - (_1079 * fast::clamp(dot(_1076, _1079) / fast::max(dot(_1079, _1079), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_shape.x;
                }
                else
                {
                    float2 _886 = in.i_uv - ((in.i_shapeRect.xy + in.i_shapeRect.zw) * 0.5);
                    float2 _895 = fast::max((in.i_shapeRect.zw - in.i_shapeRect.xy) * 0.5, float2(0.001000000047497451305389404296875));
                    float _1132 = fast::min(_895.x, _895.y);
                    float _1135 = fast::min((_886.x > 0.0) ? ((_886.y > 0.0) ? in.i_shape.x : in.i_shape.x) : ((_886.y > 0.0) ? in.i_shape.x : in.i_shape.x), _1132);
                    float _1141 = _1135 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                    float _1590;
                    float _1591;
                    if (_1141 > _1132)
                    {
                        float _1155 = in.i_shape.y * fast::clamp((_1132 - _1135) / fast::max(0.60000002384185791015625 * _1135, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _1591 = _1155;
                        _1590 = _1135 * (1.0 + (0.60000002384185791015625 * _1155));
                    }
                    else
                    {
                        _1591 = in.i_shape.y;
                        _1590 = _1141;
                    }
                    float2 _1168 = (abs(_886) - _895) + float2(_1590);
                    float2 _1170 = fast::max(_1168, float2(0.0));
                    float _1592;
                    if ((_1170.x > 0.0) && (_1170.y > 0.0))
                    {
                        float _1593;
                        if ((_1591 > 0.001000000047497451305389404296875) && (_1590 > 9.9999997473787516355514526367188e-05))
                        {
                            float _1187 = 2.0 + (2.0 * _1591);
                            float2 _1192 = _1170 / float2(fast::max(_1590, 9.9999997473787516355514526367188e-05));
                            _1593 = pow(pow(_1192.x, _1187) + pow(_1192.y, _1187), 1.0 / _1187) * _1590;
                        }
                        else
                        {
                            _1593 = length(_1170);
                        }
                        _1592 = _1593;
                    }
                    else
                    {
                        _1592 = fast::max(_1170.x, _1170.y);
                    }
                    _1596 = (fast::min(fast::max(_1168.x, _1168.y), 0.0) + _1592) - _1590;
                }
                if ((_849 - (2.0 * floor(_849 * 0.5))) > 0.5)
                {
                    _1598 = fast::clamp(0.5 - ((_1596 - (in.i_shape.z * in.i_shape.w)) / _786), 0.0, 1.0) - fast::clamp(0.5 - ((_1596 + (in.i_shape.z * (1.0 - in.i_shape.w))) / _786), 0.0, 1.0);
                    break;
                }
                _1598 = fast::clamp(0.5 - (_1596 / _786), 0.0, 1.0);
                break;
            } while(false);
            float2 _1236 = gl_FragCoord.xy + _77.gConv.yy;
            float2 _1599;
            if (_77.gConv.x > 0.5)
            {
                float2 _1554;
                _1554.y = _77.gTarget.y - _1236.y;
                _1599 = _1554;
            }
            else
            {
                _1599 = _1236;
            }
            float _1600;
            if (_109.gFade.z > 0.0)
            {
                _1600 = smoothstep(0.0, 1.0, fast::clamp((_1599.y - _109.gFade.x) / _109.gFade.z, 0.0, 1.0));
            }
            else
            {
                _1600 = 1.0;
            }
            float _1601;
            if (_109.gFade.w > 0.0)
            {
                _1601 = _1600 * smoothstep(0.0, 1.0, fast::clamp((_109.gFade.y - _1599.y) / _109.gFade.w, 0.0, 1.0));
            }
            else
            {
                _1601 = _1600;
            }
            float4 _800 = float4(in.i_col.xyz, (in.i_col.w * _1598) * _1601);
            float4 _1602;
            if (_77.gTime.w > 0.5)
            {
                float3 _1308 = fast::clamp(_800.xyz, float3(0.0), float3(1.0));
                float3 _1320 = select(pow((_1308 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _1308 * float3(0.077399380505084991455078125), _1308 <= float3(0.040449999272823333740234375));
                float4 _1556 = _800;
                _1556.x = _1320.x;
                _1556.y = _1320.y;
                _1556.z = _1320.z;
                _1602 = _1556;
            }
            else
            {
                _1602 = _800;
            }
            _1603 = _1602;
            break;
        }
        float4 _1329 = in.i_col * _776;
        float2 _1348 = gl_FragCoord.xy + _77.gConv.yy;
        float2 _1583;
        if (_77.gConv.x > 0.5)
        {
            float2 _1563;
            _1563.y = _77.gTarget.y - _1348.y;
            _1583 = _1563;
        }
        else
        {
            _1583 = _1348;
        }
        float _1584;
        if (_109.gFade.z > 0.0)
        {
            _1584 = smoothstep(0.0, 1.0, fast::clamp((_1583.y - _109.gFade.x) / _109.gFade.z, 0.0, 1.0));
        }
        else
        {
            _1584 = 1.0;
        }
        float _1585;
        if (_109.gFade.w > 0.0)
        {
            _1585 = _1584 * smoothstep(0.0, 1.0, fast::clamp((_109.gFade.y - _1583.y) / _109.gFade.w, 0.0, 1.0));
        }
        else
        {
            _1585 = _1584;
        }
        float _1336 = _1329.w * _1585;
        float4 _1566 = _1329;
        _1566.w = _1336;
        float4 _1589;
        if (_77.gTime.w > 0.5)
        {
            float3 _1420 = fast::clamp(_1566.xyz, float3(0.0), float3(1.0));
            _1589 = float4(select(pow((_1420 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _1420 * float3(0.077399380505084991455078125), _1420 <= float3(0.040449999272823333740234375)), _1336);
        }
        else
        {
            _1589 = _1566;
        }
        _1603 = _1589;
        break;
    } while(false);
    out._entryPointOutput = _1603;
    return out;
}

