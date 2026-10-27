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
constant uint _211 = (1024u & kEsiaFxFeatures);
constant uint _237 = (8192u & kEsiaFxFeatures);
constant uint _241 = (4u & kEsiaFxFeatures);
constant uint _245 = (256u & kEsiaFxFeatures);

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

vertex esia_main_out esia_main(constant WgtFrame& _296 [[buffer(0)]], constant WgtDraw& _46 [[buffer(2)]], const device gFxData& gFxData_1 [[buffer(10)]], uint gl_VertexIndex [[vertex_id]], uint gl_InstanceIndex [[instance_id]])
{
    esia_main_out out = {};
    uint _476 = gl_InstanceIndex + uint(_46.gDrawInfo.x);
    uint _682 = _476 * 24u;
    uint _692 = (_476 * 24u) + 6u;
    uint _700 = (_476 * 24u) + 8u;
    uint _716 = (_476 * 24u) + 15u;
    uint4 _491 = uint4(gFxData_1._data[(_476 * 24u) + 23u]);
    uint _493 = _491.x;
    float2 _869;
    float2 _874;
    if ((_493 & _109) != 0u)
    {
        _874 = fast::max(gFxData_1._data[_682].zw, gFxData_1._data[_716].zw);
        _869 = fast::min(gFxData_1._data[_682].xy, gFxData_1._data[_716].xy);
    }
    else
    {
        _874 = gFxData_1._data[_682].zw;
        _869 = gFxData_1._data[_682].xy;
    }
    float2 _868;
    float2 _873;
    if ((_493 & _125) != 0u)
    {
        _873 = gFxData_1._data[_716].zw;
        _868 = gFxData_1._data[_716].xy;
    }
    else
    {
        _873 = _874;
        _868 = _869;
    }
    float _862;
    if ((_493 & _139) != 0u)
    {
        _862 = fast::max(2.0, (gFxData_1._data[_692].x * gFxData_1._data[_692].y) + 2.0);
    }
    else
    {
        _862 = 2.0;
    }
    float _863;
    if (((_493 & _155) != 0u) && (!((_493 & _160) != 0u)))
    {
        _863 = fast::max(_862, (((gFxData_1._data[_700].x * 1.60000002384185791015625) + fast::max(gFxData_1._data[_700].y, 0.0)) + fast::max(abs(gFxData_1._data[_700].z), abs(gFxData_1._data[_700].w))) + 2.0);
    }
    else
    {
        _863 = _862;
    }
    float _864;
    if ((_493 & _189) != 0u)
    {
        _864 = fast::max(_863, (gFxData_1._data[(_476 * 24u) + 10u].x * 1.7999999523162841796875) + 2.0);
    }
    else
    {
        _864 = _863;
    }
    float2 _575 = _868 - float2(_864);
    float2 _579 = _873 + float2(_864);
    float2 _875;
    float2 _876;
    if ((_493 & _211) != 0u)
    {
        uint _732 = (_476 * 24u) + 19u;
        _876 = fast::min(_579, gFxData_1._data[_732].zw + float2(1.0));
        _875 = fast::max(_575, gFxData_1._data[_732].xy - float2(1.0));
    }
    else
    {
        _876 = _579;
        _875 = _575;
    }
    float2 _877;
    float2 _878;
    if (((_493 & _237) != 0u) && (!(((_493 & _241) != 0u) && (!((_493 & _245) != 0u)))))
    {
        uint _740 = (_476 * 24u) + 22u;
        _878 = fast::max(_875, gFxData_1._data[_740].xy - float2(1.0));
        _877 = fast::min(_876, gFxData_1._data[_740].zw + float2(1.0));
    }
    else
    {
        _878 = _875;
        _877 = _876;
    }
    float2 _646 = float2(((gl_VertexIndex & 1u) != 0u) ? _877.x : _878.x, ((gl_VertexIndex & 2u) != 0u) ? _877.y : _878.y);
    out.gl_Position = float4((_646 * _296.gXform.xy) + _296.gXform.zw, 0.0, 1.0);
    out._entryPointOutput_local = _646;
    out._entryPointOutput_instance = _476;
    out._entryPointOutput_rect = gFxData_1._data[_682];
    out._entryPointOutput_radii = gFxData_1._data[(_476 * 24u) + 1u];
    out._entryPointOutput_fill0 = gFxData_1._data[(_476 * 24u) + 2u];
    out._entryPointOutput_shape = gFxData_1._data[(_476 * 24u) + 14u];
    out._entryPointOutput_misc = gFxData_1._data[(_476 * 24u) + 17u];
    out._entryPointOutput_flags = _491;
    return out;
}

