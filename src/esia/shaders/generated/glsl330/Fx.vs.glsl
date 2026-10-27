#version 330

#ifndef SPIRV_CROSS_CONSTANT_ID_0
#define SPIRV_CROSS_CONSTANT_ID_0 4294967295u
#endif
const uint kEsiaFxFeatures = SPIRV_CROSS_CONSTANT_ID_0;
const uint _149 = (512u & kEsiaFxFeatures);
const uint _165 = (32768u & kEsiaFxFeatures);
const uint _178 = (2u & kEsiaFxFeatures);
const uint _193 = (4u & kEsiaFxFeatures);
const uint _198 = (256u & kEsiaFxFeatures);
const uint _227 = (8u & kEsiaFxFeatures);
const uint _241 = (65536u & kEsiaFxFeatures);
const uint _265 = (1024u & kEsiaFxFeatures);
const uint _291 = (8192u & kEsiaFxFeatures);
const uint _295 = (4u & kEsiaFxFeatures);
const uint _299 = (256u & kEsiaFxFeatures);

layout(std140) uniform WgtFrame
{
    vec4 gXform;
    vec4 gTarget;
    vec4 gDisplay;
    vec4 gTime;
    vec4 gLevel[6];
    vec4 gText;
    vec4 gConv;
} _29;

layout(std140) uniform WgtDraw
{
    vec4 gFade;
    vec4 gDrawInfo;
} _88;

uniform sampler2D SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler;

out vec2 esia_v0;
flat out uint esia_v1;
flat out vec4 esia_v2;
flat out vec4 esia_v3;
flat out vec4 esia_v4;
flat out vec4 esia_v5;
flat out vec4 esia_v6;
flat out uvec4 esia_v7;

void main()
{
    uint _526 = uint(gl_InstanceID) + uint(_88.gDrawInfo.x);
    uint _747 = max(uint(_29.gConv.z), 1u);
    vec4 _781 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int((_526 % _747) * 24u), int(_526 / _747), 0).xy, 0);
    uint _788 = max(uint(_29.gConv.z), 1u);
    vec4 _822 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _788) * 24u) + 6u), int(_526 / _788), 0).xy, 0);
    uint _829 = max(uint(_29.gConv.z), 1u);
    vec4 _863 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _829) * 24u) + 8u), int(_526 / _829), 0).xy, 0);
    uint _870 = max(uint(_29.gConv.z), 1u);
    uint _911 = max(uint(_29.gConv.z), 1u);
    vec4 _945 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _911) * 24u) + 15u), int(_526 / _911), 0).xy, 0);
    uint _952 = max(uint(_29.gConv.z), 1u);
    uvec4 _541 = uvec4(texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _952) * 24u) + 23u), int(_526 / _952), 0).xy, 0));
    uint _543 = _541.x;
    vec2 _545 = _781.xy;
    vec2 _547 = _781.zw;
    vec2 _1370;
    vec2 _1376;
    if ((_543 & _149) != 0u)
    {
        _1376 = max(_547, _945.zw);
        _1370 = min(_545, _945.xy);
    }
    else
    {
        _1376 = _547;
        _1370 = _545;
    }
    vec2 _1369;
    vec2 _1375;
    if ((_543 & _165) != 0u)
    {
        _1375 = _945.zw;
        _1369 = _945.xy;
    }
    else
    {
        _1375 = _1376;
        _1369 = _1370;
    }
    float _1361;
    if ((_543 & _178) != 0u)
    {
        _1361 = max(2.0, (_822.x * _822.y) + 2.0);
    }
    else
    {
        _1361 = 2.0;
    }
    float _1362;
    if (((_543 & _193) != 0u) && (!((_543 & _198) != 0u)))
    {
        _1362 = max(_1361, (((_863.x * 1.60000002384185791015625) + max(_863.y, 0.0)) + max(abs(_863.z), abs(_863.w))) + 2.0);
    }
    else
    {
        _1362 = _1361;
    }
    float _1363;
    if ((_543 & _227) != 0u)
    {
        _1363 = max(_1362, (texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _870) * 24u) + 10u), int(_526 / _870), 0).xy, 0).x * 1.7999999523162841796875) + 2.0);
    }
    else
    {
        _1363 = _1362;
    }
    float _1364;
    if ((_543 & _241) != 0u)
    {
        uint _993 = max(uint(_29.gConv.z), 1u);
        _1364 = max(_1363, (texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _993) * 24u) + 1u), int(_526 / _993), 0).xy, 0).w * 1.7999999523162841796875) + 2.0);
    }
    else
    {
        _1364 = _1363;
    }
    vec2 _637 = _1369 - vec2(_1364);
    vec2 _641 = _1375 + vec2(_1364);
    vec2 _1377;
    vec2 _1378;
    if ((_543 & _265) != 0u)
    {
        uint _1034 = max(uint(_29.gConv.z), 1u);
        vec4 _1068 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _1034) * 24u) + 19u), int(_526 / _1034), 0).xy, 0);
        _1378 = min(_641, _1068.zw + vec2(1.0));
        _1377 = max(_637, _1068.xy - vec2(1.0));
    }
    else
    {
        _1378 = _641;
        _1377 = _637;
    }
    vec2 _1379;
    vec2 _1380;
    if (((_543 & _291) != 0u) && (!(((_543 & _295) != 0u) && (!((_543 & _299) != 0u)))))
    {
        uint _1075 = max(uint(_29.gConv.z), 1u);
        vec4 _1109 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _1075) * 24u) + 22u), int(_526 / _1075), 0).xy, 0);
        _1380 = max(_1377, _1109.xy - vec2(1.0));
        _1379 = min(_1378, _1109.zw + vec2(1.0));
    }
    else
    {
        _1380 = _1377;
        _1379 = _1378;
    }
    vec2 _708 = vec2(((uint(gl_VertexID) & 1u) != 0u) ? _1379.x : _1380.x, ((uint(gl_VertexID) & 2u) != 0u) ? _1379.y : _1380.y);
    uint _1116 = max(uint(_29.gConv.z), 1u);
    uint _1157 = max(uint(_29.gConv.z), 1u);
    uint _1198 = max(uint(_29.gConv.z), 1u);
    uint _1239 = max(uint(_29.gConv.z), 1u);
    gl_Position = vec4((_708 * _29.gXform.xy) + _29.gXform.zw, 0.0, 1.0);
    esia_v0 = _708;
    esia_v1 = _526;
    esia_v2 = _781;
    esia_v3 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _1116) * 24u) + 1u), int(_526 / _1116), 0).xy, 0);
    esia_v4 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _1157) * 24u) + 2u), int(_526 / _1157), 0).xy, 0);
    esia_v5 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _1198) * 24u) + 14u), int(_526 / _1198), 0).xy, 0);
    esia_v6 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_526 % _1239) * 24u) + 17u), int(_526 / _1239), 0).xy, 0);
    esia_v7 = _541;
}

