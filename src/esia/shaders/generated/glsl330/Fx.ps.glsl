#version 330
#if defined(GL_EXT_control_flow_attributes)
#extension GL_EXT_control_flow_attributes : require
#define SPIRV_CROSS_FLATTEN [[flatten]]
#define SPIRV_CROSS_BRANCH [[dont_flatten]]
#define SPIRV_CROSS_UNROLL [[unroll]]
#define SPIRV_CROSS_LOOP [[dont_unroll]]
#else
#define SPIRV_CROSS_FLATTEN
#define SPIRV_CROSS_BRANCH
#define SPIRV_CROSS_UNROLL
#define SPIRV_CROSS_LOOP
#endif

#ifndef SPIRV_CROSS_CONSTANT_ID_0
#define SPIRV_CROSS_CONSTANT_ID_0 4294967295u
#endif
const uint kEsiaFxFeatures = SPIRV_CROSS_CONSTANT_ID_0;
const uint _1379 = (32768u & kEsiaFxFeatures);
const uint _1448 = (512u & kEsiaFxFeatures);
const vec3 _1912[6] = vec3[](vec3(1.0, 0.4199999868869781494140625, 0.2199999988079071044921875), vec3(1.0, 0.699999988079071044921875, 0.300000011920928955078125), vec3(0.800000011920928955078125, 0.920000016689300537109375, 0.4000000059604644775390625), vec3(0.3499999940395355224609375, 0.89999997615814208984375, 0.699999988079071044921875), vec3(0.4000000059604644775390625, 0.62000000476837158203125, 1.0), vec3(0.660000026226043701171875, 0.5, 1.0));
const uint _2548 = (512u & kEsiaFxFeatures);
const uint _2569 = (32768u & kEsiaFxFeatures);
const uint _2602 = (1024u & kEsiaFxFeatures);
const uint _2669 = (32u & kEsiaFxFeatures);
const uint _2677 = (4u & kEsiaFxFeatures);
const uint _2682 = (256u & kEsiaFxFeatures);
const uint _2747 = (8u & kEsiaFxFeatures);
const uint _2776 = (8192u & kEsiaFxFeatures);
const uint _2993 = (32u & kEsiaFxFeatures);
const uint _3057 = (1u & kEsiaFxFeatures);
const uint _3086 = (64u & kEsiaFxFeatures);
const uint _3139 = (16384u & kEsiaFxFeatures);
const vec4 _3303[4] = vec4[](vec4(-1.0, 1.0, 3.400000095367431640625, 2.599999904632568359375), vec4(-0.550000011920928955078125, 0.800000011920928955078125, 2.0, 0.800000011920928955078125), vec4(0.300000011920928955078125, 1.0, 1.2000000476837158203125, 1.2999999523162841796875), vec4(0.62000000476837158203125, 0.800000011920928955078125, 1.60000002384185791015625, 0.449999988079071044921875));
const vec2 _3320[4] = vec2[](vec2(0.0), vec2(0.100000001490116119384765625, 1.2999999523162841796875), vec2(0.550000011920928955078125, 3.900000095367431640625), vec2(0.20000000298023223876953125, 5.19999980926513671875));
const uint _3572 = (4u & kEsiaFxFeatures);
const uint _3576 = (256u & kEsiaFxFeatures);
const uint _3636 = (16u & kEsiaFxFeatures);
const uint _3705 = (2u & kEsiaFxFeatures);
const uint _3835 = (128u & kEsiaFxFeatures);
const uint _3917 = (2048u & kEsiaFxFeatures);
const uint _3957 = (8u & kEsiaFxFeatures);
const uint _3961 = (4u & kEsiaFxFeatures);

layout(std140) uniform WgtFrame
{
    vec4 gXform;
    vec4 gTarget;
    vec4 gDisplay;
    vec4 gTime;
    vec4 gLevel[6];
    vec4 gText;
    vec4 gConv;
} _188;

layout(std140) uniform WgtDraw
{
    vec4 gFade;
    vec4 gDrawInfo;
} _231;

uniform sampler2D SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler;
uniform sampler2D SPIRV_Cross_CombinedgTexgLinear;
uniform sampler2D SPIRV_Cross_CombinedgBackdrop0gLinear;
uniform sampler2D SPIRV_Cross_CombinedgBackdrop1gLinear;
uniform sampler2D SPIRV_Cross_CombinedgBackdrop2gLinear;
uniform sampler2D SPIRV_Cross_CombinedgBackdrop3gLinear;
uniform sampler2D SPIRV_Cross_CombinedgBackdrop4gLinear;
uniform sampler2D SPIRV_Cross_CombinedgBackdrop5gLinear;

in vec2 esia_v0;
flat in uint esia_v1;
flat in vec4 esia_v2;
flat in vec4 esia_v3;
flat in vec4 esia_v4;
flat in vec4 esia_v5;
flat in vec4 esia_v6;
flat in uvec4 esia_v7;
layout(location = 0) out vec4 _entryPointOutput;

