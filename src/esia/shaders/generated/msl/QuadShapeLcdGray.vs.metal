#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct gFxData
{
    float4 _data[1];
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

struct esia_main_out
{
    float4 _entryPointOutput_col [[user(locn0)]];
    float2 _entryPointOutput_uv [[user(locn1)]];
    float4 _entryPointOutput_shapeRect [[user(locn2)]];
    float4 _entryPointOutput_shape [[user(locn3)]];
    float _entryPointOutput_kind [[user(locn4)]];
    float4 gl_Position [[position]];
};

vertex esia_main_out esia_main(constant WgtFrame& _58 [[buffer(0)]], constant WgtDraw& _258 [[buffer(2)]], const device gFxData& gFxData_1 [[buffer(10)]], uint gl_VertexIndex [[vertex_id]], uint gl_InstanceIndex [[instance_id]])
{
    esia_main_out out = {};
    uint _684 = gl_InstanceIndex + uint(_258.gDrawInfo.x);
    uint _946 = uint(_58.gConv.w) + (_684 * 2u);
    uint _960 = (uint(_58.gConv.w) + (_684 * 2u)) + 1u;
    bool _692 = (gl_VertexIndex & 1u) != 0u;
    bool _696 = (gl_VertexIndex & 2u) != 0u;
    float _971 = floor(gFxData_1._data[_960].z * 1.52587890625e-05);
    float _978 = floor((gFxData_1._data[_960].z - (_971 * 65536.0)) * 0.00390625);
    float4 _994 = float4((gFxData_1._data[_960].z - (_971 * 65536.0)) - (_978 * 256.0), _978, _971, gFxData_1._data[_960].w) * float4(0.0039215688593685626983642578125);
    float2 _1239;
    float _1240;
    float4 _1241;
    float2 _1245;
    float4 _1246;
    if (gFxData_1._data[_960].x < 0.0)
    {
        float _710 = (-1.0) - gFxData_1._data[_960].x;
        float _713 = floor(_710 * 0.125);
        float _717 = floor(gFxData_1._data[_960].w * 0.00390625);
        float _721 = _710 - (_713 * 8.0);
        float4 _1194 = _994;
        _1194.w = (gFxData_1._data[_960].w - (_717 * 256.0)) * 0.0039215688593685626983642578125;
        float _745 = fast::max((2.0 * _58.gTarget.z) / fast::max(abs(_58.gXform.x), 9.9999999747524270787835121154785e-07), (2.0 * _58.gTarget.w) / fast::max(abs(_58.gXform.y), 9.9999999747524270787835121154785e-07));
        float2 _1237;
        float4 _1242;
        if (_721 > 4.5)
        {
            float _751 = floor(_713 * 0.03125);
            float _762 = gFxData_1._data[_960].y + (_745 * 0.5);
            bool _769 = _721 > 5.5;
            float _777 = _762 * (1.0 + ((_713 - (_751 * 32.0)) * 0.0625));
            float2 _1236;
            do
            {
                bool _1008 = _692 && (!_769);
                float _1013 = (_1008 ? _717 : _751) * 3.0517578125e-05;
                float2 _1027 = fast::normalize(select(float2(1.0 - _1013, 2.0 - _1013), float2(1.0 - _1013, _1013), bool2(_1013 <= 1.0)));
                float2 _1046 = select(_1027, -_1027, bool2(dot(_1027, float2(gFxData_1._data[_946].y - gFxData_1._data[_946].w, gFxData_1._data[_946].z - gFxData_1._data[_946].x)) < 0.0));
                float2 _1061 = select(gFxData_1._data[_946].xy, gFxData_1._data[_946].zw, bool2(_1008)) + (_1046 * (_696 ? _777 : (-_777)));
                if (!(_769 && _692))
                {
                    _1236 = _1061;
                    break;
                }
                float2 _1074 = float2(_1046.y, -_1046.x);
                _1236 = _1061 + (select(_1074, -_1074, bool2(dot(_1074, gFxData_1._data[_946].xy - gFxData_1._data[_946].zw) < 0.0)) * _762);
                break;
            } while(false);
            _1242 = float4(fast::max(gFxData_1._data[_960].y - (_745 * 0.5), 0.0), _762, _717, 0.0);
            _1237 = _1236;
        }
        else
        {
            float _788 = floor(_713 * 0.0009765625);
            float _797 = _717 * 0.015625;
            float _799 = _788 * 0.015625;
            float _821 = (_721 > 3.5) ? 0.0 : (_745 + ((_721 - (2.0 * floor(_721 * 0.5))) * fast::max(_797 * _799, 0.0)));
            float2 _1238;
            if ((_721 >= 1.5) && (_721 < 3.5))
            {
                float2 _832 = gFxData_1._data[_946].zw - gFxData_1._data[_946].xy;
                float _834 = length(_832);
                float2 _842 = select(float2(1.0, 0.0), _832 / float2(_834), bool2(_834 > 9.9999997473787516355514526367188e-05));
                float _852 = gFxData_1._data[_960].y + _821;
                _1238 = select(gFxData_1._data[_946].xy - (_842 * _852), gFxData_1._data[_946].zw + (_842 * _852), bool2(_692)) + (float2(-_842.y, _842.x) * (_696 ? _852 : (-_852)));
            }
            else
            {
                _1238 = float2(_692 ? (gFxData_1._data[_946].z + _821) : (gFxData_1._data[_946].x - _821), _696 ? (gFxData_1._data[_946].w + _821) : (gFxData_1._data[_946].y - _821));
            }
            _1242 = float4(gFxData_1._data[_960].y, (_713 - (_788 * 1024.0)) * 0.000977517105638980865478515625, _797, _799);
            _1237 = _1238;
        }
        _1246 = _1194;
        _1245 = _1237;
        _1241 = _1242;
        _1240 = _721;
        _1239 = _1237;
    }
    else
    {
        float _1103 = floor(gFxData_1._data[_960].x * 0.000244140625);
        float _1112 = floor(gFxData_1._data[_960].y * 0.000244140625);
        _1246 = _994;
        _1245 = float2((gFxData_1._data[_960].x - (_1103 * 4096.0)) + (_692 ? (gFxData_1._data[_960].y - (_1112 * 4096.0)) : 0.0), _1103 + (_696 ? _1112 : 0.0)) * float2(0.000244140625);
        _1241 = float4(0.0);
        _1240 = -1.0;
        _1239 = float2(_692 ? gFxData_1._data[_946].z : gFxData_1._data[_946].x, _696 ? gFxData_1._data[_946].w : gFxData_1._data[_946].y);
    }
    out.gl_Position = float4((_1239 * _58.gXform.xy) + _58.gXform.zw, 0.0, 1.0);
    out._entryPointOutput_col = _1246;
    out._entryPointOutput_uv = _1245;
    out._entryPointOutput_shapeRect = gFxData_1._data[_946];
    out._entryPointOutput_shape = _1241;
    out._entryPointOutput_kind = _1240;
    return out;
}

