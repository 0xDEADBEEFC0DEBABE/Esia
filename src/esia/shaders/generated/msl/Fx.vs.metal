#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct gFxData
{
    float4 _data[1];
};

struct WgtDraw
{
    float4 gFade;
    float4 gDrawInfo;
};

constant uint kEsiaFxFeatures_tmp [[function_constant(0)]];
constant uint kEsiaFxFeatures = is_function_constant_defined(kEsiaFxFeatures_tmp) ? kEsiaFxFeatures_tmp : 4294967295u;
constant uint _109 = (512u & kEsiaFxFeatures);
constant uint _125 = (32768u & kEsiaFxFeatures);
constant uint _139 = (2u & kEsiaFxFeatures);
constant uint _155 = (4u & kEsiaFxFeatures);
constant uint _160 = (256u & kEsiaFxFeatures);
constant uint _189 = (8u & kEsiaFxFeatures);
constant uint _203 = (65536u & kEsiaFxFeatures);
constant uint _227 = (1024u & kEsiaFxFeatures);
constant uint _253 = (8192u & kEsiaFxFeatures);
constant uint _257 = (4u & kEsiaFxFeatures);
constant uint _261 = (256u & kEsiaFxFeatures);

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

struct esia_main_out
{
    float2 _entryPointOutput_local [[user(locn0)]];
    uint _entryPointOutput_instance [[user(locn1)]];
    float4 _entryPointOutput_rect [[user(locn2)]];
    float4 _entryPointOutput_radii [[user(locn3)]];
    float4 _entryPointOutput_fill0 [[user(locn4)]];
    float4 _entryPointOutput_shape [[user(locn5)]];
    float4 _entryPointOutput_misc [[user(locn6)]];
    uint4 _entryPointOutput_flags [[user(locn7)]];
    float4 gl_Position [[position]];
};

vertex esia_main_out esia_main(constant WgtFrame& _312 [[buffer(0)]], constant WgtDraw& _46 [[buffer(2)]], const device gFxData& gFxData_1 [[buffer(10)]], uint gl_VertexIndex [[vertex_id]], uint gl_InstanceIndex [[instance_id]])
{
    esia_main_out out = {};
    uint _494 = gl_InstanceIndex + uint(_46.gDrawInfo.x);
    uint _712 = _494 * 24u;
    uint _722 = (_494 * 24u) + 6u;
    uint _730 = (_494 * 24u) + 8u;
    uint _746 = (_494 * 24u) + 15u;
    uint4 _509 = uint4(gFxData_1._data[(_494 * 24u) + 23u]);
    uint _511 = _509.x;
    float2 _909;
    float2 _915;
    if ((_511 & _109) != 0u)
    {
        _915 = fast::max(gFxData_1._data[_712].zw, gFxData_1._data[_746].zw);
        _909 = fast::min(gFxData_1._data[_712].xy, gFxData_1._data[_746].xy);
    }
    else
    {
        _915 = gFxData_1._data[_712].zw;
        _909 = gFxData_1._data[_712].xy;
    }
    float2 _908;
    float2 _914;
    if ((_511 & _125) != 0u)
    {
        _914 = gFxData_1._data[_746].zw;
        _908 = gFxData_1._data[_746].xy;
    }
    else
    {
        _914 = _915;
        _908 = _909;
    }
    float _900;
    if ((_511 & _139) != 0u)
    {
        _900 = fast::max(2.0, (gFxData_1._data[_722].x * gFxData_1._data[_722].y) + 2.0);
    }
    else
    {
        _900 = 2.0;
    }
    float _901;
    if (((_511 & _155) != 0u) && (!((_511 & _160) != 0u)))
    {
        _901 = fast::max(_900, (((gFxData_1._data[_730].x * 1.60000002384185791015625) + fast::max(gFxData_1._data[_730].y, 0.0)) + fast::max(abs(gFxData_1._data[_730].z), abs(gFxData_1._data[_730].w))) + 2.0);
    }
    else
    {
        _901 = _900;
    }
    float _902;
    if ((_511 & _189) != 0u)
    {
        _902 = fast::max(_901, (gFxData_1._data[(_494 * 24u) + 10u].x * 1.7999999523162841796875) + 2.0);
    }
    else
    {
        _902 = _901;
    }
    float _903;
    if ((_511 & _203) != 0u)
    {
        _903 = fast::max(_902, (gFxData_1._data[(_494 * 24u) + 1u].w * 1.7999999523162841796875) + 2.0);
    }
    else
    {
        _903 = _902;
    }
    float2 _605 = _908 - float2(_903);
    float2 _609 = _914 + float2(_903);
    float2 _916;
    float2 _917;
    if ((_511 & _227) != 0u)
    {
        uint _770 = (_494 * 24u) + 19u;
        _917 = fast::min(_609, gFxData_1._data[_770].zw + float2(1.0));
        _916 = fast::max(_605, gFxData_1._data[_770].xy - float2(1.0));
    }
    else
    {
        _917 = _609;
        _916 = _605;
    }
    float2 _918;
    float2 _919;
    if (((_511 & _253) != 0u) && (!(((_511 & _257) != 0u) && (!((_511 & _261) != 0u)))))
    {
        uint _778 = (_494 * 24u) + 22u;
        _919 = fast::max(_916, gFxData_1._data[_778].xy - float2(1.0));
        _918 = fast::min(_917, gFxData_1._data[_778].zw + float2(1.0));
    }
    else
    {
        _919 = _916;
        _918 = _917;
    }
    float2 _676 = float2(((gl_VertexIndex & 1u) != 0u) ? _918.x : _919.x, ((gl_VertexIndex & 2u) != 0u) ? _918.y : _919.y);
    out.gl_Position = float4((_676 * _312.gXform.xy) + _312.gXform.zw, 0.0, 1.0);
    out._entryPointOutput_local = _676;
    out._entryPointOutput_instance = _494;
    out._entryPointOutput_rect = gFxData_1._data[_712];
    out._entryPointOutput_radii = gFxData_1._data[(_494 * 24u) + 1u];
    out._entryPointOutput_fill0 = gFxData_1._data[(_494 * 24u) + 2u];
    out._entryPointOutput_shape = gFxData_1._data[(_494 * 24u) + 14u];
    out._entryPointOutput_misc = gFxData_1._data[(_494 * 24u) + 17u];
    out._entryPointOutput_flags = _509;
    return out;
}