void main()
{
    vec2 _5498 = gl_FragCoord.xy + _188.gConv.yy;
    vec2 _18314;
    if (_188.gConv.x > 0.5)
    {
        vec2 _17157 = _5498;
        _17157.y = _188.gTarget.y - _5498.y;
        _18314 = _17157;
    }
    else
    {
        _18314 = _5498;
    }
    float _4277 = dFdx(esia_v0.x);
    float _4281 = dFdy(esia_v0.x);
    float _4284 = max(abs(_4277) + abs(_4281), 9.9999997473787516355514526367188e-05);
    vec4 _18319;
    vec4 _18322;
    SPIRV_CROSS_BRANCH
    if ((esia_v7.z == 2u) || ((esia_v7.x & _2548) != 0u))
    {
        uint _5517 = max(uint(_188.gConv.z), 1u);
        uint _5558 = max(uint(_188.gConv.z), 1u);
        _18322 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _5517) * 24u) + 15u), int(esia_v1 / _5517), 0).xy, 0);
        _18319 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _5558) * 24u) + 16u), int(esia_v1 / _5558), 0).xy, 0);
    }
    else
    {
        _18322 = vec4(0.0);
        _18319 = vec4(0.0);
    }
    vec4 _18315;
    vec4 _18321;
    SPIRV_CROSS_BRANCH
    if ((esia_v7.x & _2569) != 0u)
    {
        uint _5599 = max(uint(_188.gConv.z), 1u);
        uint _5640 = max(uint(_188.gConv.z), 1u);
        _18321 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _5599) * 24u) + 15u), int(esia_v1 / _5599), 0).xy, 0);
        _18315 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _5640) * 24u) + 18u), int(esia_v1 / _5640), 0).xy, 0);
    }
    else
    {
        _18321 = _18322;
        _18315 = vec4(0.0);
    }
    vec2 _5715 = (esia_v2.xy + esia_v2.zw) * 0.5;
    vec2 _5724 = max((esia_v2.zw - esia_v2.xy) * 0.5, vec2(0.001000000047497451305389404296875));
    float _18340;
    SPIRV_CROSS_BRANCH
    if ((esia_v7.x & _1379) != 0u)
    {
        float _5830 = 1.0 / max(esia_v5.z, 9.9999999747524270787835121154785e-07);
        vec4 _5864 = textureLod(SPIRV_Cross_CombinedgTexgLinear, mix(_18315.xy, _18315.zw, (clamp(esia_v0, _18321.xy, _18321.zw) - _18321.xy) / max(_18321.zw - _18321.xy, vec2(9.9999999747524270787835121154785e-07))), 0.0);
        float _5888 = (_5864.w - 0.5) * esia_v3.y;
        vec2 _5929 = abs(esia_v0 - ((_18321.xy + _18321.zw) * 0.5)) - max(((_18321.zw - _18321.xy) * 0.5) - vec2(((0.5 * esia_v3.y) + 1.0) * _5830), vec2(0.0));
        _18340 = max((-mix((max(min(_5864.x, _5864.y), min(max(_5864.x, _5864.y), _5864.z)) - 0.5) * esia_v3.x, _5888, clamp(abs(_5888) - ((0.5 * esia_v3.x) - 1.5), 0.0, 1.0))) * _5830, length(max(_5929, vec2(0.0))) + min(max(_5929.x, _5929.y), 0.0)) - esia_v5.w;
    }
    else
    {
        float _18341;
        if (esia_v7.z == 1u)
        {
            vec2 _5739 = esia_v0 - _5715;
            float _18339;
            do
            {
                if (esia_v5.w >= 6.282185077667236328125)
                {
                    _18339 = abs(length(_5739) - esia_v3.x) - esia_v3.y;
                    break;
                }
                float _5973 = esia_v5.z + (esia_v5.w * 0.5);
                float _5975 = cos(_5973);
                float _5977 = sin(_5973);
                float _5986 = dot(_5739, vec2(-_5977, _5975));
                float _5989 = dot(_5739, vec2(_5975, _5977));
                vec2 _5990 = vec2(_5986, _5989);
                float _5993 = abs(_5986);
                _5990.x = _5993;
                float _5996 = esia_v5.w * 0.5;
                float _5998 = sin(_5996);
                float _6000 = cos(_5996);
                _18339 = (((_6000 * _5993) > (_5998 * _5989)) ? length(_5990 - (vec2(_5998, _6000) * esia_v3.x)) : abs(length(_5990) - esia_v3.x)) - esia_v3.y;
                break;
            } while(false);
            _18341 = _18339;
        }
        else
        {
            float _18342;
            if (esia_v7.z == 2u)
            {
                vec2 _6036 = esia_v0 - _18321.xy;
                vec2 _6039 = _18321.zw - _18321.xy;
                _18342 = length(_6036 - (_6039 * clamp(dot(_6036, _6039) / max(dot(_6039, _6039), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - esia_v3.x;
            }
            else
            {
                vec2 _5766 = esia_v0 - _5715;
                float _6092 = min(_5724.x, _5724.y);
                float _6095 = min((_5766.x > 0.0) ? ((_5766.y > 0.0) ? esia_v3.z : esia_v3.y) : ((_5766.y > 0.0) ? esia_v3.w : esia_v3.x), _6092);
                float _6101 = _6095 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                float _18324;
                float _18325;
                if (_6101 > _6092)
                {
                    float _6115 = esia_v5.y * clamp((_6092 - _6095) / max(0.60000002384185791015625 * _6095, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                    _18325 = _6115;
                    _18324 = _6095 * (1.0 + (0.60000002384185791015625 * _6115));
                }
                else
                {
                    _18325 = esia_v5.y;
                    _18324 = _6101;
                }
                vec2 _6128 = (abs(_5766) - _5724) + vec2(_18324);
                vec2 _6130 = max(_6128, vec2(0.0));
                float _18326;
                SPIRV_CROSS_BRANCH
                if ((_6130.x > 0.0) && (_6130.y > 0.0))
                {
                    float _18327;
                    if ((_18325 > 0.001000000047497451305389404296875) && (_18324 > 9.9999997473787516355514526367188e-05))
                    {
                        float _6147 = 2.0 + (2.0 * _18325);
                        vec2 _6152 = _6130 / vec2(max(_18324, 9.9999997473787516355514526367188e-05));
                        _18327 = pow(pow(_6152.x, _6147) + pow(_6152.y, _6147), 1.0 / _6147) * _18324;
                    }
                    else
                    {
                        _18327 = length(_6130);
                    }
                    _18326 = _18327;
                }
                else
                {
                    _18326 = max(_6130.x, _6130.y);
                }
                float _6187 = (min(max(_6128.x, _6128.y), 0.0) + _18326) - _18324;
                float _18343;
                SPIRV_CROSS_BRANCH
                if ((esia_v7.x & _1448) != 0u)
                {
                    vec2 _5794 = max((_18321.zw - _18321.xy) * 0.5, vec2(0.001000000047497451305389404296875));
                    vec2 _5797 = esia_v0 - ((_18321.xy + _18321.zw) * 0.5);
                    float _6223 = min(_5794.x, _5794.y);
                    float _6226 = min((_5797.x > 0.0) ? ((_5797.y > 0.0) ? _18319.x : _18319.x) : ((_5797.y > 0.0) ? _18319.x : _18319.x), _6223);
                    float _6232 = _6226 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                    float _18330;
                    float _18331;
                    if (_6232 > _6223)
                    {
                        float _6246 = esia_v5.y * clamp((_6223 - _6226) / max(0.60000002384185791015625 * _6226, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _18331 = _6246;
                        _18330 = _6226 * (1.0 + (0.60000002384185791015625 * _6246));
                    }
                    else
                    {
                        _18331 = esia_v5.y;
                        _18330 = _6232;
                    }
                    vec2 _6259 = (abs(_5797) - _5794) + vec2(_18330);
                    vec2 _6261 = max(_6259, vec2(0.0));
                    float _18332;
                    SPIRV_CROSS_BRANCH
                    if ((_6261.x > 0.0) && (_6261.y > 0.0))
                    {
                        float _18333;
                        if ((_18331 > 0.001000000047497451305389404296875) && (_18330 > 9.9999997473787516355514526367188e-05))
                        {
                            float _6278 = 2.0 + (2.0 * _18331);
                            vec2 _6283 = _6261 / vec2(max(_18330, 9.9999997473787516355514526367188e-05));
                            _18333 = pow(pow(_6283.x, _6278) + pow(_6283.y, _6278), 1.0 / _6278) * _18330;
                        }
                        else
                        {
                            _18333 = length(_6261);
                        }
                        _18332 = _18333;
                    }
                    else
                    {
                        _18332 = max(_6261.x, _6261.y);
                    }
                    float _6318 = (min(max(_6259.x, _6259.y), 0.0) + _18332) - _18330;
                    float _6323 = max(_18319.y, 9.9999997473787516355514526367188e-05);
                    float _6332 = max(_6323 - abs(_6187 - _6318), 0.0) / _6323;
                    _18343 = min(_6187, _6318) - (((_6332 * _6332) * _6323) * 0.25);
                }
                else
                {
                    _18343 = _6187;
                }
                _18342 = _18343;
            }
            _18341 = _18342;
        }
        _18340 = _18341;
    }
    float _4322 = clamp(0.5 - (_18340 / _4284), 0.0, 1.0);
    float _20500;
    SPIRV_CROSS_BRANCH
    if ((esia_v7.x & _2602) != 0u)
    {
        uint _6349 = max(uint(_188.gConv.z), 1u);
        vec4 _6383 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _6349) * 24u) + 19u), int(esia_v1 / _6349), 0).xy, 0);
        uint _6390 = max(uint(_188.gConv.z), 1u);
        vec4 _6424 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _6390) * 24u) + 20u), int(esia_v1 / _6390), 0).xy, 0);
        vec2 _4351 = max((_6383.zw - _6383.xy) * 0.5, vec2(0.001000000047497451305389404296875));
        vec2 _4354 = esia_v0 - ((_6383.xy + _6383.zw) * 0.5);
        float _4360 = _6424.y;
        float _6460 = min(_4351.x, _4351.y);
        float _6463 = min((_4354.x > 0.0) ? ((_4354.y > 0.0) ? _6424.x : _6424.x) : ((_4354.y > 0.0) ? _6424.x : _6424.x), _6460);
        float _6469 = _6463 * (1.0 + (0.60000002384185791015625 * _4360));
        float _18344;
        float _18345;
        if (_6469 > _6460)
        {
            float _6483 = _4360 * clamp((_6460 - _6463) / max(0.60000002384185791015625 * _6463, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
            _18345 = _6483;
            _18344 = _6463 * (1.0 + (0.60000002384185791015625 * _6483));
        }
        else
        {
            _18345 = _4360;
            _18344 = _6469;
        }
        vec2 _6496 = (abs(_4354) - _4351) + vec2(_18344);
        vec2 _6498 = max(_6496, vec2(0.0));
        float _18346;
        SPIRV_CROSS_BRANCH
        if ((_6498.x > 0.0) && (_6498.y > 0.0))
        {
            float _18347;
            if ((_18345 > 0.001000000047497451305389404296875) && (_18344 > 9.9999997473787516355514526367188e-05))
            {
                float _6515 = 2.0 + (2.0 * _18345);
                vec2 _6520 = _6498 / vec2(max(_18344, 9.9999997473787516355514526367188e-05));
                _18347 = pow(pow(_6520.x, _6515) + pow(_6520.y, _6515), 1.0 / _6515) * _18344;
            }
            else
            {
                _18347 = length(_6498);
            }
            _18346 = _18347;
        }
        else
        {
            _18346 = max(_6498.x, _6498.y);
        }
        float _4366 = clamp(0.5 - (((min(max(_6496.x, _6496.y), 0.0) + _18346) - _18344) / _4284), 0.0, 1.0);
        if (_4366 <= 0.0)
        {
            discard;
        }
        _20500 = _4366;
    }
    else
    {
        _20500 = 1.0;
    }
    bool _4377 = ((esia_v7.x & _2669) != 0u) && (_4322 >= 0.999000012874603271484375);
    vec4 _18457;
    SPIRV_CROSS_BRANCH
    if ((((esia_v7.x & _2677) != 0u) && (!((esia_v7.x & _2682) != 0u))) && (!_4377))
    {
        uint _6562 = max(uint(_188.gConv.z), 1u);
        vec4 _6596 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _6562) * 24u) + 7u), int(esia_v1 / _6562), 0).xy, 0);
        uint _6603 = max(uint(_188.gConv.z), 1u);
        vec4 _6637 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _6603) * 24u) + 8u), int(esia_v1 / _6603), 0).xy, 0);
        vec2 _4408 = esia_v0 - _6637.zw;
        vec2 _6678 = (esia_v2.xy + esia_v2.zw) * 0.5;
        vec2 _6687 = max((esia_v2.zw - esia_v2.xy) * 0.5, vec2(0.001000000047497451305389404296875));
        float _18411;
        SPIRV_CROSS_BRANCH
        if ((esia_v7.x & _1379) != 0u)
        {
            float _6793 = 1.0 / max(esia_v5.z, 9.9999999747524270787835121154785e-07);
            vec4 _6827 = textureLod(SPIRV_Cross_CombinedgTexgLinear, mix(_18315.xy, _18315.zw, (clamp(_4408, _18321.xy, _18321.zw) - _18321.xy) / max(_18321.zw - _18321.xy, vec2(9.9999999747524270787835121154785e-07))), 0.0);
            float _6851 = (_6827.w - 0.5) * esia_v3.y;
            vec2 _6892 = abs(_4408 - ((_18321.xy + _18321.zw) * 0.5)) - max(((_18321.zw - _18321.xy) * 0.5) - vec2(((0.5 * esia_v3.y) + 1.0) * _6793), vec2(0.0));
            _18411 = max((-mix((max(min(_6827.x, _6827.y), min(max(_6827.x, _6827.y), _6827.z)) - 0.5) * esia_v3.x, _6851, clamp(abs(_6851) - ((0.5 * esia_v3.x) - 1.5), 0.0, 1.0))) * _6793, length(max(_6892, vec2(0.0))) + min(max(_6892.x, _6892.y), 0.0)) - esia_v5.w;
        }
        else
        {
            float _18412;
            if (esia_v7.z == 1u)
            {
                vec2 _6702 = _4408 - _6678;
                float _18410;
                do
                {
                    if (esia_v5.w >= 6.282185077667236328125)
                    {
                        _18410 = abs(length(_6702) - esia_v3.x) - esia_v3.y;
                        break;
                    }
                    float _6936 = esia_v5.z + (esia_v5.w * 0.5);
                    float _6938 = cos(_6936);
                    float _6940 = sin(_6936);
                    float _6949 = dot(_6702, vec2(-_6940, _6938));
                    float _6952 = dot(_6702, vec2(_6938, _6940));
                    vec2 _6953 = vec2(_6949, _6952);
                    float _6956 = abs(_6949);
                    _6953.x = _6956;
                    float _6959 = esia_v5.w * 0.5;
                    float _6961 = sin(_6959);
                    float _6963 = cos(_6959);
                    _18410 = (((_6963 * _6956) > (_6961 * _6952)) ? length(_6953 - (vec2(_6961, _6963) * esia_v3.x)) : abs(length(_6953) - esia_v3.x)) - esia_v3.y;
                    break;
                } while(false);
                _18412 = _18410;
            }
            else
            {
                float _18413;
                if (esia_v7.z == 2u)
                {
                    vec2 _6999 = _4408 - _18321.xy;
                    vec2 _7002 = _18321.zw - _18321.xy;
                    _18413 = length(_6999 - (_7002 * clamp(dot(_6999, _7002) / max(dot(_7002, _7002), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - esia_v3.x;
                }
                else
                {
                    vec2 _6729 = _4408 - _6678;
                    float _7055 = min(_6687.x, _6687.y);
                    float _7058 = min((_6729.x > 0.0) ? ((_6729.y > 0.0) ? esia_v3.z : esia_v3.y) : ((_6729.y > 0.0) ? esia_v3.w : esia_v3.x), _7055);
                    float _7064 = _7058 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                    float _18395;
                    float _18396;
                    if (_7064 > _7055)
                    {
                        float _7078 = esia_v5.y * clamp((_7055 - _7058) / max(0.60000002384185791015625 * _7058, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _18396 = _7078;
                        _18395 = _7058 * (1.0 + (0.60000002384185791015625 * _7078));
                    }
                    else
                    {
                        _18396 = esia_v5.y;
                        _18395 = _7064;
                    }
                    vec2 _7091 = (abs(_6729) - _6687) + vec2(_18395);
                    vec2 _7093 = max(_7091, vec2(0.0));
                    float _18397;
                    SPIRV_CROSS_BRANCH
                    if ((_7093.x > 0.0) && (_7093.y > 0.0))
                    {
                        float _18398;
                        if ((_18396 > 0.001000000047497451305389404296875) && (_18395 > 9.9999997473787516355514526367188e-05))
                        {
                            float _7110 = 2.0 + (2.0 * _18396);
                            vec2 _7115 = _7093 / vec2(max(_18395, 9.9999997473787516355514526367188e-05));
                            _18398 = pow(pow(_7115.x, _7110) + pow(_7115.y, _7110), 1.0 / _7110) * _18395;
                        }
                        else
                        {
                            _18398 = length(_7093);
                        }
                        _18397 = _18398;
                    }
                    else
                    {
                        _18397 = max(_7093.x, _7093.y);
                    }
                    float _7150 = (min(max(_7091.x, _7091.y), 0.0) + _18397) - _18395;
                    float _18414;
                    SPIRV_CROSS_BRANCH
                    if ((esia_v7.x & _1448) != 0u)
                    {
                        vec2 _6757 = max((_18321.zw - _18321.xy) * 0.5, vec2(0.001000000047497451305389404296875));
                        vec2 _6760 = _4408 - ((_18321.xy + _18321.zw) * 0.5);
                        float _7186 = min(_6757.x, _6757.y);
                        float _7189 = min((_6760.x > 0.0) ? ((_6760.y > 0.0) ? _18319.x : _18319.x) : ((_6760.y > 0.0) ? _18319.x : _18319.x), _7186);
                        float _7195 = _7189 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                        float _18401;
                        float _18402;
                        if (_7195 > _7186)
                        {
                            float _7209 = esia_v5.y * clamp((_7186 - _7189) / max(0.60000002384185791015625 * _7189, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _18402 = _7209;
                            _18401 = _7189 * (1.0 + (0.60000002384185791015625 * _7209));
                        }
                        else
                        {
                            _18402 = esia_v5.y;
                            _18401 = _7195;
                        }
                        vec2 _7222 = (abs(_6760) - _6757) + vec2(_18401);
                        vec2 _7224 = max(_7222, vec2(0.0));
                        float _18403;
                        SPIRV_CROSS_BRANCH
                        if ((_7224.x > 0.0) && (_7224.y > 0.0))
                        {
                            float _18404;
                            if ((_18402 > 0.001000000047497451305389404296875) && (_18401 > 9.9999997473787516355514526367188e-05))
                            {
                                float _7241 = 2.0 + (2.0 * _18402);
                                vec2 _7246 = _7224 / vec2(max(_18401, 9.9999997473787516355514526367188e-05));
                                _18404 = pow(pow(_7246.x, _7241) + pow(_7246.y, _7241), 1.0 / _7241) * _18401;
                            }
                            else
                            {
                                _18404 = length(_7224);
                            }
                            _18403 = _18404;
                        }
                        else
                        {
                            _18403 = max(_7224.x, _7224.y);
                        }
                        float _7281 = (min(max(_7222.x, _7222.y), 0.0) + _18403) - _18401;
                        float _7286 = max(_18319.y, 9.9999997473787516355514526367188e-05);
                        float _7295 = max(_7286 - abs(_7150 - _7281), 0.0) / _7286;
                        _18414 = min(_7150, _7281) - (((_7295 * _7295) * _7286) * 0.25);
                    }
                    else
                    {
                        _18414 = _7150;
                    }
                    _18413 = _18414;
                }
                _18412 = _18413;
            }
            _18411 = _18412;
        }
        float _4417 = (_18411 - _6637.y) / (max(_6637.x * 0.5, _4284 * 0.5) * 1.41421353816986083984375);
        float _7312 = sign(_4417);
        float _7314 = abs(_4417);
        float _7325 = 1.0 + ((0.2783930003643035888671875 + ((0.23038899898529052734375 + (0.07810799777507781982421875 * (_7314 * _7314))) * _7314)) * _7314);
        float _7328 = _7325 * _7325;
        float _7343 = clamp(_6596.w * (0.5 - (0.5 * (_7312 - (_7312 / (_7328 * _7328))))), 0.0, 1.0);
        _18457 = vec4(_6596.xyz * _7343, _7343);
    }
    else
    {
        _18457 = vec4(0.0);
    }
    vec4 _19368;
    SPIRV_CROSS_BRANCH
    if (((esia_v7.x & _2747) != 0u) && (!_4377))
    {
        uint _7368 = max(uint(_188.gConv.z), 1u);
        vec4 _7402 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _7368) * 24u) + 9u), int(esia_v1 / _7368), 0).xy, 0);
        uint _7409 = max(uint(_188.gConv.z), 1u);
        vec4 _7443 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _7409) * 24u) + 10u), int(esia_v1 / _7409), 0).xy, 0);
        float _4445 = max(_7443.x, 0.001000000047497451305389404296875);
        float _18450;
        float _18453;
        SPIRV_CROSS_BRANCH
        if ((esia_v7.x & _2776) != 0u)
        {
            uint _7450 = max(uint(_188.gConv.z), 1u);
            vec4 _7484 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _7450) * 24u) + 22u), int(esia_v1 / _7450), 0).xy, 0);
            vec2 _4461 = (esia_v2.xy + esia_v2.zw) * 0.5;
            vec2 _4470 = max((esia_v2.zw - esia_v2.xy) * 0.5, vec2(0.001000000047497451305389404296875));
            vec2 _4477 = esia_v2.xy - _7484.xy;
            vec2 _4484 = _7484.zw - esia_v2.zw;
            vec2 _4514 = clamp(vec2((esia_v0.x < _4461.x) ? _4477.x : _4484.x, (esia_v0.y < _4461.y) ? _4477.y : _4484.y) * vec2(0.58823525905609130859375), vec2(min(_4445, 1.5)), vec2(_4445));
            float _4519 = min(_4470.x, _4470.y);
            float _18448;
            SPIRV_CROSS_BRANCH
            if (esia_v7.z == 0u)
            {
                _18448 = min(((esia_v0.x > _4461.x) ? ((esia_v0.y > _4461.y) ? esia_v3.z : esia_v3.y) : ((esia_v0.y > _4461.y) ? esia_v3.w : esia_v3.x)) * (1.0 + (0.60000002384185791015625 * esia_v5.y)), _4519);
            }
            else
            {
                _18448 = _4519;
            }
            vec2 _4568 = max(abs(esia_v0 - _4461) - (_4470 - vec2(_18448)), vec2(0.0));
            float _4570 = length(_4568);
            vec2 _4576 = _4568 / vec2(_4570);
            bvec2 _4577 = bvec2(_4570 > 9.9999997473787516355514526367188e-05);
            vec2 _4578 = vec2(_4577.x ? _4576.x : vec2(0.707099974155426025390625).x, _4577.y ? _4576.y : vec2(0.707099974155426025390625).y);
            vec2 _4593 = esia_v0 - _7484.xy;
            vec2 _4598 = _7484.zw - esia_v0;
            _18453 = clamp(min(min(_4593.x, _4593.y), min(_4598.x, _4598.y)) * 0.666666686534881591796875, 0.0, 1.0);
            _18450 = inversesqrt(dot(_4578 * _4578, vec2(1.0) / (_4514 * _4514)));
        }
        else
        {
            _18453 = 1.0;
            _18450 = _4445;
        }
        float _4616 = max(_18340, 0.0) / _18450;
        float _7492 = clamp(_7402.w * clamp((exp(((-_4616) * _4616) * 2.2000000476837158203125) * _7443.y) * _18453, 0.0, 1.0), 0.0, 1.0);
        _19368 = vec4(_7402.xyz * _7492, _7492) + (_18457 * (1.0 - _7492));
    }
    else
    {
        _19368 = _18457;
    }
    vec4 _19897;
    vec4 _20071;
    float _20465;
    SPIRV_CROSS_BRANCH
    if (((esia_v7.x & _2993) != 0u) && (_4322 > 0.0))
    {
        uint _7517 = max(uint(_188.gConv.z), 1u);
        vec4 _7551 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _7517) * 24u) + 11u), int(esia_v1 / _7517), 0).xy, 0);
        uint _7558 = max(uint(_188.gConv.z), 1u);
        vec4 _7592 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _7558) * 24u) + 12u), int(esia_v1 / _7558), 0).xy, 0);
        uint _7599 = max(uint(_188.gConv.z), 1u);
        vec4 _7633 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _7599) * 24u) + 13u), int(esia_v1 / _7599), 0).xy, 0);
        uint _7640 = max(uint(_188.gConv.z), 1u);
        vec4 _7674 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _7640) * 24u) + 16u), int(esia_v1 / _7640), 0).xy, 0);
        float _7744 = _7551.x * _188.gDisplay.z;
        float _7746 = _7551.y;
        vec2 _7755 = max((esia_v2.zw - esia_v2.xy) * 0.5, vec2(1.0));
        float _7763 = clamp(_7551.z, 0.001000000047497451305389404296875, min(_7755.x, _7755.y));
        float _7765 = _7551.w;
        float _7772 = clamp(1.0 - (max(-_18340, 0.0) / _7763), 0.0, 1.0);
        float _7778 = sqrt(clamp(1.0 - (_7772 * _7772), 0.0, 1.0));
        vec2 _18569;
        vec3 _19146;
        SPIRV_CROSS_BRANCH
        if (_7772 > 0.0)
        {
            vec2 _8185 = esia_v0 + vec2(0.5, 0.0);
            vec2 _8255 = (esia_v2.xy + esia_v2.zw) * 0.5;
            vec2 _8264 = max((esia_v2.zw - esia_v2.xy) * 0.5, vec2(0.001000000047497451305389404296875));
            float _18505;
            SPIRV_CROSS_BRANCH
            if ((esia_v7.x & _1379) != 0u)
            {
                float _8370 = 1.0 / max(esia_v5.z, 9.9999999747524270787835121154785e-07);
                vec4 _8404 = textureLod(SPIRV_Cross_CombinedgTexgLinear, mix(_18315.xy, _18315.zw, (clamp(_8185, _18321.xy, _18321.zw) - _18321.xy) / max(_18321.zw - _18321.xy, vec2(9.9999999747524270787835121154785e-07))), 0.0);
                float _8428 = (_8404.w - 0.5) * esia_v3.y;
                vec2 _8469 = abs(_8185 - ((_18321.xy + _18321.zw) * 0.5)) - max(((_18321.zw - _18321.xy) * 0.5) - vec2(((0.5 * esia_v3.y) + 1.0) * _8370), vec2(0.0));
                _18505 = max((-mix((max(min(_8404.x, _8404.y), min(max(_8404.x, _8404.y), _8404.z)) - 0.5) * esia_v3.x, _8428, clamp(abs(_8428) - ((0.5 * esia_v3.x) - 1.5), 0.0, 1.0))) * _8370, length(max(_8469, vec2(0.0))) + min(max(_8469.x, _8469.y), 0.0)) - esia_v5.w;
            }
            else
            {
                float _18506;
                if (esia_v7.z == 1u)
                {
                    vec2 _8279 = _8185 - _8255;
                    float _18504;
                    do
                    {
                        if (esia_v5.w >= 6.282185077667236328125)
                        {
                            _18504 = abs(length(_8279) - esia_v3.x) - esia_v3.y;
                            break;
                        }
                        float _8513 = esia_v5.z + (esia_v5.w * 0.5);
                        float _8515 = cos(_8513);
                        float _8517 = sin(_8513);
                        float _8526 = dot(_8279, vec2(-_8517, _8515));
                        float _8529 = dot(_8279, vec2(_8515, _8517));
                        vec2 _8530 = vec2(_8526, _8529);
                        float _8533 = abs(_8526);
                        _8530.x = _8533;
                        float _8536 = esia_v5.w * 0.5;
                        float _8538 = sin(_8536);
                        float _8540 = cos(_8536);
                        _18504 = (((_8540 * _8533) > (_8538 * _8529)) ? length(_8530 - (vec2(_8538, _8540) * esia_v3.x)) : abs(length(_8530) - esia_v3.x)) - esia_v3.y;
                        break;
                    } while(false);
                    _18506 = _18504;
                }
                else
                {
                    float _18507;
                    if (esia_v7.z == 2u)
                    {
                        vec2 _8576 = _8185 - _18321.xy;
                        vec2 _8579 = _18321.zw - _18321.xy;
                        _18507 = length(_8576 - (_8579 * clamp(dot(_8576, _8579) / max(dot(_8579, _8579), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - esia_v3.x;
                    }
                    else
                    {
                        vec2 _8306 = _8185 - _8255;
                        float _8632 = min(_8264.x, _8264.y);
                        float _8635 = min((_8306.x > 0.0) ? ((_8306.y > 0.0) ? esia_v3.z : esia_v3.y) : ((_8306.y > 0.0) ? esia_v3.w : esia_v3.x), _8632);
                        float _8641 = _8635 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                        float _18489;
                        float _18490;
                        if (_8641 > _8632)
                        {
                            float _8655 = esia_v5.y * clamp((_8632 - _8635) / max(0.60000002384185791015625 * _8635, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _18490 = _8655;
                            _18489 = _8635 * (1.0 + (0.60000002384185791015625 * _8655));
                        }
                        else
                        {
                            _18490 = esia_v5.y;
                            _18489 = _8641;
                        }
                        vec2 _8668 = (abs(_8306) - _8264) + vec2(_18489);
                        vec2 _8670 = max(_8668, vec2(0.0));
                        float _18491;
                        SPIRV_CROSS_BRANCH
                        if ((_8670.x > 0.0) && (_8670.y > 0.0))
                        {
                            float _18492;
                            if ((_18490 > 0.001000000047497451305389404296875) && (_18489 > 9.9999997473787516355514526367188e-05))
                            {
                                float _8687 = 2.0 + (2.0 * _18490);
                                vec2 _8692 = _8670 / vec2(max(_18489, 9.9999997473787516355514526367188e-05));
                                _18492 = pow(pow(_8692.x, _8687) + pow(_8692.y, _8687), 1.0 / _8687) * _18489;
                            }
                            else
                            {
                                _18492 = length(_8670);
                            }
                            _18491 = _18492;
                        }
                        else
                        {
                            _18491 = max(_8670.x, _8670.y);
                        }
                        float _8727 = (min(max(_8668.x, _8668.y), 0.0) + _18491) - _18489;
                        float _18508;
                        SPIRV_CROSS_BRANCH
                        if ((esia_v7.x & _1448) != 0u)
                        {
                            vec2 _8334 = max((_18321.zw - _18321.xy) * 0.5, vec2(0.001000000047497451305389404296875));
                            vec2 _8337 = _8185 - ((_18321.xy + _18321.zw) * 0.5);
                            float _8763 = min(_8334.x, _8334.y);
                            float _8766 = min((_8337.x > 0.0) ? ((_8337.y > 0.0) ? _7674.x : _7674.x) : ((_8337.y > 0.0) ? _7674.x : _7674.x), _8763);
                            float _8772 = _8766 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                            float _18495;
                            float _18496;
                            if (_8772 > _8763)
                            {
                                float _8786 = esia_v5.y * clamp((_8763 - _8766) / max(0.60000002384185791015625 * _8766, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _18496 = _8786;
                                _18495 = _8766 * (1.0 + (0.60000002384185791015625 * _8786));
                            }
                            else
                            {
                                _18496 = esia_v5.y;
                                _18495 = _8772;
                            }
                            vec2 _8799 = (abs(_8337) - _8334) + vec2(_18495);
                            vec2 _8801 = max(_8799, vec2(0.0));
                            float _18497;
                            SPIRV_CROSS_BRANCH
                            if ((_8801.x > 0.0) && (_8801.y > 0.0))
                            {
                                float _18498;
                                if ((_18496 > 0.001000000047497451305389404296875) && (_18495 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _8818 = 2.0 + (2.0 * _18496);
                                    vec2 _8823 = _8801 / vec2(max(_18495, 9.9999997473787516355514526367188e-05));
                                    _18498 = pow(pow(_8823.x, _8818) + pow(_8823.y, _8818), 1.0 / _8818) * _18495;
                                }
                                else
                                {
                                    _18498 = length(_8801);
                                }
                                _18497 = _18498;
                            }
                            else
                            {
                                _18497 = max(_8801.x, _8801.y);
                            }
                            float _8858 = (min(max(_8799.x, _8799.y), 0.0) + _18497) - _18495;
                            float _8863 = max(_7674.y, 9.9999997473787516355514526367188e-05);
                            float _8872 = max(_8863 - abs(_8727 - _8858), 0.0) / _8863;
                            _18508 = min(_8727, _8858) - (((_8872 * _8872) * _8863) * 0.25);
                        }
                        else
                        {
                            _18508 = _8727;
                        }
                        _18507 = _18508;
                    }
                    _18506 = _18507;
                }
                _18505 = _18506;
            }
            vec2 _8189 = esia_v0 - vec2(0.5, 0.0);
            vec2 _8923 = (esia_v2.xy + esia_v2.zw) * 0.5;
            vec2 _8932 = max((esia_v2.zw - esia_v2.xy) * 0.5, vec2(0.001000000047497451305389404296875));
            float _18525;
            SPIRV_CROSS_BRANCH
            if ((esia_v7.x & _1379) != 0u)
            {
                float _9038 = 1.0 / max(esia_v5.z, 9.9999999747524270787835121154785e-07);
                vec4 _9072 = textureLod(SPIRV_Cross_CombinedgTexgLinear, mix(_18315.xy, _18315.zw, (clamp(_8189, _18321.xy, _18321.zw) - _18321.xy) / max(_18321.zw - _18321.xy, vec2(9.9999999747524270787835121154785e-07))), 0.0);
                float _9096 = (_9072.w - 0.5) * esia_v3.y;
                vec2 _9137 = abs(_8189 - ((_18321.xy + _18321.zw) * 0.5)) - max(((_18321.zw - _18321.xy) * 0.5) - vec2(((0.5 * esia_v3.y) + 1.0) * _9038), vec2(0.0));
                _18525 = max((-mix((max(min(_9072.x, _9072.y), min(max(_9072.x, _9072.y), _9072.z)) - 0.5) * esia_v3.x, _9096, clamp(abs(_9096) - ((0.5 * esia_v3.x) - 1.5), 0.0, 1.0))) * _9038, length(max(_9137, vec2(0.0))) + min(max(_9137.x, _9137.y), 0.0)) - esia_v5.w;
            }
            else
            {
                float _18526;
                if (esia_v7.z == 1u)
                {
                    vec2 _8947 = _8189 - _8923;
                    float _18524;
                    do
                    {
                        if (esia_v5.w >= 6.282185077667236328125)
                        {
                            _18524 = abs(length(_8947) - esia_v3.x) - esia_v3.y;
                            break;
                        }
                        float _9181 = esia_v5.z + (esia_v5.w * 0.5);
                        float _9183 = cos(_9181);
                        float _9185 = sin(_9181);
                        float _9194 = dot(_8947, vec2(-_9185, _9183));
                        float _9197 = dot(_8947, vec2(_9183, _9185));
                        vec2 _9198 = vec2(_9194, _9197);
                        float _9201 = abs(_9194);
                        _9198.x = _9201;
                        float _9204 = esia_v5.w * 0.5;
                        float _9206 = sin(_9204);
                        float _9208 = cos(_9204);
                        _18524 = (((_9208 * _9201) > (_9206 * _9197)) ? length(_9198 - (vec2(_9206, _9208) * esia_v3.x)) : abs(length(_9198) - esia_v3.x)) - esia_v3.y;
                        break;
                    } while(false);
                    _18526 = _18524;
                }
                else
                {
                    float _18527;
                    if (esia_v7.z == 2u)
                    {
                        vec2 _9244 = _8189 - _18321.xy;
                        vec2 _9247 = _18321.zw - _18321.xy;
                        _18527 = length(_9244 - (_9247 * clamp(dot(_9244, _9247) / max(dot(_9247, _9247), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - esia_v3.x;
                    }
                    else
                    {
                        vec2 _8974 = _8189 - _8923;
                        float _9300 = min(_8932.x, _8932.y);
                        float _9303 = min((_8974.x > 0.0) ? ((_8974.y > 0.0) ? esia_v3.z : esia_v3.y) : ((_8974.y > 0.0) ? esia_v3.w : esia_v3.x), _9300);
                        float _9309 = _9303 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                        float _18509;
                        float _18510;
                        if (_9309 > _9300)
                        {
                            float _9323 = esia_v5.y * clamp((_9300 - _9303) / max(0.60000002384185791015625 * _9303, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _18510 = _9323;
                            _18509 = _9303 * (1.0 + (0.60000002384185791015625 * _9323));
                        }
                        else
                        {
                            _18510 = esia_v5.y;
                            _18509 = _9309;
                        }
                        vec2 _9336 = (abs(_8974) - _8932) + vec2(_18509);
                        vec2 _9338 = max(_9336, vec2(0.0));
                        float _18511;
                        SPIRV_CROSS_BRANCH
                        if ((_9338.x > 0.0) && (_9338.y > 0.0))
                        {
                            float _18512;
                            if ((_18510 > 0.001000000047497451305389404296875) && (_18509 > 9.9999997473787516355514526367188e-05))
                            {
                                float _9355 = 2.0 + (2.0 * _18510);
                                vec2 _9360 = _9338 / vec2(max(_18509, 9.9999997473787516355514526367188e-05));
                                _18512 = pow(pow(_9360.x, _9355) + pow(_9360.y, _9355), 1.0 / _9355) * _18509;
                            }
                            else
                            {
                                _18512 = length(_9338);
                            }
                            _18511 = _18512;
                        }
                        else
                        {
                            _18511 = max(_9338.x, _9338.y);
                        }
                        float _9395 = (min(max(_9336.x, _9336.y), 0.0) + _18511) - _18509;
                        float _18528;
                        SPIRV_CROSS_BRANCH
                        if ((esia_v7.x & _1448) != 0u)
                        {
                            vec2 _9002 = max((_18321.zw - _18321.xy) * 0.5, vec2(0.001000000047497451305389404296875));
                            vec2 _9005 = _8189 - ((_18321.xy + _18321.zw) * 0.5);
                            float _9431 = min(_9002.x, _9002.y);
                            float _9434 = min((_9005.x > 0.0) ? ((_9005.y > 0.0) ? _7674.x : _7674.x) : ((_9005.y > 0.0) ? _7674.x : _7674.x), _9431);
                            float _9440 = _9434 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                            float _18515;
                            float _18516;
                            if (_9440 > _9431)
                            {
                                float _9454 = esia_v5.y * clamp((_9431 - _9434) / max(0.60000002384185791015625 * _9434, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _18516 = _9454;
                                _18515 = _9434 * (1.0 + (0.60000002384185791015625 * _9454));
                            }
                            else
                            {
                                _18516 = esia_v5.y;
                                _18515 = _9440;
                            }
                            vec2 _9467 = (abs(_9005) - _9002) + vec2(_18515);
                            vec2 _9469 = max(_9467, vec2(0.0));
                            float _18517;
                            SPIRV_CROSS_BRANCH
                            if ((_9469.x > 0.0) && (_9469.y > 0.0))
                            {
                                float _18518;
                                if ((_18516 > 0.001000000047497451305389404296875) && (_18515 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _9486 = 2.0 + (2.0 * _18516);
                                    vec2 _9491 = _9469 / vec2(max(_18515, 9.9999997473787516355514526367188e-05));
                                    _18518 = pow(pow(_9491.x, _9486) + pow(_9491.y, _9486), 1.0 / _9486) * _18515;
                                }
                                else
                                {
                                    _18518 = length(_9469);
                                }
                                _18517 = _18518;
                            }
                            else
                            {
                                _18517 = max(_9469.x, _9469.y);
                            }
                            float _9526 = (min(max(_9467.x, _9467.y), 0.0) + _18517) - _18515;
                            float _9531 = max(_7674.y, 9.9999997473787516355514526367188e-05);
                            float _9540 = max(_9531 - abs(_9395 - _9526), 0.0) / _9531;
                            _18528 = min(_9395, _9526) - (((_9540 * _9540) * _9531) * 0.25);
                        }
                        else
                        {
                            _18528 = _9395;
                        }
                        _18527 = _18528;
                    }
                    _18526 = _18527;
                }
                _18525 = _18526;
            }
            vec2 _8194 = esia_v0 + vec2(0.0, 0.5);
            vec2 _9591 = (esia_v2.xy + esia_v2.zw) * 0.5;
            vec2 _9600 = max((esia_v2.zw - esia_v2.xy) * 0.5, vec2(0.001000000047497451305389404296875));
            float _18545;
            SPIRV_CROSS_BRANCH
            if ((esia_v7.x & _1379) != 0u)
            {
                float _9706 = 1.0 / max(esia_v5.z, 9.9999999747524270787835121154785e-07);
                vec4 _9740 = textureLod(SPIRV_Cross_CombinedgTexgLinear, mix(_18315.xy, _18315.zw, (clamp(_8194, _18321.xy, _18321.zw) - _18321.xy) / max(_18321.zw - _18321.xy, vec2(9.9999999747524270787835121154785e-07))), 0.0);
                float _9764 = (_9740.w - 0.5) * esia_v3.y;
                vec2 _9805 = abs(_8194 - ((_18321.xy + _18321.zw) * 0.5)) - max(((_18321.zw - _18321.xy) * 0.5) - vec2(((0.5 * esia_v3.y) + 1.0) * _9706), vec2(0.0));
                _18545 = max((-mix((max(min(_9740.x, _9740.y), min(max(_9740.x, _9740.y), _9740.z)) - 0.5) * esia_v3.x, _9764, clamp(abs(_9764) - ((0.5 * esia_v3.x) - 1.5), 0.0, 1.0))) * _9706, length(max(_9805, vec2(0.0))) + min(max(_9805.x, _9805.y), 0.0)) - esia_v5.w;
            }
            else
            {
                float _18546;
                if (esia_v7.z == 1u)
                {
                    vec2 _9615 = _8194 - _9591;
                    float _18544;
                    do
                    {
                        if (esia_v5.w >= 6.282185077667236328125)
                        {
                            _18544 = abs(length(_9615) - esia_v3.x) - esia_v3.y;
                            break;
                        }
                        float _9849 = esia_v5.z + (esia_v5.w * 0.5);
                        float _9851 = cos(_9849);
                        float _9853 = sin(_9849);
                        float _9862 = dot(_9615, vec2(-_9853, _9851));
                        float _9865 = dot(_9615, vec2(_9851, _9853));
                        vec2 _9866 = vec2(_9862, _9865);
                        float _9869 = abs(_9862);
                        _9866.x = _9869;
                        float _9872 = esia_v5.w * 0.5;
                        float _9874 = sin(_9872);
                        float _9876 = cos(_9872);
                        _18544 = (((_9876 * _9869) > (_9874 * _9865)) ? length(_9866 - (vec2(_9874, _9876) * esia_v3.x)) : abs(length(_9866) - esia_v3.x)) - esia_v3.y;
                        break;
                    } while(false);
                    _18546 = _18544;
                }
                else
                {
                    float _18547;
                    if (esia_v7.z == 2u)
                    {
                        vec2 _9912 = _8194 - _18321.xy;
                        vec2 _9915 = _18321.zw - _18321.xy;
                        _18547 = length(_9912 - (_9915 * clamp(dot(_9912, _9915) / max(dot(_9915, _9915), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - esia_v3.x;
                    }
                    else
                    {
                        vec2 _9642 = _8194 - _9591;
                        float _9968 = min(_9600.x, _9600.y);
                        float _9971 = min((_9642.x > 0.0) ? ((_9642.y > 0.0) ? esia_v3.z : esia_v3.y) : ((_9642.y > 0.0) ? esia_v3.w : esia_v3.x), _9968);
                        float _9977 = _9971 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                        float _18529;
                        float _18530;
                        if (_9977 > _9968)
                        {
                            float _9991 = esia_v5.y * clamp((_9968 - _9971) / max(0.60000002384185791015625 * _9971, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _18530 = _9991;
                            _18529 = _9971 * (1.0 + (0.60000002384185791015625 * _9991));
                        }
                        else
                        {
                            _18530 = esia_v5.y;
                            _18529 = _9977;
                        }
                        vec2 _10004 = (abs(_9642) - _9600) + vec2(_18529);
                        vec2 _10006 = max(_10004, vec2(0.0));
                        float _18531;
                        SPIRV_CROSS_BRANCH
                        if ((_10006.x > 0.0) && (_10006.y > 0.0))
                        {
                            float _18532;
                            if ((_18530 > 0.001000000047497451305389404296875) && (_18529 > 9.9999997473787516355514526367188e-05))
                            {
                                float _10023 = 2.0 + (2.0 * _18530);
                                vec2 _10028 = _10006 / vec2(max(_18529, 9.9999997473787516355514526367188e-05));
                                _18532 = pow(pow(_10028.x, _10023) + pow(_10028.y, _10023), 1.0 / _10023) * _18529;
                            }
                            else
                            {
                                _18532 = length(_10006);
                            }
                            _18531 = _18532;
                        }
                        else
                        {
                            _18531 = max(_10006.x, _10006.y);
                        }
                        float _10063 = (min(max(_10004.x, _10004.y), 0.0) + _18531) - _18529;
                        float _18548;
                        SPIRV_CROSS_BRANCH
                        if ((esia_v7.x & _1448) != 0u)
                        {
                            vec2 _9670 = max((_18321.zw - _18321.xy) * 0.5, vec2(0.001000000047497451305389404296875));
                            vec2 _9673 = _8194 - ((_18321.xy + _18321.zw) * 0.5);
                            float _10099 = min(_9670.x, _9670.y);
                            float _10102 = min((_9673.x > 0.0) ? ((_9673.y > 0.0) ? _7674.x : _7674.x) : ((_9673.y > 0.0) ? _7674.x : _7674.x), _10099);
                            float _10108 = _10102 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                            float _18535;
                            float _18536;
                            if (_10108 > _10099)
                            {
                                float _10122 = esia_v5.y * clamp((_10099 - _10102) / max(0.60000002384185791015625 * _10102, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _18536 = _10122;
                                _18535 = _10102 * (1.0 + (0.60000002384185791015625 * _10122));
                            }
                            else
                            {
                                _18536 = esia_v5.y;
                                _18535 = _10108;
                            }
                            vec2 _10135 = (abs(_9673) - _9670) + vec2(_18535);
                            vec2 _10137 = max(_10135, vec2(0.0));
                            float _18537;
                            SPIRV_CROSS_BRANCH
                            if ((_10137.x > 0.0) && (_10137.y > 0.0))
                            {
                                float _18538;
                                if ((_18536 > 0.001000000047497451305389404296875) && (_18535 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _10154 = 2.0 + (2.0 * _18536);
                                    vec2 _10159 = _10137 / vec2(max(_18535, 9.9999997473787516355514526367188e-05));
                                    _18538 = pow(pow(_10159.x, _10154) + pow(_10159.y, _10154), 1.0 / _10154) * _18535;
                                }
                                else
                                {
                                    _18538 = length(_10137);
                                }
                                _18537 = _18538;
                            }
                            else
                            {
                                _18537 = max(_10137.x, _10137.y);
                            }
                            float _10194 = (min(max(_10135.x, _10135.y), 0.0) + _18537) - _18535;
                            float _10199 = max(_7674.y, 9.9999997473787516355514526367188e-05);
                            float _10208 = max(_10199 - abs(_10063 - _10194), 0.0) / _10199;
                            _18548 = min(_10063, _10194) - (((_10208 * _10208) * _10199) * 0.25);
                        }
                        else
                        {
                            _18548 = _10063;
                        }
                        _18547 = _18548;
                    }
                    _18546 = _18547;
                }
                _18545 = _18546;
            }
            vec2 _8198 = esia_v0 - vec2(0.0, 0.5);
            vec2 _10259 = (esia_v2.xy + esia_v2.zw) * 0.5;
            vec2 _10268 = max((esia_v2.zw - esia_v2.xy) * 0.5, vec2(0.001000000047497451305389404296875));
            float _18565;
            SPIRV_CROSS_BRANCH
            if ((esia_v7.x & _1379) != 0u)
            {
                float _10374 = 1.0 / max(esia_v5.z, 9.9999999747524270787835121154785e-07);
                vec4 _10408 = textureLod(SPIRV_Cross_CombinedgTexgLinear, mix(_18315.xy, _18315.zw, (clamp(_8198, _18321.xy, _18321.zw) - _18321.xy) / max(_18321.zw - _18321.xy, vec2(9.9999999747524270787835121154785e-07))), 0.0);
                float _10432 = (_10408.w - 0.5) * esia_v3.y;
                vec2 _10473 = abs(_8198 - ((_18321.xy + _18321.zw) * 0.5)) - max(((_18321.zw - _18321.xy) * 0.5) - vec2(((0.5 * esia_v3.y) + 1.0) * _10374), vec2(0.0));
                _18565 = max((-mix((max(min(_10408.x, _10408.y), min(max(_10408.x, _10408.y), _10408.z)) - 0.5) * esia_v3.x, _10432, clamp(abs(_10432) - ((0.5 * esia_v3.x) - 1.5), 0.0, 1.0))) * _10374, length(max(_10473, vec2(0.0))) + min(max(_10473.x, _10473.y), 0.0)) - esia_v5.w;
            }
            else
            {
                float _18566;
                if (esia_v7.z == 1u)
                {
                    vec2 _10283 = _8198 - _10259;
                    float _18564;
                    do
                    {
                        if (esia_v5.w >= 6.282185077667236328125)
                        {
                            _18564 = abs(length(_10283) - esia_v3.x) - esia_v3.y;
                            break;
                        }
                        float _10517 = esia_v5.z + (esia_v5.w * 0.5);
                        float _10519 = cos(_10517);
                        float _10521 = sin(_10517);
                        float _10530 = dot(_10283, vec2(-_10521, _10519));
                        float _10533 = dot(_10283, vec2(_10519, _10521));
                        vec2 _10534 = vec2(_10530, _10533);
                        float _10537 = abs(_10530);
                        _10534.x = _10537;
                        float _10540 = esia_v5.w * 0.5;
                        float _10542 = sin(_10540);
                        float _10544 = cos(_10540);
                        _18564 = (((_10544 * _10537) > (_10542 * _10533)) ? length(_10534 - (vec2(_10542, _10544) * esia_v3.x)) : abs(length(_10534) - esia_v3.x)) - esia_v3.y;
                        break;
                    } while(false);
                    _18566 = _18564;
                }
                else
                {
                    float _18567;
                    if (esia_v7.z == 2u)
                    {
                        vec2 _10580 = _8198 - _18321.xy;
                        vec2 _10583 = _18321.zw - _18321.xy;
                        _18567 = length(_10580 - (_10583 * clamp(dot(_10580, _10583) / max(dot(_10583, _10583), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - esia_v3.x;
                    }
                    else
                    {
                        vec2 _10310 = _8198 - _10259;
                        float _10636 = min(_10268.x, _10268.y);
                        float _10639 = min((_10310.x > 0.0) ? ((_10310.y > 0.0) ? esia_v3.z : esia_v3.y) : ((_10310.y > 0.0) ? esia_v3.w : esia_v3.x), _10636);
                        float _10645 = _10639 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                        float _18549;
                        float _18550;
                        if (_10645 > _10636)
                        {
                            float _10659 = esia_v5.y * clamp((_10636 - _10639) / max(0.60000002384185791015625 * _10639, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _18550 = _10659;
                            _18549 = _10639 * (1.0 + (0.60000002384185791015625 * _10659));
                        }
                        else
                        {
                            _18550 = esia_v5.y;
                            _18549 = _10645;
                        }
                        vec2 _10672 = (abs(_10310) - _10268) + vec2(_18549);
                        vec2 _10674 = max(_10672, vec2(0.0));
                        float _18551;
                        SPIRV_CROSS_BRANCH
                        if ((_10674.x > 0.0) && (_10674.y > 0.0))
                        {
                            float _18552;
                            if ((_18550 > 0.001000000047497451305389404296875) && (_18549 > 9.9999997473787516355514526367188e-05))
                            {
                                float _10691 = 2.0 + (2.0 * _18550);
                                vec2 _10696 = _10674 / vec2(max(_18549, 9.9999997473787516355514526367188e-05));
                                _18552 = pow(pow(_10696.x, _10691) + pow(_10696.y, _10691), 1.0 / _10691) * _18549;
                            }
                            else
                            {
                                _18552 = length(_10674);
                            }
                            _18551 = _18552;
                        }
                        else
                        {
                            _18551 = max(_10674.x, _10674.y);
                        }
                        float _10731 = (min(max(_10672.x, _10672.y), 0.0) + _18551) - _18549;
                        float _18568;
                        SPIRV_CROSS_BRANCH
                        if ((esia_v7.x & _1448) != 0u)
                        {
                            vec2 _10338 = max((_18321.zw - _18321.xy) * 0.5, vec2(0.001000000047497451305389404296875));
                            vec2 _10341 = _8198 - ((_18321.xy + _18321.zw) * 0.5);
                            float _10767 = min(_10338.x, _10338.y);
                            float _10770 = min((_10341.x > 0.0) ? ((_10341.y > 0.0) ? _7674.x : _7674.x) : ((_10341.y > 0.0) ? _7674.x : _7674.x), _10767);
                            float _10776 = _10770 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                            float _18555;
                            float _18556;
                            if (_10776 > _10767)
                            {
                                float _10790 = esia_v5.y * clamp((_10767 - _10770) / max(0.60000002384185791015625 * _10770, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _18556 = _10790;
                                _18555 = _10770 * (1.0 + (0.60000002384185791015625 * _10790));
                            }
                            else
                            {
                                _18556 = esia_v5.y;
                                _18555 = _10776;
                            }
                            vec2 _10803 = (abs(_10341) - _10338) + vec2(_18555);
                            vec2 _10805 = max(_10803, vec2(0.0));
                            float _18557;
                            SPIRV_CROSS_BRANCH
                            if ((_10805.x > 0.0) && (_10805.y > 0.0))
                            {
                                float _18558;
                                if ((_18556 > 0.001000000047497451305389404296875) && (_18555 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _10822 = 2.0 + (2.0 * _18556);
                                    vec2 _10827 = _10805 / vec2(max(_18555, 9.9999997473787516355514526367188e-05));
                                    _18558 = pow(pow(_10827.x, _10822) + pow(_10827.y, _10822), 1.0 / _10822) * _18555;
                                }
                                else
                                {
                                    _18558 = length(_10805);
                                }
                                _18557 = _18558;
                            }
                            else
                            {
                                _18557 = max(_10805.x, _10805.y);
                            }
                            float _10862 = (min(max(_10803.x, _10803.y), 0.0) + _18557) - _18555;
                            float _10867 = max(_7674.y, 9.9999997473787516355514526367188e-05);
                            float _10876 = max(_10867 - abs(_10731 - _10862), 0.0) / _10867;
                            _18568 = min(_10731, _10862) - (((_10876 * _10876) * _10867) * 0.25);
                        }
                        else
                        {
                            _18568 = _10731;
                        }
                        _18567 = _18568;
                    }
                    _18566 = _18567;
                }
                _18565 = _18566;
            }
            vec2 _8204 = vec2(_18505 - _18525, _18545 - _18565);
            float _8206 = length(_8204);
            vec2 _8212 = _8204 / vec2(_8206);
            bvec2 _8213 = bvec2(_8206 > 9.9999997473787516355514526367188e-06);
            vec2 _8214 = vec2(_8213.x ? _8212.x : vec2(0.0, -1.0).x, _8213.y ? _8212.y : vec2(0.0, -1.0).y);
            _19146 = normalize(vec3(_8214 * min(_7772 / max(_7778, 0.001000000047497451305389404296875), 8.0), 1.0));
            _18569 = _8214;
        }
        else
        {
            _19146 = vec3(0.0, 0.0, 1.0);
            _18569 = vec2(0.0, -1.0);
        }
        vec2 _7804 = ((-_18569) * _7746) * (1.0 - _7778);
        float _7806 = _7674.z;
        vec2 _18570;
        SPIRV_CROSS_BRANCH
        if (_7806 > 0.0)
        {
            _18570 = (((esia_v2.xy + esia_v2.zw) * 0.5) - esia_v0) * (_7806 / (1.0 + _7806));
        }
        else
        {
            _18570 = vec2(0.0);
        }
        vec2 _7830 = _18314 * _188.gTarget.zw;
        vec2 _7837 = _188.gDisplay.zw * _188.gTarget.zw;
        vec2 _7842 = (_7804 + _18570) * _7837;
        vec2 _7845 = _7804 * _7837;
        vec3 _19028;
        float _19046;
        vec3 _19249;
        if (_188.gTime.z > 0.5)
        {
            vec2 _7852 = _7830 + _7842;
            float _10901 = clamp(log2(max(_7744, 1.0)) - 1.0, 0.0, 5.0);
            int _10904 = int(floor(_10901));
            float _10908 = _10901 - float(_10904);
            bool _10913 = (_10908 > 0.0199999995529651641845703125) && (_10904 < 5);
            vec3 _18641;
            _18641 = vec3(0.0);
            vec3 _10942;
            SPIRV_CROSS_LOOP
            for (int _18571 = 0; _18571 < 2; _18641 = _10942, _18571++)
            {
                if ((_18571 > 0) && (!_10913))
                {
                    break;
                }
                int _10928 = _10904 + _18571;
                int _10966 = clamp(_10928, 1, 5);
                vec2 _11035 = (_7852 * _188.gLevel[_10966].xy) - vec2(0.5);
                vec2 _11037 = floor(_11035);
                vec2 _11040 = _11035 - _11037;
                vec2 _11043 = _11040 * _11040;
                vec2 _11046 = _11043 * _11040;
                vec2 _11065 = (((_11046 * 3.0) - (_11043 * 6.0)) + vec2(4.0)) * 0.16666667163372039794921875;
                vec2 _11078 = _11046 * 0.16666667163372039794921875;
                vec2 _11081 = (((((-_11046) + (_11043 * 3.0)) - (_11040 * 3.0)) + vec2(1.0)) * 0.16666667163372039794921875) + _11065;
                vec2 _11085 = (((((_11046 * (-3.0)) + (_11043 * 3.0)) + (_11040 * 3.0)) + vec2(1.0)) * 0.16666667163372039794921875) + _11078;
                vec2 _11097 = ((_11037 - vec2(0.5)) + (_11065 / _11081)) * _188.gLevel[_10966].zw;
                vec2 _11109 = ((_11037 + vec2(1.5)) + (_11078 / _11085)) * _188.gLevel[_10966].zw;
                vec4 _18608;
                SPIRV_CROSS_BRANCH
                if (_10928 <= 0)
                {
                    vec2 _18607;
                    if (_188.gConv.x > 0.5)
                    {
                        vec2 _17630 = _7852;
                        _17630.y = 1.0 - _7852.y;
                        _18607 = _17630;
                    }
                    else
                    {
                        _18607 = _7852;
                    }
                    _18608 = textureLod(SPIRV_Cross_CombinedgBackdrop0gLinear, _18607, 0.0);
                }
                else
                {
                    vec4 _18609;
                    if (_10928 == 1)
                    {
                        vec2 _18600;
                        if (_188.gConv.x > 0.5)
                        {
                            vec2 _17635 = _11097;
                            _17635.y = 1.0 - _11097.y;
                            _18600 = _17635;
                        }
                        else
                        {
                            _18600 = _11097;
                        }
                        float _11154 = _11097.y;
                        vec2 _11155 = vec2(_11109.x, _11154);
                        vec2 _18601;
                        if (_188.gConv.x > 0.5)
                        {
                            vec2 _17642 = _11155;
                            _17642.y = 1.0 - _11154;
                            _18601 = _17642;
                        }
                        else
                        {
                            _18601 = _11155;
                        }
                        float _11172 = _11109.y;
                        vec2 _11173 = vec2(_11097.x, _11172);
                        vec2 _18603;
                        if (_188.gConv.x > 0.5)
                        {
                            vec2 _17649 = _11173;
                            _17649.y = 1.0 - _11172;
                            _18603 = _17649;
                        }
                        else
                        {
                            _18603 = _11173;
                        }
                        vec2 _18605;
                        if (_188.gConv.x > 0.5)
                        {
                            vec2 _17656 = _11109;
                            _17656.y = 1.0 - _11109.y;
                            _18605 = _17656;
                        }
                        else
                        {
                            _18605 = _11109;
                        }
                        _18609 = (((textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18600, 0.0) * (_11081.x * _11081.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18601, 0.0) * (_11085.x * _11081.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18603, 0.0) * (_11081.x * _11085.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18605, 0.0) * (_11085.x * _11085.y));
                    }
                    else
                    {
                        vec4 _18610;
                        if (_10928 == 2)
                        {
                            vec2 _18593;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17663 = _11097;
                                _17663.y = 1.0 - _11097.y;
                                _18593 = _17663;
                            }
                            else
                            {
                                _18593 = _11097;
                            }
                            float _11284 = _11097.y;
                            vec2 _11285 = vec2(_11109.x, _11284);
                            vec2 _18594;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17670 = _11285;
                                _17670.y = 1.0 - _11284;
                                _18594 = _17670;
                            }
                            else
                            {
                                _18594 = _11285;
                            }
                            float _11302 = _11109.y;
                            vec2 _11303 = vec2(_11097.x, _11302);
                            vec2 _18596;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17677 = _11303;
                                _17677.y = 1.0 - _11302;
                                _18596 = _17677;
                            }
                            else
                            {
                                _18596 = _11303;
                            }
                            vec2 _18598;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17684 = _11109;
                                _17684.y = 1.0 - _11109.y;
                                _18598 = _17684;
                            }
                            else
                            {
                                _18598 = _11109;
                            }
                            _18610 = (((textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18593, 0.0) * (_11081.x * _11081.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18594, 0.0) * (_11085.x * _11081.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18596, 0.0) * (_11081.x * _11085.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18598, 0.0) * (_11085.x * _11085.y));
                        }
                        else
                        {
                            vec4 _18611;
                            if (_10928 == 3)
                            {
                                vec2 _18586;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17691 = _11097;
                                    _17691.y = 1.0 - _11097.y;
                                    _18586 = _17691;
                                }
                                else
                                {
                                    _18586 = _11097;
                                }
                                float _11414 = _11097.y;
                                vec2 _11415 = vec2(_11109.x, _11414);
                                vec2 _18587;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17698 = _11415;
                                    _17698.y = 1.0 - _11414;
                                    _18587 = _17698;
                                }
                                else
                                {
                                    _18587 = _11415;
                                }
                                float _11432 = _11109.y;
                                vec2 _11433 = vec2(_11097.x, _11432);
                                vec2 _18589;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17705 = _11433;
                                    _17705.y = 1.0 - _11432;
                                    _18589 = _17705;
                                }
                                else
                                {
                                    _18589 = _11433;
                                }
                                vec2 _18591;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17712 = _11109;
                                    _17712.y = 1.0 - _11109.y;
                                    _18591 = _17712;
                                }
                                else
                                {
                                    _18591 = _11109;
                                }
                                _18611 = (((textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18586, 0.0) * (_11081.x * _11081.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18587, 0.0) * (_11085.x * _11081.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18589, 0.0) * (_11081.x * _11085.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18591, 0.0) * (_11085.x * _11085.y));
                            }
                            else
                            {
                                vec4 _18612;
                                if (_10928 == 4)
                                {
                                    vec2 _18579;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17719 = _11097;
                                        _17719.y = 1.0 - _11097.y;
                                        _18579 = _17719;
                                    }
                                    else
                                    {
                                        _18579 = _11097;
                                    }
                                    float _11544 = _11097.y;
                                    vec2 _11545 = vec2(_11109.x, _11544);
                                    vec2 _18580;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17726 = _11545;
                                        _17726.y = 1.0 - _11544;
                                        _18580 = _17726;
                                    }
                                    else
                                    {
                                        _18580 = _11545;
                                    }
                                    float _11562 = _11109.y;
                                    vec2 _11563 = vec2(_11097.x, _11562);
                                    vec2 _18582;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17733 = _11563;
                                        _17733.y = 1.0 - _11562;
                                        _18582 = _17733;
                                    }
                                    else
                                    {
                                        _18582 = _11563;
                                    }
                                    vec2 _18584;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17740 = _11109;
                                        _17740.y = 1.0 - _11109.y;
                                        _18584 = _17740;
                                    }
                                    else
                                    {
                                        _18584 = _11109;
                                    }
                                    _18612 = (((textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18579, 0.0) * (_11081.x * _11081.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18580, 0.0) * (_11085.x * _11081.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18582, 0.0) * (_11081.x * _11085.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18584, 0.0) * (_11085.x * _11085.y));
                                }
                                else
                                {
                                    vec2 _18572;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17747 = _11097;
                                        _17747.y = 1.0 - _11097.y;
                                        _18572 = _17747;
                                    }
                                    else
                                    {
                                        _18572 = _11097;
                                    }
                                    float _11674 = _11097.y;
                                    vec2 _11675 = vec2(_11109.x, _11674);
                                    vec2 _18573;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17754 = _11675;
                                        _17754.y = 1.0 - _11674;
                                        _18573 = _17754;
                                    }
                                    else
                                    {
                                        _18573 = _11675;
                                    }
                                    float _11692 = _11109.y;
                                    vec2 _11693 = vec2(_11097.x, _11692);
                                    vec2 _18575;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17761 = _11693;
                                        _17761.y = 1.0 - _11692;
                                        _18575 = _17761;
                                    }
                                    else
                                    {
                                        _18575 = _11693;
                                    }
                                    vec2 _18577;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17768 = _11109;
                                        _17768.y = 1.0 - _11109.y;
                                        _18577 = _17768;
                                    }
                                    else
                                    {
                                        _18577 = _11109;
                                    }
                                    _18612 = (((textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18572, 0.0) * (_11081.x * _11081.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18573, 0.0) * (_11085.x * _11081.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18575, 0.0) * (_11081.x * _11085.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18577, 0.0) * (_11085.x * _11085.y));
                                }
                                _18611 = _18612;
                            }
                            _18610 = _18611;
                        }
                        _18609 = _18610;
                    }
                    _18608 = _18609;
                }
                _10942 = _18641 + (_18608.xyz * (_10913 ? ((_18571 == 0) ? (1.0 - _10908) : _10908) : 1.0));
            }
            vec3 _19031;
            SPIRV_CROSS_BRANCH
            if (((_7765 > 0.001000000047497451305389404296875) && (_7772 > 0.0)) && ((((_7746 * 0.300000011920928955078125) * _7765) * _188.gDisplay.z) > (_7744 * 0.3499999940395355224609375)))
            {
                float _7872 = 0.300000011920928955078125 * _7765;
                vec2 _7879 = (_7830 + _7842) - (_7845 * _7872);
                float _11789 = clamp(log2(max(_7744, 1.0)) - 1.0, 0.0, 5.0);
                int _11792 = int(floor(_11789));
                float _11796 = _11789 - float(_11792);
                bool _11801 = (_11796 > 0.0199999995529651641845703125) && (_11792 < 5);
                vec3 _18737;
                _18737 = vec3(0.0);
                vec3 _11830;
                SPIRV_CROSS_LOOP
                for (int _18667 = 0; _18667 < 2; _18737 = _11830, _18667++)
                {
                    if ((_18667 > 0) && (!_11801))
                    {
                        break;
                    }
                    int _11816 = _11792 + _18667;
                    int _11854 = clamp(_11816, 1, 5);
                    vec2 _11923 = (_7879 * _188.gLevel[_11854].xy) - vec2(0.5);
                    vec2 _11925 = floor(_11923);
                    vec2 _11928 = _11923 - _11925;
                    vec2 _11931 = _11928 * _11928;
                    vec2 _11934 = _11931 * _11928;
                    vec2 _11953 = (((_11934 * 3.0) - (_11931 * 6.0)) + vec2(4.0)) * 0.16666667163372039794921875;
                    vec2 _11966 = _11934 * 0.16666667163372039794921875;
                    vec2 _11969 = (((((-_11934) + (_11931 * 3.0)) - (_11928 * 3.0)) + vec2(1.0)) * 0.16666667163372039794921875) + _11953;
                    vec2 _11973 = (((((_11934 * (-3.0)) + (_11931 * 3.0)) + (_11928 * 3.0)) + vec2(1.0)) * 0.16666667163372039794921875) + _11966;
                    vec2 _11985 = ((_11925 - vec2(0.5)) + (_11953 / _11969)) * _188.gLevel[_11854].zw;
                    vec2 _11997 = ((_11925 + vec2(1.5)) + (_11966 / _11973)) * _188.gLevel[_11854].zw;
                    vec4 _18704;
                    SPIRV_CROSS_BRANCH
                    if (_11816 <= 0)
                    {
                        vec2 _18703;
                        if (_188.gConv.x > 0.5)
                        {
                            vec2 _17773 = _7879;
                            _17773.y = 1.0 - _7879.y;
                            _18703 = _17773;
                        }
                        else
                        {
                            _18703 = _7879;
                        }
                        _18704 = textureLod(SPIRV_Cross_CombinedgBackdrop0gLinear, _18703, 0.0);
                    }
                    else
                    {
                        vec4 _18705;
                        if (_11816 == 1)
                        {
                            vec2 _18696;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17778 = _11985;
                                _17778.y = 1.0 - _11985.y;
                                _18696 = _17778;
                            }
                            else
                            {
                                _18696 = _11985;
                            }
                            float _12042 = _11985.y;
                            vec2 _12043 = vec2(_11997.x, _12042);
                            vec2 _18697;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17785 = _12043;
                                _17785.y = 1.0 - _12042;
                                _18697 = _17785;
                            }
                            else
                            {
                                _18697 = _12043;
                            }
                            float _12060 = _11997.y;
                            vec2 _12061 = vec2(_11985.x, _12060);
                            vec2 _18699;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17792 = _12061;
                                _17792.y = 1.0 - _12060;
                                _18699 = _17792;
                            }
                            else
                            {
                                _18699 = _12061;
                            }
                            vec2 _18701;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17799 = _11997;
                                _17799.y = 1.0 - _11997.y;
                                _18701 = _17799;
                            }
                            else
                            {
                                _18701 = _11997;
                            }
                            _18705 = (((textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18696, 0.0) * (_11969.x * _11969.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18697, 0.0) * (_11973.x * _11969.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18699, 0.0) * (_11969.x * _11973.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18701, 0.0) * (_11973.x * _11973.y));
                        }
                        else
                        {
                            vec4 _18706;
                            if (_11816 == 2)
                            {
                                vec2 _18689;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17806 = _11985;
                                    _17806.y = 1.0 - _11985.y;
                                    _18689 = _17806;
                                }
                                else
                                {
                                    _18689 = _11985;
                                }
                                float _12172 = _11985.y;
                                vec2 _12173 = vec2(_11997.x, _12172);
                                vec2 _18690;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17813 = _12173;
                                    _17813.y = 1.0 - _12172;
                                    _18690 = _17813;
                                }
                                else
                                {
                                    _18690 = _12173;
                                }
                                float _12190 = _11997.y;
                                vec2 _12191 = vec2(_11985.x, _12190);
                                vec2 _18692;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17820 = _12191;
                                    _17820.y = 1.0 - _12190;
                                    _18692 = _17820;
                                }
                                else
                                {
                                    _18692 = _12191;
                                }
                                vec2 _18694;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17827 = _11997;
                                    _17827.y = 1.0 - _11997.y;
                                    _18694 = _17827;
                                }
                                else
                                {
                                    _18694 = _11997;
                                }
                                _18706 = (((textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18689, 0.0) * (_11969.x * _11969.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18690, 0.0) * (_11973.x * _11969.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18692, 0.0) * (_11969.x * _11973.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18694, 0.0) * (_11973.x * _11973.y));
                            }
                            else
                            {
                                vec4 _18707;
                                if (_11816 == 3)
                                {
                                    vec2 _18682;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17834 = _11985;
                                        _17834.y = 1.0 - _11985.y;
                                        _18682 = _17834;
                                    }
                                    else
                                    {
                                        _18682 = _11985;
                                    }
                                    float _12302 = _11985.y;
                                    vec2 _12303 = vec2(_11997.x, _12302);
                                    vec2 _18683;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17841 = _12303;
                                        _17841.y = 1.0 - _12302;
                                        _18683 = _17841;
                                    }
                                    else
                                    {
                                        _18683 = _12303;
                                    }
                                    float _12320 = _11997.y;
                                    vec2 _12321 = vec2(_11985.x, _12320);
                                    vec2 _18685;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17848 = _12321;
                                        _17848.y = 1.0 - _12320;
                                        _18685 = _17848;
                                    }
                                    else
                                    {
                                        _18685 = _12321;
                                    }
                                    vec2 _18687;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17855 = _11997;
                                        _17855.y = 1.0 - _11997.y;
                                        _18687 = _17855;
                                    }
                                    else
                                    {
                                        _18687 = _11997;
                                    }
                                    _18707 = (((textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18682, 0.0) * (_11969.x * _11969.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18683, 0.0) * (_11973.x * _11969.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18685, 0.0) * (_11969.x * _11973.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18687, 0.0) * (_11973.x * _11973.y));
                                }
                                else
                                {
                                    vec4 _18708;
                                    if (_11816 == 4)
                                    {
                                        vec2 _18675;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _17862 = _11985;
                                            _17862.y = 1.0 - _11985.y;
                                            _18675 = _17862;
                                        }
                                        else
                                        {
                                            _18675 = _11985;
                                        }
                                        float _12432 = _11985.y;
                                        vec2 _12433 = vec2(_11997.x, _12432);
                                        vec2 _18676;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _17869 = _12433;
                                            _17869.y = 1.0 - _12432;
                                            _18676 = _17869;
                                        }
                                        else
                                        {
                                            _18676 = _12433;
                                        }
                                        float _12450 = _11997.y;
                                        vec2 _12451 = vec2(_11985.x, _12450);
                                        vec2 _18678;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _17876 = _12451;
                                            _17876.y = 1.0 - _12450;
                                            _18678 = _17876;
                                        }
                                        else
                                        {
                                            _18678 = _12451;
                                        }
                                        vec2 _18680;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _17883 = _11997;
                                            _17883.y = 1.0 - _11997.y;
                                            _18680 = _17883;
                                        }
                                        else
                                        {
                                            _18680 = _11997;
                                        }
                                        _18708 = (((textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18675, 0.0) * (_11969.x * _11969.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18676, 0.0) * (_11973.x * _11969.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18678, 0.0) * (_11969.x * _11973.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18680, 0.0) * (_11973.x * _11973.y));
                                    }
                                    else
                                    {
                                        vec2 _18668;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _17890 = _11985;
                                            _17890.y = 1.0 - _11985.y;
                                            _18668 = _17890;
                                        }
                                        else
                                        {
                                            _18668 = _11985;
                                        }
                                        float _12562 = _11985.y;
                                        vec2 _12563 = vec2(_11997.x, _12562);
                                        vec2 _18669;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _17897 = _12563;
                                            _17897.y = 1.0 - _12562;
                                            _18669 = _17897;
                                        }
                                        else
                                        {
                                            _18669 = _12563;
                                        }
                                        float _12580 = _11997.y;
                                        vec2 _12581 = vec2(_11985.x, _12580);
                                        vec2 _18671;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _17904 = _12581;
                                            _17904.y = 1.0 - _12580;
                                            _18671 = _17904;
                                        }
                                        else
                                        {
                                            _18671 = _12581;
                                        }
                                        vec2 _18673;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _17911 = _11997;
                                            _17911.y = 1.0 - _11997.y;
                                            _18673 = _17911;
                                        }
                                        else
                                        {
                                            _18673 = _11997;
                                        }
                                        _18708 = (((textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18668, 0.0) * (_11969.x * _11969.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18669, 0.0) * (_11973.x * _11969.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18671, 0.0) * (_11969.x * _11973.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18673, 0.0) * (_11973.x * _11973.y));
                                    }
                                    _18707 = _18708;
                                }
                                _18706 = _18707;
                            }
                            _18705 = _18706;
                        }
                        _18704 = _18705;
                    }
                    _11830 = _18737 + (_18704.xyz * (_11801 ? ((_18667 == 0) ? (1.0 - _11796) : _11796) : 1.0));
                }
                vec3 _17915 = _18641;
                _17915.x = _18737.x;
                vec2 _7890 = (_7830 + _7842) + (_7845 * _7872);
                float _12677 = clamp(log2(max(_7744, 1.0)) - 1.0, 0.0, 5.0);
                int _12680 = int(floor(_12677));
                float _12684 = _12677 - float(_12680);
                bool _12689 = (_12684 > 0.0199999995529651641845703125) && (_12680 < 5);
                vec3 _18861;
                _18861 = vec3(0.0);
                vec3 _12718;
                SPIRV_CROSS_LOOP
                for (int _18791 = 0; _18791 < 2; _18861 = _12718, _18791++)
                {
                    if ((_18791 > 0) && (!_12689))
                    {
                        break;
                    }
                    int _12704 = _12680 + _18791;
                    int _12742 = clamp(_12704, 1, 5);
                    vec2 _12811 = (_7890 * _188.gLevel[_12742].xy) - vec2(0.5);
                    vec2 _12813 = floor(_12811);
                    vec2 _12816 = _12811 - _12813;
                    vec2 _12819 = _12816 * _12816;
                    vec2 _12822 = _12819 * _12816;
                    vec2 _12841 = (((_12822 * 3.0) - (_12819 * 6.0)) + vec2(4.0)) * 0.16666667163372039794921875;
                    vec2 _12854 = _12822 * 0.16666667163372039794921875;
                    vec2 _12857 = (((((-_12822) + (_12819 * 3.0)) - (_12816 * 3.0)) + vec2(1.0)) * 0.16666667163372039794921875) + _12841;
                    vec2 _12861 = (((((_12822 * (-3.0)) + (_12819 * 3.0)) + (_12816 * 3.0)) + vec2(1.0)) * 0.16666667163372039794921875) + _12854;
                    vec2 _12873 = ((_12813 - vec2(0.5)) + (_12841 / _12857)) * _188.gLevel[_12742].zw;
                    vec2 _12885 = ((_12813 + vec2(1.5)) + (_12854 / _12861)) * _188.gLevel[_12742].zw;
                    vec4 _18828;
                    SPIRV_CROSS_BRANCH
                    if (_12704 <= 0)
                    {
                        vec2 _18827;
                        if (_188.gConv.x > 0.5)
                        {
                            vec2 _17918 = _7890;
                            _17918.y = 1.0 - _7890.y;
                            _18827 = _17918;
                        }
                        else
                        {
                            _18827 = _7890;
                        }
                        _18828 = textureLod(SPIRV_Cross_CombinedgBackdrop0gLinear, _18827, 0.0);
                    }
                    else
                    {
                        vec4 _18829;
                        if (_12704 == 1)
                        {
                            vec2 _18820;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17923 = _12873;
                                _17923.y = 1.0 - _12873.y;
                                _18820 = _17923;
                            }
                            else
                            {
                                _18820 = _12873;
                            }
                            float _12930 = _12873.y;
                            vec2 _12931 = vec2(_12885.x, _12930);
                            vec2 _18821;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17930 = _12931;
                                _17930.y = 1.0 - _12930;
                                _18821 = _17930;
                            }
                            else
                            {
                                _18821 = _12931;
                            }
                            float _12948 = _12885.y;
                            vec2 _12949 = vec2(_12873.x, _12948);
                            vec2 _18823;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17937 = _12949;
                                _17937.y = 1.0 - _12948;
                                _18823 = _17937;
                            }
                            else
                            {
                                _18823 = _12949;
                            }
                            vec2 _18825;
                            if (_188.gConv.x > 0.5)
                            {
                                vec2 _17944 = _12885;
                                _17944.y = 1.0 - _12885.y;
                                _18825 = _17944;
                            }
                            else
                            {
                                _18825 = _12885;
                            }
                            _18829 = (((textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18820, 0.0) * (_12857.x * _12857.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18821, 0.0) * (_12861.x * _12857.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18823, 0.0) * (_12857.x * _12861.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _18825, 0.0) * (_12861.x * _12861.y));
                        }
                        else
                        {
                            vec4 _18830;
                            if (_12704 == 2)
                            {
                                vec2 _18813;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17951 = _12873;
                                    _17951.y = 1.0 - _12873.y;
                                    _18813 = _17951;
                                }
                                else
                                {
                                    _18813 = _12873;
                                }
                                float _13060 = _12873.y;
                                vec2 _13061 = vec2(_12885.x, _13060);
                                vec2 _18814;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17958 = _13061;
                                    _17958.y = 1.0 - _13060;
                                    _18814 = _17958;
                                }
                                else
                                {
                                    _18814 = _13061;
                                }
                                float _13078 = _12885.y;
                                vec2 _13079 = vec2(_12873.x, _13078);
                                vec2 _18816;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17965 = _13079;
                                    _17965.y = 1.0 - _13078;
                                    _18816 = _17965;
                                }
                                else
                                {
                                    _18816 = _13079;
                                }
                                vec2 _18818;
                                if (_188.gConv.x > 0.5)
                                {
                                    vec2 _17972 = _12885;
                                    _17972.y = 1.0 - _12885.y;
                                    _18818 = _17972;
                                }
                                else
                                {
                                    _18818 = _12885;
                                }
                                _18830 = (((textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18813, 0.0) * (_12857.x * _12857.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18814, 0.0) * (_12861.x * _12857.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18816, 0.0) * (_12857.x * _12861.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _18818, 0.0) * (_12861.x * _12861.y));
                            }
                            else
                            {
                                vec4 _18831;
                                if (_12704 == 3)
                                {
                                    vec2 _18806;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17979 = _12873;
                                        _17979.y = 1.0 - _12873.y;
                                        _18806 = _17979;
                                    }
                                    else
                                    {
                                        _18806 = _12873;
                                    }
                                    float _13190 = _12873.y;
                                    vec2 _13191 = vec2(_12885.x, _13190);
                                    vec2 _18807;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17986 = _13191;
                                        _17986.y = 1.0 - _13190;
                                        _18807 = _17986;
                                    }
                                    else
                                    {
                                        _18807 = _13191;
                                    }
                                    float _13208 = _12885.y;
                                    vec2 _13209 = vec2(_12873.x, _13208);
                                    vec2 _18809;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _17993 = _13209;
                                        _17993.y = 1.0 - _13208;
                                        _18809 = _17993;
                                    }
                                    else
                                    {
                                        _18809 = _13209;
                                    }
                                    vec2 _18811;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        vec2 _18000 = _12885;
                                        _18000.y = 1.0 - _12885.y;
                                        _18811 = _18000;
                                    }
                                    else
                                    {
                                        _18811 = _12885;
                                    }
                                    _18831 = (((textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18806, 0.0) * (_12857.x * _12857.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18807, 0.0) * (_12861.x * _12857.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18809, 0.0) * (_12857.x * _12861.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _18811, 0.0) * (_12861.x * _12861.y));
                                }
                                else
                                {
                                    vec4 _18832;
                                    if (_12704 == 4)
                                    {
                                        vec2 _18799;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _18007 = _12873;
                                            _18007.y = 1.0 - _12873.y;
                                            _18799 = _18007;
                                        }
                                        else
                                        {
                                            _18799 = _12873;
                                        }
                                        float _13320 = _12873.y;
                                        vec2 _13321 = vec2(_12885.x, _13320);
                                        vec2 _18800;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _18014 = _13321;
                                            _18014.y = 1.0 - _13320;
                                            _18800 = _18014;
                                        }
                                        else
                                        {
                                            _18800 = _13321;
                                        }
                                        float _13338 = _12885.y;
                                        vec2 _13339 = vec2(_12873.x, _13338);
                                        vec2 _18802;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _18021 = _13339;
                                            _18021.y = 1.0 - _13338;
                                            _18802 = _18021;
                                        }
                                        else
                                        {
                                            _18802 = _13339;
                                        }
                                        vec2 _18804;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _18028 = _12885;
                                            _18028.y = 1.0 - _12885.y;
                                            _18804 = _18028;
                                        }
                                        else
                                        {
                                            _18804 = _12885;
                                        }
                                        _18832 = (((textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18799, 0.0) * (_12857.x * _12857.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18800, 0.0) * (_12861.x * _12857.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18802, 0.0) * (_12857.x * _12861.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _18804, 0.0) * (_12861.x * _12861.y));
                                    }
                                    else
                                    {
                                        vec2 _18792;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _18035 = _12873;
                                            _18035.y = 1.0 - _12873.y;
                                            _18792 = _18035;
                                        }
                                        else
                                        {
                                            _18792 = _12873;
                                        }
                                        float _13450 = _12873.y;
                                        vec2 _13451 = vec2(_12885.x, _13450);
                                        vec2 _18793;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _18042 = _13451;
                                            _18042.y = 1.0 - _13450;
                                            _18793 = _18042;
                                        }
                                        else
                                        {
                                            _18793 = _13451;
                                        }
                                        float _13468 = _12885.y;
                                        vec2 _13469 = vec2(_12873.x, _13468);
                                        vec2 _18795;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _18049 = _13469;
                                            _18049.y = 1.0 - _13468;
                                            _18795 = _18049;
                                        }
                                        else
                                        {
                                            _18795 = _13469;
                                        }
                                        vec2 _18797;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            vec2 _18056 = _12885;
                                            _18056.y = 1.0 - _12885.y;
                                            _18797 = _18056;
                                        }
                                        else
                                        {
                                            _18797 = _12885;
                                        }
                                        _18832 = (((textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18792, 0.0) * (_12857.x * _12857.y)) + (textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18793, 0.0) * (_12861.x * _12857.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18795, 0.0) * (_12857.x * _12861.y))) + (textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _18797, 0.0) * (_12861.x * _12861.y));
                                    }
                                    _18831 = _18832;
                                }
                                _18830 = _18831;
                            }
                            _18829 = _18830;
                        }
                        _18828 = _18829;
                    }
                    _12718 = _18861 + (_18828.xyz * (_12689 ? ((_18791 == 0) ? (1.0 - _12684) : _12684) : 1.0));
                }
                _17915.z = _18861.z;
                _19031 = _17915;
            }
            else
            {
                _19031 = _18641;
            }
            vec3 _19251;
            SPIRV_CROSS_BRANCH
            if (_7772 > 0.0)
            {
                vec2 _7913 = _7830 + (((_18569 * min(_7763 * 0.5, 16.0)) * _188.gDisplay.zw) * _188.gTarget.zw);
                float _13565 = clamp(log2(max(16.0 * _188.gDisplay.z, 1.0)) - 1.0, 0.0, 5.0);
                int _13568 = int(floor(_13565));
                float _13572 = _13565 - float(_13568);
                bool _13577 = (_13572 > 0.0199999995529651641845703125) && (_13568 < 5);
                vec3 _19016;
                _19016 = vec3(0.0);
                vec3 _13606;
                SPIRV_CROSS_LOOP
                for (int _19001 = 0; _19001 < 2; _19016 = _13606, _19001++)
                {
                    if ((_19001 > 0) && (!_13577))
                    {
                        break;
                    }
                    int _13592 = _13568 + _19001;
                    vec2 _19002;
                    if (_188.gConv.x > 0.5)
                    {
                        vec2 _18063 = _7913;
                        _18063.y = 1.0 - _7913.y;
                        _19002 = _18063;
                    }
                    else
                    {
                        _19002 = _7913;
                    }
                    vec4 _19003;
                    SPIRV_CROSS_BRANCH
                    if (_13592 <= 0)
                    {
                        _19003 = textureLod(SPIRV_Cross_CombinedgBackdrop0gLinear, _19002, 0.0);
                    }
                    else
                    {
                        vec4 _19004;
                        if (_13592 == 1)
                        {
                            _19004 = textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _19002, 0.0);
                        }
                        else
                        {
                            vec4 _19005;
                            if (_13592 == 2)
                            {
                                _19005 = textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _19002, 0.0);
                            }
                            else
                            {
                                vec4 _19006;
                                if (_13592 == 3)
                                {
                                    _19006 = textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _19002, 0.0);
                                }
                                else
                                {
                                    vec4 _19007;
                                    if (_13592 == 4)
                                    {
                                        _19007 = textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _19002, 0.0);
                                    }
                                    else
                                    {
                                        _19007 = textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _19002, 0.0);
                                    }
                                    _19006 = _19007;
                                }
                                _19005 = _19006;
                            }
                            _19004 = _19005;
                        }
                        _19003 = _19004;
                    }
                    _13606 = _19016 + (_19003.xyz * (_13577 ? ((_19001 == 0) ? (1.0 - _13572) : _13572) : 1.0));
                }
                _19251 = _19016;
            }
            else
            {
                _19251 = vec3(0.5);
            }
            float _19047;
            SPIRV_CROSS_BRANCH
            if (esia_v5.x > 0.001000000047497451305389404296875)
            {
                int _13695 = clamp(int(roundEven(log2(36.0 * _188.gDisplay.z) - 1.0)), 1, 4);
                vec2 _19022;
                if (_188.gConv.x > 0.5)
                {
                    vec2 _18067 = _7830;
                    _18067.y = 1.0 - _7830.y;
                    _19022 = _18067;
                }
                else
                {
                    _19022 = _7830;
                }
                vec4 _19023;
                SPIRV_CROSS_BRANCH
                if (_13695 <= 0)
                {
                    _19023 = textureLod(SPIRV_Cross_CombinedgBackdrop0gLinear, _19022, 0.0);
                }
                else
                {
                    vec4 _19024;
                    if (_13695 == 1)
                    {
                        _19024 = textureLod(SPIRV_Cross_CombinedgBackdrop1gLinear, _19022, 0.0);
                    }
                    else
                    {
                        vec4 _19025;
                        if (_13695 == 2)
                        {
                            _19025 = textureLod(SPIRV_Cross_CombinedgBackdrop2gLinear, _19022, 0.0);
                        }
                        else
                        {
                            vec4 _19026;
                            if (_13695 == 3)
                            {
                                _19026 = textureLod(SPIRV_Cross_CombinedgBackdrop3gLinear, _19022, 0.0);
                            }
                            else
                            {
                                vec4 _19027;
                                if (_13695 == 4)
                                {
                                    _19027 = textureLod(SPIRV_Cross_CombinedgBackdrop4gLinear, _19022, 0.0);
                                }
                                else
                                {
                                    _19027 = textureLod(SPIRV_Cross_CombinedgBackdrop5gLinear, _19022, 0.0);
                                }
                                _19026 = _19027;
                            }
                            _19025 = _19026;
                        }
                        _19024 = _19025;
                    }
                    _19023 = _19024;
                }
                _19047 = dot(_19023.xyz, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            }
            else
            {
                _19047 = 0.5;
            }
            _19249 = _19251;
            _19046 = _19047;
            _19028 = _19031;
        }
        else
        {
            _19249 = vec3(0.5);
            _19046 = 0.5;
            _19028 = vec3(0.5);
        }
        vec3 _7941 = mix(vec3(dot(_19028, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))), _19028, vec3(_7633.x)) + vec3(_7633.y);
        vec3 _19142;
        SPIRV_CROSS_BRANCH
        if (esia_v5.x > 0.001000000047497451305389404296875)
        {
            float _7951 = clamp(max(_19046 + _7633.y, 0.001000000047497451305389404296875), 0.0, 1.0);
            float _7959 = mix(_7951, dot(_7592.xyz, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), esia_v5.x);
            vec3 _7967 = _7941 * (_7959 / _7951);
            vec3 _7977 = mix(_7941, vec3(1.0), vec3((_7959 - _7951) / max(1.0 - _7951, 0.001000000047497451305389404296875)));
            bvec3 _7978 = bvec3(_7959 < _7951);
            _19142 = vec3(_7978.x ? _7967.x : _7977.x, _7978.y ? _7967.y : _7977.y, _7978.z ? _7967.z : _7977.z);
        }
        else
        {
            _19142 = _7941;
        }
        vec2 _7997 = clamp((esia_v0 - esia_v2.xy) / max(esia_v2.zw - esia_v2.xy, vec2(0.001000000047497451305389404296875)), vec2(0.0), vec2(1.0));
        vec2 _8045 = vec2(cos(_7633.w), sin(_7633.w));
        float _8048 = dot(_18569, _8045);
        float _8059 = -_18340;
        float _8066 = _4284 * ((0.5 * abs(_18569.x)) + 0.0199999995529651641845703125);
        float _8073 = _4284 * ((0.5 * abs(_18569.y)) + 0.0199999995529651641845703125);
        float _19361;
        SPIRV_CROSS_BRANCH
        if ((((_8059 + _8066) + _8073) > 0.0) && (((_8059 - _8066) - _8073) < (0.5 * _7763)))
        {
            float _13799 = max((_8059 + _8066) + _8073, 0.0) / _7763;
            float _13803 = clamp(sqrt(2.0 * _13799), 0.12399999797344207763671875, 1.0);
            float _13805 = 1.0 - _13803;
            float _13808 = _13805 * _13805;
            float _13862 = max((_8059 + _8066) - _8073, 0.0) / _7763;
            float _13866 = clamp(sqrt(2.0 * _13862), 0.12399999797344207763671875, 1.0);
            float _13868 = 1.0 - _13866;
            float _13871 = _13868 * _13868;
            float _13925 = max((_8059 - _8066) + _8073, 0.0) / _7763;
            float _13929 = clamp(sqrt(2.0 * _13925), 0.12399999797344207763671875, 1.0);
            float _13931 = 1.0 - _13929;
            float _13934 = _13931 * _13931;
            float _13988 = max((_8059 - _8066) - _8073, 0.0) / _7763;
            float _13992 = clamp(sqrt(2.0 * _13988), 0.12399999797344207763671875, 1.0);
            float _13994 = 1.0 - _13992;
            float _13997 = _13994 * _13994;
            float _8120 = ((((((_13799 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _13799) * _13799) : ((_13799 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _13803) * _13803)) + ((((_13808 * _13808) * _13808) * _13805) * (0.02380952425301074981689453125 + (_13805 * ((-0.0386904776096343994140625) + (_13805 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_13799 - 0.5))))) * _7763) * _7763) - ((((_13862 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _13862) * _13862) : ((_13862 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _13866) * _13866)) + ((((_13871 * _13871) * _13871) * _13868) * (0.02380952425301074981689453125 + (_13868 * ((-0.0386904776096343994140625) + (_13868 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_13862 - 0.5))))) * _7763) * _7763)) - ((((_13925 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _13925) * _13925) : ((_13925 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _13929) * _13929)) + ((((_13934 * _13934) * _13934) * _13931) * (0.02380952425301074981689453125 + (_13931 * ((-0.0386904776096343994140625) + (_13931 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_13925 - 0.5))))) * _7763) * _7763)) + ((((_13988 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _13988) * _13988) : ((_13988 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _13992) * _13992)) + ((((_13997 * _13997) * _13997) * _13994) * (0.02380952425301074981689453125 + (_13994 * ((-0.0386904776096343994140625) + (_13994 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_13988 - 0.5))))) * _7763) * _7763);
            _19361 = _8120 / ((4.0 * _8066) * _8073);
        }
        else
        {
            _19361 = 0.0;
        }
        float _8152 = clamp(0.5 + (0.5 * dot((esia_v0 - ((esia_v2.xy + esia_v2.zw) * 0.5)) / _7755, _8045)), 0.0, 1.0);
        _20465 = ((_19361 * (pow(clamp(_8048, 0.0, 1.0), 1.5) + (0.4000000059604644775390625 * pow(clamp(-_8048, 0.0, 1.0), 1.5)))) * _7633.z) * 1.60000002384185791015625;
        _20071 = _7674;
        _19897 = vec4((mix(mix(_19142, _7592.xyz, vec3(clamp(_7592.w * ((0.7200000286102294921875 + (0.550000011920928955078125 * (1.0 - _7778))) + (0.3499999940395355224609375 * ((dot(_7592.xyz, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) > 0.5) ? (1.0 - _7997.y) : _7997.y))), 0.0, 1.0))), (_19249 * 1.10000002384185791015625) + vec3(0.07999999821186065673828125), vec3(pow(1.0 - _19146.z, 5.0) * 0.3499999940395355224609375)) + vec3((((0.039999999105930328369140625 * _8152) * _8152) + (0.0500000007450580596923828125 * (1.0 - _7778))) * _7633.z)) * _4322, _4322) + (_19368 * (1.0 - _4322));
    }
    else
    {
        _20465 = 0.0;
        _20071 = _18319;
        _19897 = _19368;
    }
    vec4 _19907;
    vec4 _19909;
    SPIRV_CROSS_BRANCH
    if ((esia_v7.x & _3057) != 0u)
    {
        vec4 _19514;
        vec4 _19699;
        SPIRV_CROSS_BRANCH
        if (esia_v7.y != 0u)
        {
            uint _14054 = max(uint(_188.gConv.z), 1u);
            uint _14095 = max(uint(_188.gConv.z), 1u);
            _19699 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _14054) * 24u) + 3u), int(esia_v1 / _14054), 0).xy, 0);
            _19514 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _14095) * 24u) + 4u), int(esia_v1 / _14095), 0).xy, 0);
        }
        else
        {
            _19699 = vec4(0.0);
            _19514 = vec4(0.0);
        }
        vec4 _19892;
        do
        {
            if (esia_v7.y == 0u)
            {
                _19892 = esia_v4;
                break;
            }
            vec2 _14167 = max(esia_v2.zw - esia_v2.xy, vec2(0.001000000047497451305389404296875));
            vec2 _14177 = fwidth(esia_v0);
            float _14179 = max(length(_14177), 9.9999997473787516355514526367188e-05);
            float _19884;
            float _19888;
            if ((esia_v7.y == 1u) || (esia_v7.y == 4u))
            {
                float _14188 = cos(_19514.x);
                float _14191 = sin(_19514.x);
                float _14217 = ((dot(esia_v0 - ((esia_v2.xy + esia_v2.zw) * 0.5), vec2(_14188, _14191)) / max(0.5 * ((abs(_14188) * _14167.x) + (abs(_14191) * _14167.y)), 0.001000000047497451305389404296875)) * 0.5) + 0.5;
                if (esia_v7.y == 4u)
                {
                    float _14232 = clamp((_14217 - _19514.y) / max(_19514.z - _19514.y, 0.001000000047497451305389404296875), 0.0, 1.0);
                    _19892 = vec4(clamp(abs((fract(vec3(_14232 * 0.800000011920928955078125) + vec3(1.0, 0.66670000553131103515625, 0.33329999446868896484375)) * 6.0) - vec3(3.0)) - vec3(1.0), vec3(0.0), vec3(1.0)), esia_v4.w * pow(max(sin(_14232 * 3.1415927410125732421875), 0.0), 0.60000002384185791015625));
                    break;
                }
                _19888 = -1.0;
                _19884 = _14217;
            }
            else
            {
                float _19885;
                float _19889;
                if (esia_v7.y == 2u)
                {
                    _19889 = -1.0;
                    _19885 = length(esia_v0 - (esia_v2.xy + (_19514.xy * _14167))) / max(_19514.z * max(_14167.x, _14167.y), 0.001000000047497451305389404296875);
                }
                else
                {
                    vec2 _14300 = esia_v0 - (esia_v2.xy + (_19514.xy * _14167));
                    float _14311 = fract(((atan(_14300.y, _14300.x) - _19514.z) * 0.15915493667125701904296875) + 1.0);
                    float _19886;
                    float _19890;
                    if (_19514.w > 0.5)
                    {
                        _19890 = -1.0;
                        _19886 = 0.5 - (0.5 * cos(_14311 * 6.283185482025146484375));
                    }
                    else
                    {
                        float _14331 = (((_14311 < 0.5) ? _14311 : (_14311 - 1.0)) * 6.283185482025146484375) * length(_14300);
                        float _19891;
                        if (abs(_14331) < _14179)
                        {
                            _19891 = clamp(((_14331 / _14179) * 0.5) + 0.5, 0.0, 1.0);
                        }
                        else
                        {
                            _19891 = -1.0;
                        }
                        _19890 = _19891;
                        _19886 = _14311;
                    }
                    _19889 = _19890;
                    _19885 = _19886;
                }
                _19888 = _19889;
                _19884 = _19885;
            }
            vec4 _14360 = vec4(esia_v4.xyz * esia_v4.w, esia_v4.w);
            vec4 _14372 = vec4(_19699.xyz * _19699.w, _19699.w);
            vec4 _14379 = mix(_14372, _14360, vec4(_19888));
            vec4 _14384 = mix(_14360, _14372, vec4(clamp(_19884, 0.0, 1.0)));
            bvec4 _14385 = bvec4(_19888 >= 0.0);
            vec4 _14386 = vec4(_14385.x ? _14379.x : _14384.x, _14385.y ? _14379.y : _14384.y, _14385.z ? _14379.z : _14384.z, _14385.w ? _14379.w : _14384.w);
            vec4 _14401 = vec4(_14386.xyz / vec3(_14386.w), _14386.w);
            bvec4 _14402 = bvec4(_14386.w > 9.9999997473787516355514526367188e-06);
            _19892 = vec4(_14402.x ? _14401.x : vec4(0.0).x, _14402.y ? _14401.y : vec4(0.0).y, _14402.z ? _14401.z : vec4(0.0).z, _14402.w ? _14401.w : vec4(0.0).w);
            break;
        } while(false);
        vec4 _19893;
        vec4 _20061;
        SPIRV_CROSS_BRANCH
        if ((esia_v7.x & _3086) != 0u)
        {
            uint _14412 = max(uint(_188.gConv.z), 1u);
            vec4 _14446 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _14412) * 24u) + 18u), int(esia_v1 / _14412), 0).xy, 0);
            _20061 = _14446;
            _19893 = _19892 * texture(SPIRV_Cross_CombinedgTexgLinear, mix(_14446.xy, _14446.zw, (esia_v0 - esia_v2.xy) / max(esia_v2.zw - esia_v2.xy, vec2(0.001000000047497451305389404296875))));
        }
        else
        {
            _20061 = _18315;
            _19893 = _19892;
        }
        float _14454 = clamp(_19893.w * _4322, 0.0, 1.0);
        _19909 = _20061;
        _19907 = vec4(_19893.xyz * _14454, _14454) + (_19897 * (1.0 - _14454));
    }
    else
    {
        _19909 = _18315;
        _19907 = _19897;
    }
    vec4 _20449;
    SPIRV_CROSS_BRANCH
    if ((esia_v7.x & _3139) != 0u)
    {
        uint _14479 = max(uint(_188.gConv.z), 1u);
        vec4 _14513 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _14479) * 24u) + 21u), int(esia_v1 / _14479), 0).xy, 0);
        uint _14520 = max(uint(_188.gConv.z), 1u);
        vec4 _14554 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _14520) * 24u) + 3u), int(esia_v1 / _14520), 0).xy, 0);
        vec2 _4762 = max(esia_v2.zw - esia_v2.xy, vec2(0.001000000047497451305389404296875));
        vec2 _4769 = (esia_v0 - esia_v2.xy) / _4762;
        float _4780 = ((_14554.x >= 0.0) ? _14554.x : _188.gTime.x) * _14513.z;
        float _4783 = _4769.x * 2.0;
        float _4784 = _4783 - 1.0;
        float _4789 = _4769.y * _4762.y;
        float _4792 = max(_14513.w, 0.001000000047497451305389404296875);
        float _4797 = clamp(1.0 - (_4784 * _4784), 0.0, 1.0);
        float _4799 = pow(_4797, 1.2999999523162841796875);
        float _4801 = pow(_4797, 0.699999988079071044921875);
        float _4804 = clamp(_4780 * 1.4285714626312255859375, 0.0, 1.0);
        float _4820 = (0.25 + (0.75 * ((_4804 * _4804) * (3.0 - (2.0 * _4804))))) * (0.85000002384185791015625 + (0.1500000059604644775390625 * sin(_4780 * 2.099999904632568359375)));
        float _4829 = ((_14513.y * _4762.y) * _4820) * _4799;
        float _4855 = (_4762.y * (0.5 + ((_14513.x * (0.5 - (_4784 * _4784))) * 0.5))) + (((0.14000000059604644775390625 * _4762.y) * _4799) * sin(((_4784 * 2.400000095367431640625) - (_4780 * 1.2000000476837158203125)) + 0.60000002384185791015625));
        float _19903;
        float _19904;
        vec3 _19905;
        _19905 = vec3(0.0);
        _19904 = _4855;
        _19903 = _4855;
        vec3 _4927;
        float _20723;
        float _20724;
        SPIRV_CROSS_UNROLL
        for (int _19902 = 0; _19902 < 4; _19905 = _4927, _19904 = _20724, _19903 = _20723, _19902++)
        {
            float _4879 = _4855 + ((_4829 * _3303[_19902].x) * (0.800000011920928955078125 + (0.20000000298023223876953125 * sin((_4780 * 1.7000000476837158203125) + _3320[_19902].y))));
            _20723 = (_19902 == 0) ? _4879 : _19903;
            _20724 = (_19902 == 2) ? _4879 : _19904;
            float _4894 = _4792 * _3303[_19902].y;
            float _4899 = (_4789 - _4879) / _4894;
            float _4904 = _4792 * _3303[_19902].z;
            vec3 _20694;
            _20694 = vec3(0.0);
            SPIRV_CROSS_UNROLL
            for (int _20693 = 0; _20693 < 6; )
            {
                float _14577 = ((_4789 - _4879) - (_4904 * ((float(_20693) * 0.4000000059604644775390625) - 1.0))) / _4894;
                _20694 += (_1912[_20693] * exp((-_14577) * _14577));
                _20693++;
                continue;
            }
            _4927 = _19905 + (mix(_20694 * vec3(0.237529695034027099609375, 0.24630542099475860595703125, 0.27624309062957763671875), vec3(exp((-_4899) * _4899)), vec3(_3320[_19902].x)) * (_3303[_19902].w * _4801));
        }
        float _4933 = _4792 * 1.5;
        float _4963 = clamp((_4789 - _19903) / max(_19904 - _19903, 0.001000000047497451305389404296875), 0.0, 1.0);
        float _4991 = (_4789 - (_19904 - (_4792 * 3.0))) / (((_4762.y * 0.0900000035762786865234375) + (_4829 * 0.20000000298023223876953125)) + 0.001000000047497451305389404296875);
        float _4994 = (_4783 - 1.0499999523162841796875) * 2.77777767181396484375;
        float _5019 = ((_4789 - _19903) + (_4792 * 5.0)) / (_4792 * 7.0);
        vec3 _5045 = vec3(1.0) - exp((-((((_19905 + (mix(vec3(0.7799999713897705078125, 0.800000011920928955078125, 1.0), vec3(1.0), vec3(_4963)) * ((((1.0 / (1.0 + exp((-((_4789 - _19903) - (_4792 * 2.0))) / _4933))) / (1.0 + exp((-(_19904 - _4789)) / _4933))) * (0.0599999986588954925537109375 + (0.3499999940395355224609375 * pow(_4963, 2.5)))) * _4801))) + (vec3(1.0, 0.980000019073486328125, 0.949999988079071044921875) * (exp(((-_4991) * _4991) - (_4994 * _4994)) * (0.5 + (1.10000002384185791015625 * _4820))))) + (vec3(1.0, 0.680000007152557373046875, 0.4199999868869781494140625) * ((exp((-_5019) * _5019) * _4799) * 0.100000001490116119384765625))) * mix(vec3(1.0, 0.9700000286102294921875, 0.939999997615814208984375), vec3(0.939999997615814208984375, 0.9700000286102294921875, 1.0), vec3(0.5 + (0.5 * sin(_4780 * 0.800000011920928955078125)))))) * 1.39999997615814208984375);
        float _5055 = (esia_v4.w * smoothstep(0.0, 0.119999997317790985107421875, _4769.y)) * smoothstep(1.0, 0.87999999523162841796875, _4769.y);
        float _5074 = (clamp(max(_5045.x, max(_5045.y, _5045.z)), 0.0, 1.0) * _5055) * _4322;
        _20449 = vec4((_5045 * _5055) * _4322, _5074) + (_19907 * (1.0 - _5074));
    }
    else
    {
        _20449 = _19907;
    }
    vec4 _20460;
    SPIRV_CROSS_BRANCH
    if (((esia_v7.x & _3572) != 0u) && ((esia_v7.x & _3576) != 0u))
    {
        uint _14610 = max(uint(_188.gConv.z), 1u);
        vec4 _14644 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _14610) * 24u) + 7u), int(esia_v1 / _14610), 0).xy, 0);
        uint _14651 = max(uint(_188.gConv.z), 1u);
        vec4 _14685 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _14651) * 24u) + 8u), int(esia_v1 / _14651), 0).xy, 0);
        vec2 _5108 = esia_v0 - _14685.zw;
        vec2 _14726 = (esia_v2.xy + esia_v2.zw) * 0.5;
        vec2 _14735 = max((esia_v2.zw - esia_v2.xy) * 0.5, vec2(0.001000000047497451305389404296875));
        float _20422;
        SPIRV_CROSS_BRANCH
        if ((esia_v7.x & _1379) != 0u)
        {
            float _14841 = 1.0 / max(esia_v5.z, 9.9999999747524270787835121154785e-07);
            vec4 _14875 = textureLod(SPIRV_Cross_CombinedgTexgLinear, mix(_19909.xy, _19909.zw, (clamp(_5108, _18321.xy, _18321.zw) - _18321.xy) / max(_18321.zw - _18321.xy, vec2(9.9999999747524270787835121154785e-07))), 0.0);
            float _14899 = (_14875.w - 0.5) * esia_v3.y;
            vec2 _14940 = abs(_5108 - ((_18321.xy + _18321.zw) * 0.5)) - max(((_18321.zw - _18321.xy) * 0.5) - vec2(((0.5 * esia_v3.y) + 1.0) * _14841), vec2(0.0));
            _20422 = max((-mix((max(min(_14875.x, _14875.y), min(max(_14875.x, _14875.y), _14875.z)) - 0.5) * esia_v3.x, _14899, clamp(abs(_14899) - ((0.5 * esia_v3.x) - 1.5), 0.0, 1.0))) * _14841, length(max(_14940, vec2(0.0))) + min(max(_14940.x, _14940.y), 0.0)) - esia_v5.w;
        }
        else
        {
            float _20423;
            if (esia_v7.z == 1u)
            {
                vec2 _14750 = _5108 - _14726;
                float _20421;
                do
                {
                    if (esia_v5.w >= 6.282185077667236328125)
                    {
                        _20421 = abs(length(_14750) - esia_v3.x) - esia_v3.y;
                        break;
                    }
                    float _14984 = esia_v5.z + (esia_v5.w * 0.5);
                    float _14986 = cos(_14984);
                    float _14988 = sin(_14984);
                    float _14997 = dot(_14750, vec2(-_14988, _14986));
                    float _15000 = dot(_14750, vec2(_14986, _14988));
                    vec2 _15001 = vec2(_14997, _15000);
                    float _15004 = abs(_14997);
                    _15001.x = _15004;
                    float _15007 = esia_v5.w * 0.5;
                    float _15009 = sin(_15007);
                    float _15011 = cos(_15007);
                    _20421 = (((_15011 * _15004) > (_15009 * _15000)) ? length(_15001 - (vec2(_15009, _15011) * esia_v3.x)) : abs(length(_15001) - esia_v3.x)) - esia_v3.y;
                    break;
                } while(false);
                _20423 = _20421;
            }
            else
            {
                float _20424;
                if (esia_v7.z == 2u)
                {
                    vec2 _15047 = _5108 - _18321.xy;
                    vec2 _15050 = _18321.zw - _18321.xy;
                    _20424 = length(_15047 - (_15050 * clamp(dot(_15047, _15050) / max(dot(_15050, _15050), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - esia_v3.x;
                }
                else
                {
                    vec2 _14777 = _5108 - _14726;
                    float _15103 = min(_14735.x, _14735.y);
                    float _15106 = min((_14777.x > 0.0) ? ((_14777.y > 0.0) ? esia_v3.z : esia_v3.y) : ((_14777.y > 0.0) ? esia_v3.w : esia_v3.x), _15103);
                    float _15112 = _15106 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                    float _20406;
                    float _20407;
                    if (_15112 > _15103)
                    {
                        float _15126 = esia_v5.y * clamp((_15103 - _15106) / max(0.60000002384185791015625 * _15106, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _20407 = _15126;
                        _20406 = _15106 * (1.0 + (0.60000002384185791015625 * _15126));
                    }
                    else
                    {
                        _20407 = esia_v5.y;
                        _20406 = _15112;
                    }
                    vec2 _15139 = (abs(_14777) - _14735) + vec2(_20406);
                    vec2 _15141 = max(_15139, vec2(0.0));
                    float _20408;
                    SPIRV_CROSS_BRANCH
                    if ((_15141.x > 0.0) && (_15141.y > 0.0))
                    {
                        float _20409;
                        if ((_20407 > 0.001000000047497451305389404296875) && (_20406 > 9.9999997473787516355514526367188e-05))
                        {
                            float _15158 = 2.0 + (2.0 * _20407);
                            vec2 _15163 = _15141 / vec2(max(_20406, 9.9999997473787516355514526367188e-05));
                            _20409 = pow(pow(_15163.x, _15158) + pow(_15163.y, _15158), 1.0 / _15158) * _20406;
                        }
                        else
                        {
                            _20409 = length(_15141);
                        }
                        _20408 = _20409;
                    }
                    else
                    {
                        _20408 = max(_15141.x, _15141.y);
                    }
                    float _15198 = (min(max(_15139.x, _15139.y), 0.0) + _20408) - _20406;
                    float _20425;
                    SPIRV_CROSS_BRANCH
                    if ((esia_v7.x & _1448) != 0u)
                    {
                        vec2 _14805 = max((_18321.zw - _18321.xy) * 0.5, vec2(0.001000000047497451305389404296875));
                        vec2 _14808 = _5108 - ((_18321.xy + _18321.zw) * 0.5);
                        float _15234 = min(_14805.x, _14805.y);
                        float _15237 = min((_14808.x > 0.0) ? ((_14808.y > 0.0) ? _20071.x : _20071.x) : ((_14808.y > 0.0) ? _20071.x : _20071.x), _15234);
                        float _15243 = _15237 * (1.0 + (0.60000002384185791015625 * esia_v5.y));
                        float _20412;
                        float _20413;
                        if (_15243 > _15234)
                        {
                            float _15257 = esia_v5.y * clamp((_15234 - _15237) / max(0.60000002384185791015625 * _15237, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _20413 = _15257;
                            _20412 = _15237 * (1.0 + (0.60000002384185791015625 * _15257));
                        }
                        else
                        {
                            _20413 = esia_v5.y;
                            _20412 = _15243;
                        }
                        vec2 _15270 = (abs(_14808) - _14805) + vec2(_20412);
                        vec2 _15272 = max(_15270, vec2(0.0));
                        float _20414;
                        SPIRV_CROSS_BRANCH
                        if ((_15272.x > 0.0) && (_15272.y > 0.0))
                        {
                            float _20415;
                            if ((_20413 > 0.001000000047497451305389404296875) && (_20412 > 9.9999997473787516355514526367188e-05))
                            {
                                float _15289 = 2.0 + (2.0 * _20413);
                                vec2 _15294 = _15272 / vec2(max(_20412, 9.9999997473787516355514526367188e-05));
                                _20415 = pow(pow(_15294.x, _15289) + pow(_15294.y, _15289), 1.0 / _15289) * _20412;
                            }
                            else
                            {
                                _20415 = length(_15272);
                            }
                            _20414 = _20415;
                        }
                        else
                        {
                            _20414 = max(_15272.x, _15272.y);
                        }
                        float _15329 = (min(max(_15270.x, _15270.y), 0.0) + _20414) - _20412;
                        float _15334 = max(_20071.y, 9.9999997473787516355514526367188e-05);
                        float _15343 = max(_15334 - abs(_15198 - _15329), 0.0) / _15334;
                        _20425 = min(_15198, _15329) - (((_15343 * _15343) * _15334) * 0.25);
                    }
                    else
                    {
                        _20425 = _15198;
                    }
                    _20424 = _20425;
                }
                _20423 = _20424;
            }
            _20422 = _20423;
        }
        float _5117 = (_20422 + _14685.y) / (max(_14685.x * 0.5, _4284 * 0.5) * 1.41421353816986083984375);
        float _15360 = sign(_5117);
        float _15362 = abs(_5117);
        float _15373 = 1.0 + ((0.2783930003643035888671875 + ((0.23038899898529052734375 + (0.07810799777507781982421875 * (_15362 * _15362))) * _15362)) * _15362);
        float _15376 = _15373 * _15373;
        float _15391 = clamp(_14644.w * ((0.5 + (0.5 * (_15360 - (_15360 / (_15376 * _15376))))) * _4322), 0.0, 1.0);
        _20460 = vec4(_14644.xyz * _15391, _15391) + (_20449 * (1.0 - _15391));
    }
    else
    {
        _20460 = _20449;
    }
    vec4 _20485;
    SPIRV_CROSS_BRANCH
    if ((esia_v7.x & _3636) != 0u)
    {
        uint _15416 = max(uint(_188.gConv.z), 1u);
        vec4 _15450 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _15416) * 24u) + 9u), int(esia_v1 / _15416), 0).xy, 0);
        uint _15457 = max(uint(_188.gConv.z), 1u);
        vec4 _15491 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _15457) * 24u) + 10u), int(esia_v1 / _15457), 0).xy, 0);
        float _5149 = max(-_18340, 0.0) / max(_15491.z, 0.001000000047497451305389404296875);
        float _15499 = clamp(_15450.w * clamp((exp(((-_5149) * _5149) * 2.2000000476837158203125) * _15491.w) * _4322, 0.0, 1.0), 0.0, 1.0);
        _20485 = vec4(_15450.xyz * _15499, _15499) + (_20460 * (1.0 - _15499));
    }
    else
    {
        _20485 = _20460;
    }
    vec3 _5180 = _20485.xyz + vec3(_20465 * clamp(_20485.w / max(_4322, 0.001000000047497451305389404296875), 0.0, 1.0));
    vec4 _18210 = _20485;
    _18210.x = _5180.x;
    _18210.y = _5180.y;
    _18210.z = _5180.z;
    vec4 _20488;
    SPIRV_CROSS_BRANCH
    if ((esia_v7.x & _3705) != 0u)
    {
        uint _15524 = max(uint(_188.gConv.z), 1u);
        vec4 _15558 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _15524) * 24u) + 5u), int(esia_v1 / _15524), 0).xy, 0);
        uint _15565 = max(uint(_188.gConv.z), 1u);
        vec4 _15599 = texelFetch(SPIRV_Cross_CombinedgFxDataSPIRV_Cross_DummySampler, ivec3(int(((esia_v1 % _15565) * 24u) + 6u), int(esia_v1 / _15565), 0).xy, 0);
        float _5200 = _15599.x;
        float _5202 = _15599.y;
        vec4 _20486;
        if (_15599.z < 0.999000012874603271484375)
        {
            vec2 _5238 = max(esia_v2.zw - esia_v2.xy, vec2(0.001000000047497451305389404296875));
            float _5249 = cos(_15599.w);
            float _5252 = sin(_15599.w);
            vec4 _18227 = _15558;
            _18227.w = _15558.w * mix(1.0, _15599.z, clamp(((dot(esia_v0 - ((esia_v2.xy + esia_v2.zw) * 0.5), vec2(_5249, _5252)) / max(0.5 * ((abs(_5249) * _5238.x) + (abs(_5252) * _5238.y)), 0.001000000047497451305389404296875)) * 0.5) + 0.5, 0.0, 1.0));
            _20486 = _18227;
        }
        else
        {
            _20486 = _15558;
        }
        float _15607 = clamp(_20486.w * (clamp(0.5 - ((_18340 - (_5200 * _5202)) / _4284), 0.0, 1.0) - clamp(0.5 - ((_18340 + (_5200 * (1.0 - _5202))) / _4284), 0.0, 1.0)), 0.0, 1.0);
        _20488 = vec4(_20486.xyz * _15607, _15607) + (_18210 * (1.0 - _15607));
    }
    else
    {
        _20488 = _18210;
    }
    vec4 _20489;
    SPIRV_CROSS_BRANCH
    if ((esia_v7.x & _3835) != 0u)
    {
        vec2 _5313 = (esia_v0 - esia_v2.xy) / max(esia_v2.zw - esia_v2.xy, vec2(0.001000000047497451305389404296875));
        float _5335 = exp(-pow((((_5313.x * 0.85000002384185791015625) + (_5313.y * 0.1500000059604644775390625)) - ((fract(_188.gTime.x * esia_v6.w) * 1.7999999523162841796875) - 0.4000000059604644775390625)) * 9.09090900421142578125, 2.0));
        _20489 = vec4(_20488.xyz + vec3(((_5335 * esia_v6.z) * _4322) * max(_20488.w, 0.3499999940395355224609375)), max(_20488.w, ((_5335 * esia_v6.z) * _4322) * 0.5));
    }
    else
    {
        _20489 = _20488;
    }
    vec4 _20688;
    SPIRV_CROSS_BRANCH
    if ((esia_v7.x & _3917) != 0u)
    {
        vec3 _15632 = fract(floor(_18314).xyx * 0.103100001811981201171875);
        vec3 _15641 = _15632 + vec3(dot(_15632, _15632.yzx + vec3(33.3300018310546875)));
        vec3 _5386 = _20489.xyz + vec3(((fract((_15641.x + _15641.y) * _15641.z) - 0.5) * esia_v6.y) * _20489.w);
        vec4 _18251 = _20489;
        _18251.x = _5386.x;
        _18251.y = _5386.y;
        _18251.z = _5386.z;
        _20688 = _18251;
    }
    else
    {
        _20688 = _20489;
    }
    float _20684;
    if (_231.gFade.z > 0.0)
    {
        _20684 = smoothstep(0.0, 1.0, clamp((_18314.y - _231.gFade.x) / _231.gFade.z, 0.0, 1.0));
    }
    else
    {
        _20684 = 1.0;
    }
    float _20685;
    if (_231.gFade.w > 0.0)
    {
        _20685 = _20684 * smoothstep(0.0, 1.0, clamp((_231.gFade.y - _18314.y) / _231.gFade.w, 0.0, 1.0));
    }
    else
    {
        _20685 = _20684;
    }
    vec4 _5403 = _20688 * ((esia_v6.x * _20500) * _20685);
    vec4 _20689;
    SPIRV_CROSS_BRANCH
    if (((esia_v7.x & _3957) != 0u) || ((esia_v7.x & _3961) != 0u))
    {
        vec3 _15693 = fract((floor(_18314) + vec2(17.0)).xyx * 0.103100001811981201171875);
        vec3 _15702 = _15693 + vec3(dot(_15693, _15693.yzx + vec3(33.3300018310546875)));
        vec3 _5427 = _5403.xyz + vec3(((fract((_15702.x + _15702.y) * _15702.z) - 0.5) * 0.0039215688593685626983642578125) * clamp(_5403.w * 8.0, 0.0, 1.0));
        vec4 _18263 = _5403;
        _18263.x = _5427.x;
        _18263.y = _5427.y;
        _18263.z = _5427.z;
        _20689 = _18263;
    }
    else
    {
        _20689 = _5403;
    }
    vec3 _5437 = max(_20689.xyz, vec3(0.0));
    vec4 _18269 = _20689;
    _18269.x = _5437.x;
    _18269.y = _5437.y;
    _18269.z = _5437.z;
    vec4 _20690;
    if ((_188.gTime.w > 0.5) && (_20689.w > 9.9999997473787516355514526367188e-06))
    {
        vec3 _15746 = clamp(_18269.xyz / vec3(_20689.w), vec3(0.0), vec3(1.0));
        vec3 _15752 = pow((_15746 + vec3(0.054999999701976776123046875)) * vec3(0.947867333889007568359375), vec3(2.400000095367431640625));
        vec3 _15755 = _15746 * vec3(0.077399380505084991455078125);
        bvec3 _15757 = lessThanEqual(_15746, vec3(0.040449999272823333740234375));
        vec3 _15732 = vec3(_15757.x ? _15755.x : _15752.x, _15757.y ? _15755.y : _15752.y, _15757.z ? _15755.z : _15752.z) * _20689.w;
        vec4 _18278 = _18269;
        _18278.x = _15732.x;
        _18278.y = _15732.y;
        _18278.z = _15732.z;
        _20690 = _18278;
    }
    else
    {
        _20690 = _18269;
    }
    _entryPointOutput = _20690;
}

