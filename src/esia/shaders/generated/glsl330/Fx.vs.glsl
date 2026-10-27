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
const uint _249 = (1024u & kEsiaFxFeatures);
const uint _275 = (8192u & kEsiaFxFeatures);
const uint _279 = (4u & kEsiaFxFeatures);
const uint _283 = (256u & kEsiaFxFeatures);

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
    uint _508 = uint(gl_InstanceID) + uint(_88.gDrawInfo.x);
    uint _717 = max(uint(_29.gConv.z), 1u);
    vec4 _751 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int((_508 % _717) * 24u), int(_508 / _717), 0).xy, 0);
    uint _758 = max(uint(_29.gConv.z), 1u);
    vec4 _792 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_508 % _758) * 24u) + 6u), int(_508 / _758), 0).xy, 0);
    uint _799 = max(uint(_29.gConv.z), 1u);
    vec4 _833 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_508 % _799) * 24u) + 8u), int(_508 / _799), 0).xy, 0);
    uint _840 = max(uint(_29.gConv.z), 1u);
    uint _881 = max(uint(_29.gConv.z), 1u);
    vec4 _915 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_508 % _881) * 24u) + 15u), int(_508 / _881), 0).xy, 0);
    uint _922 = max(uint(_29.gConv.z), 1u);
    uvec4 _523 = uvec4(texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_508 % _922) * 24u) + 23u), int(_508 / _922), 0).xy, 0));
    uint _525 = _523.x;
    vec2 _527 = _751.xy;
    vec2 _529 = _751.zw;
    vec2 _1297;
    vec2 _1302;
    if ((_525 & _149) != 0u)
    {
        _1302 = max(_529, _915.zw);
        _1297 = min(_527, _915.xy);
    }
    else
    {
        _1302 = _529;
        _1297 = _527;
    }
    vec2 _1296;
    vec2 _1301;
    if ((_525 & _165) != 0u)
    {
        _1301 = _915.zw;
        _1296 = _915.xy;
    }
    else
    {
        _1301 = _1302;
        _1296 = _1297;
    }
    float _1290;
    if ((_525 & _178) != 0u)
    {
        _1290 = max(2.0, (_792.x * _792.y) + 2.0);
    }
    else
    {
        _1290 = 2.0;
    }
    float _1291;
    if (((_525 & _193) != 0u) && (!((_525 & _198) != 0u)))
    {
        _1291 = max(_1290, (((_833.x * 1.60000002384185791015625) + max(_833.y, 0.0)) + max(abs(_833.z), abs(_833.w))) + 2.0);
    }
    else
    {
        _1291 = _1290;
    }
    float _1292;
    if ((_525 & _227) != 0u)
    {
        _1292 = max(_1291, (texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_508 % _840) * 24u) + 10u), int(_508 / _840), 0).xy, 0).x * 1.7999999523162841796875) + 2.0);
    }
    else
    {
        _1292 = _1291;
    }
    vec2 _607 = _1296 - vec2(_1292);
    vec2 _611 = _1301 + vec2(_1292);
    vec2 _1303;
    vec2 _1304;
    if ((_525 & _249) != 0u)
    {
        uint _963 = max(uint(_29.gConv.z), 1u);
        vec4 _997 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_508 % _963) * 24u) + 19u), int(_508 / _963), 0).xy, 0);
        _1304 = min(_611, _997.zw + vec2(1.0));
        _1303 = max(_607, _997.xy - vec2(1.0));
    }
    else
    {
        _1304 = _611;
        _1303 = _607;
    }
    vec2 _1305;
    vec2 _1306;
    if (((_525 & _275) != 0u) && (!(((_525 & _279) != 0u) && (!((_525 & _283) != 0u)))))
    {
        uint _1004 = max(uint(_29.gConv.z), 1u);
        vec4 _1038 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_508 % _1004) * 24u) + 22u), int(_508 / _1004), 0).xy, 0);
        _1306 = max(_1303, _1038.xy - vec2(1.0));
        _1305 = min(_1304, _1038.zw + vec2(1.0));
    }
    else
    {
        _1306 = _1303;
        _1305 = _1304;
    }
    vec2 _678 = vec2(((uint(gl_VertexID) & 1u) != 0u) ? _1305.x : _1306.x, ((uint(gl_VertexID) & 2u) != 0u) ? _1305.y : _1306.y);
    uint _1045 = max(uint(_29.gConv.z), 1u);
    uint _1086 = max(uint(_29.gConv.z), 1u);
    uint _1127 = max(uint(_29.gConv.z), 1u);
    uint _1168 = max(uint(_29.gConv.z), 1u);
    gl_Position = vec4((_678 * _29.gXform.xy) + _29.gXform.zw, 0.0, 1.0);
    esia_v0 = _678;
    esia_v1 = _508;
    esia_v2 = _751;
    esia_v3 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_508 % _1045) * 24u) + 1u), int(_508 / _1045), 0).xy, 0);
    esia_v4 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_508 % _1086) * 24u) + 2u), int(_508 / _1086), 0).xy, 0);
    esia_v5 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_508 % _1127) * 24u) + 14u), int(_508 / _1127), 0).xy, 0);
    esia_v6 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((_508 % _1168) * 24u) + 17u), int(_508 / _1168), 0).xy, 0);
    esia_v7 = _523;
}

