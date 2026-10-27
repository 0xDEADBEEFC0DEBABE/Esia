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

struct gFxData
{
    float4 _data[1];
};

constant uint kEsiaFxFeatures_tmp [[function_constant(0)]];
constant uint kEsiaFxFeatures = is_function_constant_defined(kEsiaFxFeatures_tmp) ? kEsiaFxFeatures_tmp : 4294967295u;
constant uint _1347 = (32768u & kEsiaFxFeatures);
constant uint _1416 = (512u & kEsiaFxFeatures);
constant uint _2516 = (512u & kEsiaFxFeatures);
constant uint _2537 = (32768u & kEsiaFxFeatures);
constant uint _2570 = (1024u & kEsiaFxFeatures);
constant uint _2637 = (32u & kEsiaFxFeatures);
constant uint _2645 = (4u & kEsiaFxFeatures);
constant uint _2650 = (256u & kEsiaFxFeatures);
constant uint _2715 = (8u & kEsiaFxFeatures);
constant uint _2744 = (8192u & kEsiaFxFeatures);
constant uint _2961 = (32u & kEsiaFxFeatures);
constant uint _3025 = (1u & kEsiaFxFeatures);
constant uint _3054 = (64u & kEsiaFxFeatures);
constant uint _3107 = (16384u & kEsiaFxFeatures);
constant uint _3540 = (4u & kEsiaFxFeatures);
constant uint _3544 = (256u & kEsiaFxFeatures);
constant uint _3604 = (16u & kEsiaFxFeatures);
constant uint _3673 = (2u & kEsiaFxFeatures);
constant uint _3803 = (128u & kEsiaFxFeatures);
constant uint _3885 = (2048u & kEsiaFxFeatures);
constant uint _3925 = (8u & kEsiaFxFeatures);
constant uint _3929 = (4u & kEsiaFxFeatures);

constant spvUnsafeArray<float3, 6> _1880 = spvUnsafeArray<float3, 6>({ float3(1.0, 0.4199999868869781494140625, 0.2199999988079071044921875), float3(1.0, 0.699999988079071044921875, 0.300000011920928955078125), float3(0.800000011920928955078125, 0.920000016689300537109375, 0.4000000059604644775390625), float3(0.3499999940395355224609375, 0.89999997615814208984375, 0.699999988079071044921875), float3(0.4000000059604644775390625, 0.62000000476837158203125, 1.0), float3(0.660000026226043701171875, 0.5, 1.0) });
constant spvUnsafeArray<float4, 4> _3271 = spvUnsafeArray<float4, 4>({ float4(-1.0, 1.0, 3.400000095367431640625, 2.599999904632568359375), float4(-0.550000011920928955078125, 0.800000011920928955078125, 2.0, 0.800000011920928955078125), float4(0.300000011920928955078125, 1.0, 1.2000000476837158203125, 1.2999999523162841796875), float4(0.62000000476837158203125, 0.800000011920928955078125, 1.60000002384185791015625, 0.449999988079071044921875) });
constant spvUnsafeArray<float2, 4> _3288 = spvUnsafeArray<float2, 4>({ float2(0.0), float2(0.100000001490116119384765625, 1.2999999523162841796875), float2(0.550000011920928955078125, 3.900000095367431640625), float2(0.20000000298023223876953125, 5.19999980926513671875) });

struct esia_main_out
{
    float4 _entryPointOutput [[color(0)]];
};

struct esia_main_in
{
    float2 i_local [[user(locn0)]];
    uint i_instance [[user(locn1)]];
    float4 i_rect [[user(locn2), flat]];
    float4 i_radii [[user(locn3), flat]];
    float4 i_fill0 [[user(locn4), flat]];
    float4 i_shape [[user(locn5), flat]];
    float4 i_misc [[user(locn6), flat]];
    uint4 i_flags [[user(locn7)]];
};

fragment esia_main_out esia_main(esia_main_in in [[stage_in]], constant WgtFrame& _188 [[buffer(0)]], constant WgtDraw& _231 [[buffer(2)]], const device gFxData& gFxData_1 [[buffer(10)]], texture2d<float> gTex [[texture(3)]], texture2d<float> gBackdrop0 [[texture(4)]], texture2d<float> gBackdrop1 [[texture(5)]], texture2d<float> gBackdrop2 [[texture(6)]], texture2d<float> gBackdrop3 [[texture(7)]], texture2d<float> gBackdrop4 [[texture(8)]], texture2d<float> gBackdrop5 [[texture(9)]], sampler gLinear [[sampler(11)]], float4 gl_FragCoord [[position]])
{
    esia_main_out out = {};
    float2 _5466 = gl_FragCoord.xy + _188.gConv.yy;
    float2 _17424;
    if (_188.gConv.x > 0.5)
    {
        float2 _16267 = _5466;
        _16267.y = _188.gTarget.y - _5466.y;
        _17424 = _16267;
    }
    else
    {
        _17424 = _5466;
    }
    float _4245 = dfdx(in.i_local.x);
    float _4249 = dfdy(in.i_local.x);
    float _4252 = fast::max(abs(_4245) + abs(_4249), 9.9999997473787516355514526367188e-05);
    float4 _17429;
    float4 _17432;
    if ((in.i_flags.z == 2u) || ((in.i_flags.x & _2516) != 0u))
    {
        _17432 = gFxData_1._data[(in.i_instance * 24u) + 15u];
        _17429 = gFxData_1._data[(in.i_instance * 24u) + 16u];
    }
    else
    {
        _17432 = float4(0.0);
        _17429 = float4(0.0);
    }
    float4 _17425;
    float4 _17431;
    if ((in.i_flags.x & _2537) != 0u)
    {
        _17431 = gFxData_1._data[(in.i_instance * 24u) + 15u];
        _17425 = gFxData_1._data[(in.i_instance * 24u) + 18u];
    }
    else
    {
        _17431 = _17432;
        _17425 = float4(0.0);
    }
    float2 _5551 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
    float2 _5560 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
    float _17450;
    if ((in.i_flags.x & _1347) != 0u)
    {
        float _5666 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
        float4 _5700 = gTex.sample(gLinear, mix(_17425.xy, _17425.zw, (fast::clamp(in.i_local, _17431.xy, _17431.zw) - _17431.xy) / fast::max(_17431.zw - _17431.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
        float _5724 = (_5700.w - 0.5) * in.i_radii.y;
        float2 _5765 = abs(in.i_local - ((_17431.xy + _17431.zw) * 0.5)) - fast::max(((_17431.zw - _17431.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _5666), float2(0.0));
        _17450 = fast::max((-mix((fast::max(fast::min(_5700.x, _5700.y), fast::min(fast::max(_5700.x, _5700.y), _5700.z)) - 0.5) * in.i_radii.x, _5724, fast::clamp(abs(_5724) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _5666, length(fast::max(_5765, float2(0.0))) + fast::min(fast::max(_5765.x, _5765.y), 0.0)) - in.i_shape.w;
    }
    else
    {
        float _17451;
        if (in.i_flags.z == 1u)
        {
            float2 _5575 = in.i_local - _5551;
            float _17449;
            do
            {
                if (in.i_shape.w >= 6.282185077667236328125)
                {
                    _17449 = abs(length(_5575) - in.i_radii.x) - in.i_radii.y;
                    break;
                }
                float _5809 = in.i_shape.z + (in.i_shape.w * 0.5);
                float _5811 = cos(_5809);
                float _5813 = sin(_5809);
                float _5822 = dot(_5575, float2(-_5813, _5811));
                float _5825 = dot(_5575, float2(_5811, _5813));
                float2 _5826 = float2(_5822, _5825);
                float _5829 = abs(_5822);
                _5826.x = _5829;
                float _5832 = in.i_shape.w * 0.5;
                float _5834 = sin(_5832);
                float _5836 = cos(_5832);
                _17449 = (((_5836 * _5829) > (_5834 * _5825)) ? length(_5826 - (float2(_5834, _5836) * in.i_radii.x)) : abs(length(_5826) - in.i_radii.x)) - in.i_radii.y;
                break;
            } while(false);
            _17451 = _17449;
        }
        else
        {
            float _17452;
            if (in.i_flags.z == 2u)
            {
                float2 _5872 = in.i_local - _17431.xy;
                float2 _5875 = _17431.zw - _17431.xy;
                _17452 = length(_5872 - (_5875 * fast::clamp(dot(_5872, _5875) / fast::max(dot(_5875, _5875), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
            }
            else
            {
                float2 _5602 = in.i_local - _5551;
                float _5928 = fast::min(_5560.x, _5560.y);
                float _5931 = fast::min((_5602.x > 0.0) ? ((_5602.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_5602.y > 0.0) ? in.i_radii.w : in.i_radii.x), _5928);
                float _5937 = _5931 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                float _17434;
                float _17435;
                if (_5937 > _5928)
                {
                    float _5951 = in.i_shape.y * fast::clamp((_5928 - _5931) / fast::max(0.60000002384185791015625 * _5931, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                    _17435 = _5951;
                    _17434 = _5931 * (1.0 + (0.60000002384185791015625 * _5951));
                }
                else
                {
                    _17435 = in.i_shape.y;
                    _17434 = _5937;
                }
                float2 _5964 = (abs(_5602) - _5560) + float2(_17434);
                float2 _5966 = fast::max(_5964, float2(0.0));
                float _17436;
                if ((_5966.x > 0.0) && (_5966.y > 0.0))
                {
                    float _17437;
                    if ((_17435 > 0.001000000047497451305389404296875) && (_17434 > 9.9999997473787516355514526367188e-05))
                    {
                        float _5983 = 2.0 + (2.0 * _17435);
                        float2 _5988 = _5966 / float2(fast::max(_17434, 9.9999997473787516355514526367188e-05));
                        _17437 = pow(pow(_5988.x, _5983) + pow(_5988.y, _5983), 1.0 / _5983) * _17434;
                    }
                    else
                    {
                        _17437 = length(_5966);
                    }
                    _17436 = _17437;
                }
                else
                {
                    _17436 = fast::max(_5966.x, _5966.y);
                }
                float _6023 = (fast::min(fast::max(_5964.x, _5964.y), 0.0) + _17436) - _17434;
                float _17453;
                if ((in.i_flags.x & _1416) != 0u)
                {
                    float2 _5630 = fast::max((_17431.zw - _17431.xy) * 0.5, float2(0.001000000047497451305389404296875));
                    float2 _5633 = in.i_local - ((_17431.xy + _17431.zw) * 0.5);
                    float _6059 = fast::min(_5630.x, _5630.y);
                    float _6062 = fast::min((_5633.x > 0.0) ? ((_5633.y > 0.0) ? _17429.x : _17429.x) : ((_5633.y > 0.0) ? _17429.x : _17429.x), _6059);
                    float _6068 = _6062 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                    float _17440;
                    float _17441;
                    if (_6068 > _6059)
                    {
                        float _6082 = in.i_shape.y * fast::clamp((_6059 - _6062) / fast::max(0.60000002384185791015625 * _6062, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _17441 = _6082;
                        _17440 = _6062 * (1.0 + (0.60000002384185791015625 * _6082));
                    }
                    else
                    {
                        _17441 = in.i_shape.y;
                        _17440 = _6068;
                    }
                    float2 _6095 = (abs(_5633) - _5630) + float2(_17440);
                    float2 _6097 = fast::max(_6095, float2(0.0));
                    float _17442;
                    if ((_6097.x > 0.0) && (_6097.y > 0.0))
                    {
                        float _17443;
                        if ((_17441 > 0.001000000047497451305389404296875) && (_17440 > 9.9999997473787516355514526367188e-05))
                        {
                            float _6114 = 2.0 + (2.0 * _17441);
                            float2 _6119 = _6097 / float2(fast::max(_17440, 9.9999997473787516355514526367188e-05));
                            _17443 = pow(pow(_6119.x, _6114) + pow(_6119.y, _6114), 1.0 / _6114) * _17440;
                        }
                        else
                        {
                            _17443 = length(_6097);
                        }
                        _17442 = _17443;
                    }
                    else
                    {
                        _17442 = fast::max(_6097.x, _6097.y);
                    }
                    float _6154 = (fast::min(fast::max(_6095.x, _6095.y), 0.0) + _17442) - _17440;
                    float _6159 = fast::max(_17429.y, 9.9999997473787516355514526367188e-05);
                    float _6168 = fast::max(_6159 - abs(_6023 - _6154), 0.0) / _6159;
                    _17453 = fast::min(_6023, _6154) - (((_6168 * _6168) * _6159) * 0.25);
                }
                else
                {
                    _17453 = _6023;
                }
                _17452 = _17453;
            }
            _17451 = _17452;
        }
        _17450 = _17451;
    }
    float _4290 = fast::clamp(0.5 - (_17450 / _4252), 0.0, 1.0);
    float _19610;
    if ((in.i_flags.x & _2570) != 0u)
    {
        uint _6184 = (in.i_instance * 24u) + 19u;
        uint _6192 = (in.i_instance * 24u) + 20u;
        float2 _4319 = fast::max((gFxData_1._data[_6184].zw - gFxData_1._data[_6184].xy) * 0.5, float2(0.001000000047497451305389404296875));
        float2 _4322 = in.i_local - ((gFxData_1._data[_6184].xy + gFxData_1._data[_6184].zw) * 0.5);
        float _6230 = fast::min(_4319.x, _4319.y);
        float _6233 = fast::min((_4322.x > 0.0) ? ((_4322.y > 0.0) ? gFxData_1._data[_6192].x : gFxData_1._data[_6192].x) : ((_4322.y > 0.0) ? gFxData_1._data[_6192].x : gFxData_1._data[_6192].x), _6230);
        float _6239 = _6233 * (1.0 + (0.60000002384185791015625 * gFxData_1._data[_6192].y));
        float _17454;
        float _17455;
        if (_6239 > _6230)
        {
            float _6253 = gFxData_1._data[_6192].y * fast::clamp((_6230 - _6233) / fast::max(0.60000002384185791015625 * _6233, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
            _17455 = _6253;
            _17454 = _6233 * (1.0 + (0.60000002384185791015625 * _6253));
        }
        else
        {
            _17455 = gFxData_1._data[_6192].y;
            _17454 = _6239;
        }
        float2 _6266 = (abs(_4322) - _4319) + float2(_17454);
        float2 _6268 = fast::max(_6266, float2(0.0));
        float _17456;
        if ((_6268.x > 0.0) && (_6268.y > 0.0))
        {
            float _17457;
            if ((_17455 > 0.001000000047497451305389404296875) && (_17454 > 9.9999997473787516355514526367188e-05))
            {
                float _6285 = 2.0 + (2.0 * _17455);
                float2 _6290 = _6268 / float2(fast::max(_17454, 9.9999997473787516355514526367188e-05));
                _17457 = pow(pow(_6290.x, _6285) + pow(_6290.y, _6285), 1.0 / _6285) * _17454;
            }
            else
            {
                _17457 = length(_6268);
            }
            _17456 = _17457;
        }
        else
        {
            _17456 = fast::max(_6268.x, _6268.y);
        }
        float _4334 = fast::clamp(0.5 - (((fast::min(fast::max(_6266.x, _6266.y), 0.0) + _17456) - _17454) / _4252), 0.0, 1.0);
        if (_4334 <= 0.0)
        {
            discard_fragment();
        }
        _19610 = _4334;
    }
    else
    {
        _19610 = 1.0;
    }
    bool _4345 = ((in.i_flags.x & _2637) != 0u) && (_4290 >= 0.999000012874603271484375);
    float4 _17567;
    if ((((in.i_flags.x & _2645) != 0u) && (!((in.i_flags.x & _2650) != 0u))) && (!_4345))
    {
        uint _6331 = (in.i_instance * 24u) + 7u;
        uint _6339 = (in.i_instance * 24u) + 8u;
        float2 _4376 = in.i_local - gFxData_1._data[_6339].zw;
        float2 _6382 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
        float2 _6391 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
        float _17521;
        if ((in.i_flags.x & _1347) != 0u)
        {
            float _6497 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
            float4 _6531 = gTex.sample(gLinear, mix(_17425.xy, _17425.zw, (fast::clamp(_4376, _17431.xy, _17431.zw) - _17431.xy) / fast::max(_17431.zw - _17431.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
            float _6555 = (_6531.w - 0.5) * in.i_radii.y;
            float2 _6596 = abs(_4376 - ((_17431.xy + _17431.zw) * 0.5)) - fast::max(((_17431.zw - _17431.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _6497), float2(0.0));
            _17521 = fast::max((-mix((fast::max(fast::min(_6531.x, _6531.y), fast::min(fast::max(_6531.x, _6531.y), _6531.z)) - 0.5) * in.i_radii.x, _6555, fast::clamp(abs(_6555) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _6497, length(fast::max(_6596, float2(0.0))) + fast::min(fast::max(_6596.x, _6596.y), 0.0)) - in.i_shape.w;
        }
        else
        {
            float _17522;
            if (in.i_flags.z == 1u)
            {
                float2 _6406 = _4376 - _6382;
                float _17520;
                do
                {
                    if (in.i_shape.w >= 6.282185077667236328125)
                    {
                        _17520 = abs(length(_6406) - in.i_radii.x) - in.i_radii.y;
                        break;
                    }
                    float _6640 = in.i_shape.z + (in.i_shape.w * 0.5);
                    float _6642 = cos(_6640);
                    float _6644 = sin(_6640);
                    float _6653 = dot(_6406, float2(-_6644, _6642));
                    float _6656 = dot(_6406, float2(_6642, _6644));
                    float2 _6657 = float2(_6653, _6656);
                    float _6660 = abs(_6653);
                    _6657.x = _6660;
                    float _6663 = in.i_shape.w * 0.5;
                    float _6665 = sin(_6663);
                    float _6667 = cos(_6663);
                    _17520 = (((_6667 * _6660) > (_6665 * _6656)) ? length(_6657 - (float2(_6665, _6667) * in.i_radii.x)) : abs(length(_6657) - in.i_radii.x)) - in.i_radii.y;
                    break;
                } while(false);
                _17522 = _17520;
            }
            else
            {
                float _17523;
                if (in.i_flags.z == 2u)
                {
                    float2 _6703 = _4376 - _17431.xy;
                    float2 _6706 = _17431.zw - _17431.xy;
                    _17523 = length(_6703 - (_6706 * fast::clamp(dot(_6703, _6706) / fast::max(dot(_6706, _6706), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                }
                else
                {
                    float2 _6433 = _4376 - _6382;
                    float _6759 = fast::min(_6391.x, _6391.y);
                    float _6762 = fast::min((_6433.x > 0.0) ? ((_6433.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_6433.y > 0.0) ? in.i_radii.w : in.i_radii.x), _6759);
                    float _6768 = _6762 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                    float _17505;
                    float _17506;
                    if (_6768 > _6759)
                    {
                        float _6782 = in.i_shape.y * fast::clamp((_6759 - _6762) / fast::max(0.60000002384185791015625 * _6762, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _17506 = _6782;
                        _17505 = _6762 * (1.0 + (0.60000002384185791015625 * _6782));
                    }
                    else
                    {
                        _17506 = in.i_shape.y;
                        _17505 = _6768;
                    }
                    float2 _6795 = (abs(_6433) - _6391) + float2(_17505);
                    float2 _6797 = fast::max(_6795, float2(0.0));
                    float _17507;
                    if ((_6797.x > 0.0) && (_6797.y > 0.0))
                    {
                        float _17508;
                        if ((_17506 > 0.001000000047497451305389404296875) && (_17505 > 9.9999997473787516355514526367188e-05))
                        {
                            float _6814 = 2.0 + (2.0 * _17506);
                            float2 _6819 = _6797 / float2(fast::max(_17505, 9.9999997473787516355514526367188e-05));
                            _17508 = pow(pow(_6819.x, _6814) + pow(_6819.y, _6814), 1.0 / _6814) * _17505;
                        }
                        else
                        {
                            _17508 = length(_6797);
                        }
                        _17507 = _17508;
                    }
                    else
                    {
                        _17507 = fast::max(_6797.x, _6797.y);
                    }
                    float _6854 = (fast::min(fast::max(_6795.x, _6795.y), 0.0) + _17507) - _17505;
                    float _17524;
                    if ((in.i_flags.x & _1416) != 0u)
                    {
                        float2 _6461 = fast::max((_17431.zw - _17431.xy) * 0.5, float2(0.001000000047497451305389404296875));
                        float2 _6464 = _4376 - ((_17431.xy + _17431.zw) * 0.5);
                        float _6890 = fast::min(_6461.x, _6461.y);
                        float _6893 = fast::min((_6464.x > 0.0) ? ((_6464.y > 0.0) ? _17429.x : _17429.x) : ((_6464.y > 0.0) ? _17429.x : _17429.x), _6890);
                        float _6899 = _6893 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _17511;
                        float _17512;
                        if (_6899 > _6890)
                        {
                            float _6913 = in.i_shape.y * fast::clamp((_6890 - _6893) / fast::max(0.60000002384185791015625 * _6893, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _17512 = _6913;
                            _17511 = _6893 * (1.0 + (0.60000002384185791015625 * _6913));
                        }
                        else
                        {
                            _17512 = in.i_shape.y;
                            _17511 = _6899;
                        }
                        float2 _6926 = (abs(_6464) - _6461) + float2(_17511);
                        float2 _6928 = fast::max(_6926, float2(0.0));
                        float _17513;
                        if ((_6928.x > 0.0) && (_6928.y > 0.0))
                        {
                            float _17514;
                            if ((_17512 > 0.001000000047497451305389404296875) && (_17511 > 9.9999997473787516355514526367188e-05))
                            {
                                float _6945 = 2.0 + (2.0 * _17512);
                                float2 _6950 = _6928 / float2(fast::max(_17511, 9.9999997473787516355514526367188e-05));
                                _17514 = pow(pow(_6950.x, _6945) + pow(_6950.y, _6945), 1.0 / _6945) * _17511;
                            }
                            else
                            {
                                _17514 = length(_6928);
                            }
                            _17513 = _17514;
                        }
                        else
                        {
                            _17513 = fast::max(_6928.x, _6928.y);
                        }
                        float _6985 = (fast::min(fast::max(_6926.x, _6926.y), 0.0) + _17513) - _17511;
                        float _6990 = fast::max(_17429.y, 9.9999997473787516355514526367188e-05);
                        float _6999 = fast::max(_6990 - abs(_6854 - _6985), 0.0) / _6990;
                        _17524 = fast::min(_6854, _6985) - (((_6999 * _6999) * _6990) * 0.25);
                    }
                    else
                    {
                        _17524 = _6854;
                    }
                    _17523 = _17524;
                }
                _17522 = _17523;
            }
            _17521 = _17522;
        }
        float _4385 = (_17521 - gFxData_1._data[_6339].y) / (fast::max(gFxData_1._data[_6339].x * 0.5, _4252 * 0.5) * 1.41421353816986083984375);
        float _7016 = sign(_4385);
        float _7018 = abs(_4385);
        float _7029 = 1.0 + ((0.2783930003643035888671875 + ((0.23038899898529052734375 + (0.07810799777507781982421875 * (_7018 * _7018))) * _7018)) * _7018);
        float _7032 = _7029 * _7029;
        float _7047 = fast::clamp(gFxData_1._data[_6331].w * (0.5 - (0.5 * (_7016 - (_7016 / (_7032 * _7032))))), 0.0, 1.0);
        _17567 = float4(gFxData_1._data[_6331].xyz * _7047, _7047);
    }
    else
    {
        _17567 = float4(0.0);
    }
    float4 _18478;
    if (((in.i_flags.x & _2715) != 0u) && (!_4345))
    {
        uint _7071 = (in.i_instance * 24u) + 9u;
        uint _7079 = (in.i_instance * 24u) + 10u;
        float _4413 = fast::max(gFxData_1._data[_7079].x, 0.001000000047497451305389404296875);
        float _17560;
        float _17563;
        if ((in.i_flags.x & _2744) != 0u)
        {
            uint _7087 = (in.i_instance * 24u) + 22u;
            float2 _4429 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
            float2 _4438 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
            float2 _4445 = in.i_rect.xy - gFxData_1._data[_7087].xy;
            float2 _4452 = gFxData_1._data[_7087].zw - in.i_rect.zw;
            float2 _4482 = fast::clamp(float2((in.i_local.x < _4429.x) ? _4445.x : _4452.x, (in.i_local.y < _4429.y) ? _4445.y : _4452.y) * float2(0.58823525905609130859375), float2(fast::min(_4413, 1.5)), float2(_4413));
            float _4487 = fast::min(_4438.x, _4438.y);
            float _17558;
            if (in.i_flags.z == 0u)
            {
                _17558 = fast::min(((in.i_local.x > _4429.x) ? ((in.i_local.y > _4429.y) ? in.i_radii.z : in.i_radii.y) : ((in.i_local.y > _4429.y) ? in.i_radii.w : in.i_radii.x)) * (1.0 + (0.60000002384185791015625 * in.i_shape.y)), _4487);
            }
            else
            {
                _17558 = _4487;
            }
            float2 _4536 = fast::max(abs(in.i_local - _4429) - (_4438 - float2(_17558)), float2(0.0));
            float _4538 = length(_4536);
            float2 _4546 = select(float2(0.707099974155426025390625), _4536 / float2(_4538), bool2(_4538 > 9.9999997473787516355514526367188e-05));
            float2 _4561 = in.i_local - gFxData_1._data[_7087].xy;
            float2 _4566 = gFxData_1._data[_7087].zw - in.i_local;
            _17563 = fast::clamp(fast::min(fast::min(_4561.x, _4561.y), fast::min(_4566.x, _4566.y)) * 0.666666686534881591796875, 0.0, 1.0);
            _17560 = rsqrt(dot(_4546 * _4546, float2(1.0) / (_4482 * _4482)));
        }
        else
        {
            _17563 = 1.0;
            _17560 = _4413;
        }
        float _4584 = fast::max(_17450, 0.0) / _17560;
        float _7097 = fast::clamp(gFxData_1._data[_7071].w * fast::clamp((exp(((-_4584) * _4584) * 2.2000000476837158203125) * gFxData_1._data[_7079].y) * _17563, 0.0, 1.0), 0.0, 1.0);
        _18478 = float4(gFxData_1._data[_7071].xyz * _7097, _7097) + (_17567 * (1.0 - _7097));
    }
    else
    {
        _18478 = _17567;
    }
    float4 _19007;
    float4 _19181;
    float _19575;
    if (((in.i_flags.x & _2961) != 0u) && (_4290 > 0.0))
    {
        uint _7121 = (in.i_instance * 24u) + 11u;
        uint _7129 = (in.i_instance * 24u) + 12u;
        uint _7137 = (in.i_instance * 24u) + 13u;
        uint _7145 = (in.i_instance * 24u) + 16u;
        float _7217 = gFxData_1._data[_7121].x * _188.gDisplay.z;
        float2 _7228 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(1.0));
        float _7236 = fast::clamp(gFxData_1._data[_7121].z, 0.001000000047497451305389404296875, fast::min(_7228.x, _7228.y));
        float _7245 = fast::clamp(1.0 - (fast::max(-_17450, 0.0) / _7236), 0.0, 1.0);
        float _7251 = sqrt(fast::clamp(1.0 - (_7245 * _7245), 0.0, 1.0));
        float2 _17679;
        float3 _18256;
        if (_7245 > 0.0)
        {
            float2 _7658 = in.i_local + float2(0.5, 0.0);
            float2 _7728 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
            float2 _7737 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
            float _17615;
            if ((in.i_flags.x & _1347) != 0u)
            {
                float _7843 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
                float4 _7877 = gTex.sample(gLinear, mix(_17425.xy, _17425.zw, (fast::clamp(_7658, _17431.xy, _17431.zw) - _17431.xy) / fast::max(_17431.zw - _17431.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
                float _7901 = (_7877.w - 0.5) * in.i_radii.y;
                float2 _7942 = abs(_7658 - ((_17431.xy + _17431.zw) * 0.5)) - fast::max(((_17431.zw - _17431.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _7843), float2(0.0));
                _17615 = fast::max((-mix((fast::max(fast::min(_7877.x, _7877.y), fast::min(fast::max(_7877.x, _7877.y), _7877.z)) - 0.5) * in.i_radii.x, _7901, fast::clamp(abs(_7901) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _7843, length(fast::max(_7942, float2(0.0))) + fast::min(fast::max(_7942.x, _7942.y), 0.0)) - in.i_shape.w;
            }
            else
            {
                float _17616;
                if (in.i_flags.z == 1u)
                {
                    float2 _7752 = _7658 - _7728;
                    float _17614;
                    do
                    {
                        if (in.i_shape.w >= 6.282185077667236328125)
                        {
                            _17614 = abs(length(_7752) - in.i_radii.x) - in.i_radii.y;
                            break;
                        }
                        float _7986 = in.i_shape.z + (in.i_shape.w * 0.5);
                        float _7988 = cos(_7986);
                        float _7990 = sin(_7986);
                        float _7999 = dot(_7752, float2(-_7990, _7988));
                        float _8002 = dot(_7752, float2(_7988, _7990));
                        float2 _8003 = float2(_7999, _8002);
                        float _8006 = abs(_7999);
                        _8003.x = _8006;
                        float _8009 = in.i_shape.w * 0.5;
                        float _8011 = sin(_8009);
                        float _8013 = cos(_8009);
                        _17614 = (((_8013 * _8006) > (_8011 * _8002)) ? length(_8003 - (float2(_8011, _8013) * in.i_radii.x)) : abs(length(_8003) - in.i_radii.x)) - in.i_radii.y;
                        break;
                    } while(false);
                    _17616 = _17614;
                }
                else
                {
                    float _17617;
                    if (in.i_flags.z == 2u)
                    {
                        float2 _8049 = _7658 - _17431.xy;
                        float2 _8052 = _17431.zw - _17431.xy;
                        _17617 = length(_8049 - (_8052 * fast::clamp(dot(_8049, _8052) / fast::max(dot(_8052, _8052), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                    }
                    else
                    {
                        float2 _7779 = _7658 - _7728;
                        float _8105 = fast::min(_7737.x, _7737.y);
                        float _8108 = fast::min((_7779.x > 0.0) ? ((_7779.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_7779.y > 0.0) ? in.i_radii.w : in.i_radii.x), _8105);
                        float _8114 = _8108 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _17599;
                        float _17600;
                        if (_8114 > _8105)
                        {
                            float _8128 = in.i_shape.y * fast::clamp((_8105 - _8108) / fast::max(0.60000002384185791015625 * _8108, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _17600 = _8128;
                            _17599 = _8108 * (1.0 + (0.60000002384185791015625 * _8128));
                        }
                        else
                        {
                            _17600 = in.i_shape.y;
                            _17599 = _8114;
                        }
                        float2 _8141 = (abs(_7779) - _7737) + float2(_17599);
                        float2 _8143 = fast::max(_8141, float2(0.0));
                        float _17601;
                        if ((_8143.x > 0.0) && (_8143.y > 0.0))
                        {
                            float _17602;
                            if ((_17600 > 0.001000000047497451305389404296875) && (_17599 > 9.9999997473787516355514526367188e-05))
                            {
                                float _8160 = 2.0 + (2.0 * _17600);
                                float2 _8165 = _8143 / float2(fast::max(_17599, 9.9999997473787516355514526367188e-05));
                                _17602 = pow(pow(_8165.x, _8160) + pow(_8165.y, _8160), 1.0 / _8160) * _17599;
                            }
                            else
                            {
                                _17602 = length(_8143);
                            }
                            _17601 = _17602;
                        }
                        else
                        {
                            _17601 = fast::max(_8143.x, _8143.y);
                        }
                        float _8200 = (fast::min(fast::max(_8141.x, _8141.y), 0.0) + _17601) - _17599;
                        float _17618;
                        if ((in.i_flags.x & _1416) != 0u)
                        {
                            float2 _7807 = fast::max((_17431.zw - _17431.xy) * 0.5, float2(0.001000000047497451305389404296875));
                            float2 _7810 = _7658 - ((_17431.xy + _17431.zw) * 0.5);
                            float _8236 = fast::min(_7807.x, _7807.y);
                            float _8239 = fast::min((_7810.x > 0.0) ? ((_7810.y > 0.0) ? gFxData_1._data[_7145].x : gFxData_1._data[_7145].x) : ((_7810.y > 0.0) ? gFxData_1._data[_7145].x : gFxData_1._data[_7145].x), _8236);
                            float _8245 = _8239 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                            float _17605;
                            float _17606;
                            if (_8245 > _8236)
                            {
                                float _8259 = in.i_shape.y * fast::clamp((_8236 - _8239) / fast::max(0.60000002384185791015625 * _8239, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _17606 = _8259;
                                _17605 = _8239 * (1.0 + (0.60000002384185791015625 * _8259));
                            }
                            else
                            {
                                _17606 = in.i_shape.y;
                                _17605 = _8245;
                            }
                            float2 _8272 = (abs(_7810) - _7807) + float2(_17605);
                            float2 _8274 = fast::max(_8272, float2(0.0));
                            float _17607;
                            if ((_8274.x > 0.0) && (_8274.y > 0.0))
                            {
                                float _17608;
                                if ((_17606 > 0.001000000047497451305389404296875) && (_17605 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _8291 = 2.0 + (2.0 * _17606);
                                    float2 _8296 = _8274 / float2(fast::max(_17605, 9.9999997473787516355514526367188e-05));
                                    _17608 = pow(pow(_8296.x, _8291) + pow(_8296.y, _8291), 1.0 / _8291) * _17605;
                                }
                                else
                                {
                                    _17608 = length(_8274);
                                }
                                _17607 = _17608;
                            }
                            else
                            {
                                _17607 = fast::max(_8274.x, _8274.y);
                            }
                            float _8331 = (fast::min(fast::max(_8272.x, _8272.y), 0.0) + _17607) - _17605;
                            float _8336 = fast::max(gFxData_1._data[_7145].y, 9.9999997473787516355514526367188e-05);
                            float _8345 = fast::max(_8336 - abs(_8200 - _8331), 0.0) / _8336;
                            _17618 = fast::min(_8200, _8331) - (((_8345 * _8345) * _8336) * 0.25);
                        }
                        else
                        {
                            _17618 = _8200;
                        }
                        _17617 = _17618;
                    }
                    _17616 = _17617;
                }
                _17615 = _17616;
            }
            float2 _7662 = in.i_local - float2(0.5, 0.0);
            float2 _8396 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
            float2 _8405 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
            float _17635;
            if ((in.i_flags.x & _1347) != 0u)
            {
                float _8511 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
                float4 _8545 = gTex.sample(gLinear, mix(_17425.xy, _17425.zw, (fast::clamp(_7662, _17431.xy, _17431.zw) - _17431.xy) / fast::max(_17431.zw - _17431.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
                float _8569 = (_8545.w - 0.5) * in.i_radii.y;
                float2 _8610 = abs(_7662 - ((_17431.xy + _17431.zw) * 0.5)) - fast::max(((_17431.zw - _17431.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _8511), float2(0.0));
                _17635 = fast::max((-mix((fast::max(fast::min(_8545.x, _8545.y), fast::min(fast::max(_8545.x, _8545.y), _8545.z)) - 0.5) * in.i_radii.x, _8569, fast::clamp(abs(_8569) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _8511, length(fast::max(_8610, float2(0.0))) + fast::min(fast::max(_8610.x, _8610.y), 0.0)) - in.i_shape.w;
            }
            else
            {
                float _17636;
                if (in.i_flags.z == 1u)
                {
                    float2 _8420 = _7662 - _8396;
                    float _17634;
                    do
                    {
                        if (in.i_shape.w >= 6.282185077667236328125)
                        {
                            _17634 = abs(length(_8420) - in.i_radii.x) - in.i_radii.y;
                            break;
                        }
                        float _8654 = in.i_shape.z + (in.i_shape.w * 0.5);
                        float _8656 = cos(_8654);
                        float _8658 = sin(_8654);
                        float _8667 = dot(_8420, float2(-_8658, _8656));
                        float _8670 = dot(_8420, float2(_8656, _8658));
                        float2 _8671 = float2(_8667, _8670);
                        float _8674 = abs(_8667);
                        _8671.x = _8674;
                        float _8677 = in.i_shape.w * 0.5;
                        float _8679 = sin(_8677);
                        float _8681 = cos(_8677);
                        _17634 = (((_8681 * _8674) > (_8679 * _8670)) ? length(_8671 - (float2(_8679, _8681) * in.i_radii.x)) : abs(length(_8671) - in.i_radii.x)) - in.i_radii.y;
                        break;
                    } while(false);
                    _17636 = _17634;
                }
                else
                {
                    float _17637;
                    if (in.i_flags.z == 2u)
                    {
                        float2 _8717 = _7662 - _17431.xy;
                        float2 _8720 = _17431.zw - _17431.xy;
                        _17637 = length(_8717 - (_8720 * fast::clamp(dot(_8717, _8720) / fast::max(dot(_8720, _8720), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                    }
                    else
                    {
                        float2 _8447 = _7662 - _8396;
                        float _8773 = fast::min(_8405.x, _8405.y);
                        float _8776 = fast::min((_8447.x > 0.0) ? ((_8447.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_8447.y > 0.0) ? in.i_radii.w : in.i_radii.x), _8773);
                        float _8782 = _8776 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _17619;
                        float _17620;
                        if (_8782 > _8773)
                        {
                            float _8796 = in.i_shape.y * fast::clamp((_8773 - _8776) / fast::max(0.60000002384185791015625 * _8776, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _17620 = _8796;
                            _17619 = _8776 * (1.0 + (0.60000002384185791015625 * _8796));
                        }
                        else
                        {
                            _17620 = in.i_shape.y;
                            _17619 = _8782;
                        }
                        float2 _8809 = (abs(_8447) - _8405) + float2(_17619);
                        float2 _8811 = fast::max(_8809, float2(0.0));
                        float _17621;
                        if ((_8811.x > 0.0) && (_8811.y > 0.0))
                        {
                            float _17622;
                            if ((_17620 > 0.001000000047497451305389404296875) && (_17619 > 9.9999997473787516355514526367188e-05))
                            {
                                float _8828 = 2.0 + (2.0 * _17620);
                                float2 _8833 = _8811 / float2(fast::max(_17619, 9.9999997473787516355514526367188e-05));
                                _17622 = pow(pow(_8833.x, _8828) + pow(_8833.y, _8828), 1.0 / _8828) * _17619;
                            }
                            else
                            {
                                _17622 = length(_8811);
                            }
                            _17621 = _17622;
                        }
                        else
                        {
                            _17621 = fast::max(_8811.x, _8811.y);
                        }
                        float _8868 = (fast::min(fast::max(_8809.x, _8809.y), 0.0) + _17621) - _17619;
                        float _17638;
                        if ((in.i_flags.x & _1416) != 0u)
                        {
                            float2 _8475 = fast::max((_17431.zw - _17431.xy) * 0.5, float2(0.001000000047497451305389404296875));
                            float2 _8478 = _7662 - ((_17431.xy + _17431.zw) * 0.5);
                            float _8904 = fast::min(_8475.x, _8475.y);
                            float _8907 = fast::min((_8478.x > 0.0) ? ((_8478.y > 0.0) ? gFxData_1._data[_7145].x : gFxData_1._data[_7145].x) : ((_8478.y > 0.0) ? gFxData_1._data[_7145].x : gFxData_1._data[_7145].x), _8904);
                            float _8913 = _8907 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                            float _17625;
                            float _17626;
                            if (_8913 > _8904)
                            {
                                float _8927 = in.i_shape.y * fast::clamp((_8904 - _8907) / fast::max(0.60000002384185791015625 * _8907, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _17626 = _8927;
                                _17625 = _8907 * (1.0 + (0.60000002384185791015625 * _8927));
                            }
                            else
                            {
                                _17626 = in.i_shape.y;
                                _17625 = _8913;
                            }
                            float2 _8940 = (abs(_8478) - _8475) + float2(_17625);
                            float2 _8942 = fast::max(_8940, float2(0.0));
                            float _17627;
                            if ((_8942.x > 0.0) && (_8942.y > 0.0))
                            {
                                float _17628;
                                if ((_17626 > 0.001000000047497451305389404296875) && (_17625 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _8959 = 2.0 + (2.0 * _17626);
                                    float2 _8964 = _8942 / float2(fast::max(_17625, 9.9999997473787516355514526367188e-05));
                                    _17628 = pow(pow(_8964.x, _8959) + pow(_8964.y, _8959), 1.0 / _8959) * _17625;
                                }
                                else
                                {
                                    _17628 = length(_8942);
                                }
                                _17627 = _17628;
                            }
                            else
                            {
                                _17627 = fast::max(_8942.x, _8942.y);
                            }
                            float _8999 = (fast::min(fast::max(_8940.x, _8940.y), 0.0) + _17627) - _17625;
                            float _9004 = fast::max(gFxData_1._data[_7145].y, 9.9999997473787516355514526367188e-05);
                            float _9013 = fast::max(_9004 - abs(_8868 - _8999), 0.0) / _9004;
                            _17638 = fast::min(_8868, _8999) - (((_9013 * _9013) * _9004) * 0.25);
                        }
                        else
                        {
                            _17638 = _8868;
                        }
                        _17637 = _17638;
                    }
                    _17636 = _17637;
                }
                _17635 = _17636;
            }
            float2 _7667 = in.i_local + float2(0.0, 0.5);
            float2 _9064 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
            float2 _9073 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
            float _17655;
            if ((in.i_flags.x & _1347) != 0u)
            {
                float _9179 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
                float4 _9213 = gTex.sample(gLinear, mix(_17425.xy, _17425.zw, (fast::clamp(_7667, _17431.xy, _17431.zw) - _17431.xy) / fast::max(_17431.zw - _17431.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
                float _9237 = (_9213.w - 0.5) * in.i_radii.y;
                float2 _9278 = abs(_7667 - ((_17431.xy + _17431.zw) * 0.5)) - fast::max(((_17431.zw - _17431.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _9179), float2(0.0));
                _17655 = fast::max((-mix((fast::max(fast::min(_9213.x, _9213.y), fast::min(fast::max(_9213.x, _9213.y), _9213.z)) - 0.5) * in.i_radii.x, _9237, fast::clamp(abs(_9237) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _9179, length(fast::max(_9278, float2(0.0))) + fast::min(fast::max(_9278.x, _9278.y), 0.0)) - in.i_shape.w;
            }
            else
            {
                float _17656;
                if (in.i_flags.z == 1u)
                {
                    float2 _9088 = _7667 - _9064;
                    float _17654;
                    do
                    {
                        if (in.i_shape.w >= 6.282185077667236328125)
                        {
                            _17654 = abs(length(_9088) - in.i_radii.x) - in.i_radii.y;
                            break;
                        }
                        float _9322 = in.i_shape.z + (in.i_shape.w * 0.5);
                        float _9324 = cos(_9322);
                        float _9326 = sin(_9322);
                        float _9335 = dot(_9088, float2(-_9326, _9324));
                        float _9338 = dot(_9088, float2(_9324, _9326));
                        float2 _9339 = float2(_9335, _9338);
                        float _9342 = abs(_9335);
                        _9339.x = _9342;
                        float _9345 = in.i_shape.w * 0.5;
                        float _9347 = sin(_9345);
                        float _9349 = cos(_9345);
                        _17654 = (((_9349 * _9342) > (_9347 * _9338)) ? length(_9339 - (float2(_9347, _9349) * in.i_radii.x)) : abs(length(_9339) - in.i_radii.x)) - in.i_radii.y;
                        break;
                    } while(false);
                    _17656 = _17654;
                }
                else
                {
                    float _17657;
                    if (in.i_flags.z == 2u)
                    {
                        float2 _9385 = _7667 - _17431.xy;
                        float2 _9388 = _17431.zw - _17431.xy;
                        _17657 = length(_9385 - (_9388 * fast::clamp(dot(_9385, _9388) / fast::max(dot(_9388, _9388), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                    }
                    else
                    {
                        float2 _9115 = _7667 - _9064;
                        float _9441 = fast::min(_9073.x, _9073.y);
                        float _9444 = fast::min((_9115.x > 0.0) ? ((_9115.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_9115.y > 0.0) ? in.i_radii.w : in.i_radii.x), _9441);
                        float _9450 = _9444 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _17639;
                        float _17640;
                        if (_9450 > _9441)
                        {
                            float _9464 = in.i_shape.y * fast::clamp((_9441 - _9444) / fast::max(0.60000002384185791015625 * _9444, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _17640 = _9464;
                            _17639 = _9444 * (1.0 + (0.60000002384185791015625 * _9464));
                        }
                        else
                        {
                            _17640 = in.i_shape.y;
                            _17639 = _9450;
                        }
                        float2 _9477 = (abs(_9115) - _9073) + float2(_17639);
                        float2 _9479 = fast::max(_9477, float2(0.0));
                        float _17641;
                        if ((_9479.x > 0.0) && (_9479.y > 0.0))
                        {
                            float _17642;
                            if ((_17640 > 0.001000000047497451305389404296875) && (_17639 > 9.9999997473787516355514526367188e-05))
                            {
                                float _9496 = 2.0 + (2.0 * _17640);
                                float2 _9501 = _9479 / float2(fast::max(_17639, 9.9999997473787516355514526367188e-05));
                                _17642 = pow(pow(_9501.x, _9496) + pow(_9501.y, _9496), 1.0 / _9496) * _17639;
                            }
                            else
                            {
                                _17642 = length(_9479);
                            }
                            _17641 = _17642;
                        }
                        else
                        {
                            _17641 = fast::max(_9479.x, _9479.y);
                        }
                        float _9536 = (fast::min(fast::max(_9477.x, _9477.y), 0.0) + _17641) - _17639;
                        float _17658;
                        if ((in.i_flags.x & _1416) != 0u)
                        {
                            float2 _9143 = fast::max((_17431.zw - _17431.xy) * 0.5, float2(0.001000000047497451305389404296875));
                            float2 _9146 = _7667 - ((_17431.xy + _17431.zw) * 0.5);
                            float _9572 = fast::min(_9143.x, _9143.y);
                            float _9575 = fast::min((_9146.x > 0.0) ? ((_9146.y > 0.0) ? gFxData_1._data[_7145].x : gFxData_1._data[_7145].x) : ((_9146.y > 0.0) ? gFxData_1._data[_7145].x : gFxData_1._data[_7145].x), _9572);
                            float _9581 = _9575 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                            float _17645;
                            float _17646;
                            if (_9581 > _9572)
                            {
                                float _9595 = in.i_shape.y * fast::clamp((_9572 - _9575) / fast::max(0.60000002384185791015625 * _9575, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _17646 = _9595;
                                _17645 = _9575 * (1.0 + (0.60000002384185791015625 * _9595));
                            }
                            else
                            {
                                _17646 = in.i_shape.y;
                                _17645 = _9581;
                            }
                            float2 _9608 = (abs(_9146) - _9143) + float2(_17645);
                            float2 _9610 = fast::max(_9608, float2(0.0));
                            float _17647;
                            if ((_9610.x > 0.0) && (_9610.y > 0.0))
                            {
                                float _17648;
                                if ((_17646 > 0.001000000047497451305389404296875) && (_17645 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _9627 = 2.0 + (2.0 * _17646);
                                    float2 _9632 = _9610 / float2(fast::max(_17645, 9.9999997473787516355514526367188e-05));
                                    _17648 = pow(pow(_9632.x, _9627) + pow(_9632.y, _9627), 1.0 / _9627) * _17645;
                                }
                                else
                                {
                                    _17648 = length(_9610);
                                }
                                _17647 = _17648;
                            }
                            else
                            {
                                _17647 = fast::max(_9610.x, _9610.y);
                            }
                            float _9667 = (fast::min(fast::max(_9608.x, _9608.y), 0.0) + _17647) - _17645;
                            float _9672 = fast::max(gFxData_1._data[_7145].y, 9.9999997473787516355514526367188e-05);
                            float _9681 = fast::max(_9672 - abs(_9536 - _9667), 0.0) / _9672;
                            _17658 = fast::min(_9536, _9667) - (((_9681 * _9681) * _9672) * 0.25);
                        }
                        else
                        {
                            _17658 = _9536;
                        }
                        _17657 = _17658;
                    }
                    _17656 = _17657;
                }
                _17655 = _17656;
            }
            float2 _7671 = in.i_local - float2(0.0, 0.5);
            float2 _9732 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
            float2 _9741 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
            float _17675;
            if ((in.i_flags.x & _1347) != 0u)
            {
                float _9847 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
                float4 _9881 = gTex.sample(gLinear, mix(_17425.xy, _17425.zw, (fast::clamp(_7671, _17431.xy, _17431.zw) - _17431.xy) / fast::max(_17431.zw - _17431.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
                float _9905 = (_9881.w - 0.5) * in.i_radii.y;
                float2 _9946 = abs(_7671 - ((_17431.xy + _17431.zw) * 0.5)) - fast::max(((_17431.zw - _17431.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _9847), float2(0.0));
                _17675 = fast::max((-mix((fast::max(fast::min(_9881.x, _9881.y), fast::min(fast::max(_9881.x, _9881.y), _9881.z)) - 0.5) * in.i_radii.x, _9905, fast::clamp(abs(_9905) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _9847, length(fast::max(_9946, float2(0.0))) + fast::min(fast::max(_9946.x, _9946.y), 0.0)) - in.i_shape.w;
            }
            else
            {
                float _17676;
                if (in.i_flags.z == 1u)
                {
                    float2 _9756 = _7671 - _9732;
                    float _17674;
                    do
                    {
                        if (in.i_shape.w >= 6.282185077667236328125)
                        {
                            _17674 = abs(length(_9756) - in.i_radii.x) - in.i_radii.y;
                            break;
                        }
                        float _9990 = in.i_shape.z + (in.i_shape.w * 0.5);
                        float _9992 = cos(_9990);
                        float _9994 = sin(_9990);
                        float _10003 = dot(_9756, float2(-_9994, _9992));
                        float _10006 = dot(_9756, float2(_9992, _9994));
                        float2 _10007 = float2(_10003, _10006);
                        float _10010 = abs(_10003);
                        _10007.x = _10010;
                        float _10013 = in.i_shape.w * 0.5;
                        float _10015 = sin(_10013);
                        float _10017 = cos(_10013);
                        _17674 = (((_10017 * _10010) > (_10015 * _10006)) ? length(_10007 - (float2(_10015, _10017) * in.i_radii.x)) : abs(length(_10007) - in.i_radii.x)) - in.i_radii.y;
                        break;
                    } while(false);
                    _17676 = _17674;
                }
                else
                {
                    float _17677;
                    if (in.i_flags.z == 2u)
                    {
                        float2 _10053 = _7671 - _17431.xy;
                        float2 _10056 = _17431.zw - _17431.xy;
                        _17677 = length(_10053 - (_10056 * fast::clamp(dot(_10053, _10056) / fast::max(dot(_10056, _10056), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                    }
                    else
                    {
                        float2 _9783 = _7671 - _9732;
                        float _10109 = fast::min(_9741.x, _9741.y);
                        float _10112 = fast::min((_9783.x > 0.0) ? ((_9783.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_9783.y > 0.0) ? in.i_radii.w : in.i_radii.x), _10109);
                        float _10118 = _10112 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _17659;
                        float _17660;
                        if (_10118 > _10109)
                        {
                            float _10132 = in.i_shape.y * fast::clamp((_10109 - _10112) / fast::max(0.60000002384185791015625 * _10112, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _17660 = _10132;
                            _17659 = _10112 * (1.0 + (0.60000002384185791015625 * _10132));
                        }
                        else
                        {
                            _17660 = in.i_shape.y;
                            _17659 = _10118;
                        }
                        float2 _10145 = (abs(_9783) - _9741) + float2(_17659);
                        float2 _10147 = fast::max(_10145, float2(0.0));
                        float _17661;
                        if ((_10147.x > 0.0) && (_10147.y > 0.0))
                        {
                            float _17662;
                            if ((_17660 > 0.001000000047497451305389404296875) && (_17659 > 9.9999997473787516355514526367188e-05))
                            {
                                float _10164 = 2.0 + (2.0 * _17660);
                                float2 _10169 = _10147 / float2(fast::max(_17659, 9.9999997473787516355514526367188e-05));
                                _17662 = pow(pow(_10169.x, _10164) + pow(_10169.y, _10164), 1.0 / _10164) * _17659;
                            }
                            else
                            {
                                _17662 = length(_10147);
                            }
                            _17661 = _17662;
                        }
                        else
                        {
                            _17661 = fast::max(_10147.x, _10147.y);
                        }
                        float _10204 = (fast::min(fast::max(_10145.x, _10145.y), 0.0) + _17661) - _17659;
                        float _17678;
                        if ((in.i_flags.x & _1416) != 0u)
                        {
                            float2 _9811 = fast::max((_17431.zw - _17431.xy) * 0.5, float2(0.001000000047497451305389404296875));
                            float2 _9814 = _7671 - ((_17431.xy + _17431.zw) * 0.5);
                            float _10240 = fast::min(_9811.x, _9811.y);
                            float _10243 = fast::min((_9814.x > 0.0) ? ((_9814.y > 0.0) ? gFxData_1._data[_7145].x : gFxData_1._data[_7145].x) : ((_9814.y > 0.0) ? gFxData_1._data[_7145].x : gFxData_1._data[_7145].x), _10240);
                            float _10249 = _10243 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                            float _17665;
                            float _17666;
                            if (_10249 > _10240)
                            {
                                float _10263 = in.i_shape.y * fast::clamp((_10240 - _10243) / fast::max(0.60000002384185791015625 * _10243, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _17666 = _10263;
                                _17665 = _10243 * (1.0 + (0.60000002384185791015625 * _10263));
                            }
                            else
                            {
                                _17666 = in.i_shape.y;
                                _17665 = _10249;
                            }
                            float2 _10276 = (abs(_9814) - _9811) + float2(_17665);
                            float2 _10278 = fast::max(_10276, float2(0.0));
                            float _17667;
                            if ((_10278.x > 0.0) && (_10278.y > 0.0))
                            {
                                float _17668;
                                if ((_17666 > 0.001000000047497451305389404296875) && (_17665 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _10295 = 2.0 + (2.0 * _17666);
                                    float2 _10300 = _10278 / float2(fast::max(_17665, 9.9999997473787516355514526367188e-05));
                                    _17668 = pow(pow(_10300.x, _10295) + pow(_10300.y, _10295), 1.0 / _10295) * _17665;
                                }
                                else
                                {
                                    _17668 = length(_10278);
                                }
                                _17667 = _17668;
                            }
                            else
                            {
                                _17667 = fast::max(_10278.x, _10278.y);
                            }
                            float _10335 = (fast::min(fast::max(_10276.x, _10276.y), 0.0) + _17667) - _17665;
                            float _10340 = fast::max(gFxData_1._data[_7145].y, 9.9999997473787516355514526367188e-05);
                            float _10349 = fast::max(_10340 - abs(_10204 - _10335), 0.0) / _10340;
                            _17678 = fast::min(_10204, _10335) - (((_10349 * _10349) * _10340) * 0.25);
                        }
                        else
                        {
                            _17678 = _10204;
                        }
                        _17677 = _17678;
                    }
                    _17676 = _17677;
                }
                _17675 = _17676;
            }
            float2 _7677 = float2(_17615 - _17635, _17655 - _17675);
            float _7679 = length(_7677);
            float2 _7687 = select(float2(0.0, -1.0), _7677 / float2(_7679), bool2(_7679 > 9.9999997473787516355514526367188e-06));
            _18256 = fast::normalize(float3(_7687 * fast::min(_7245 / fast::max(_7251, 0.001000000047497451305389404296875), 8.0), 1.0));
            _17679 = _7687;
        }
        else
        {
            _18256 = float3(0.0, 0.0, 1.0);
            _17679 = float2(0.0, -1.0);
        }
        float2 _7277 = ((-_17679) * gFxData_1._data[_7121].y) * (1.0 - _7251);
        float2 _17680;
        if (gFxData_1._data[_7145].z > 0.0)
        {
            _17680 = (((in.i_rect.xy + in.i_rect.zw) * 0.5) - in.i_local) * (gFxData_1._data[_7145].z / (1.0 + gFxData_1._data[_7145].z));
        }
        else
        {
            _17680 = float2(0.0);
        }
        float2 _7303 = _17424 * _188.gTarget.zw;
        float2 _7310 = _188.gDisplay.zw * _188.gTarget.zw;
        float2 _7315 = (_7277 + _17680) * _7310;
        float2 _7318 = _7277 * _7310;
        float3 _18138;
        float _18156;
        float3 _18359;
        if (_188.gTime.z > 0.5)
        {
            float2 _7325 = _7303 + _7315;
            float _10374 = fast::clamp(log2(fast::max(_7217, 1.0)) - 1.0, 0.0, 5.0);
            int _10377 = int(floor(_10374));
            float _10381 = _10374 - float(_10377);
            bool _10386 = (_10381 > 0.0199999995529651641845703125) && (_10377 < 5);
            float3 _17751;
            _17751 = float3(0.0);
            float3 _10415;
            for (int _17681 = 0; _17681 < 2; _17751 = _10415, _17681++)
            {
                if ((_17681 > 0) && (!_10386))
                {
                    break;
                }
                int _10401 = _10377 + _17681;
                int _10439 = clamp(_10401, 1, 5);
                float2 _10508 = (_7325 * _188.gLevel[_10439].xy) - float2(0.5);
                float2 _10510 = floor(_10508);
                float2 _10513 = _10508 - _10510;
                float2 _10516 = _10513 * _10513;
                float2 _10519 = _10516 * _10513;
                float2 _10538 = (((_10519 * 3.0) - (_10516 * 6.0)) + float2(4.0)) * 0.16666667163372039794921875;
                float2 _10551 = _10519 * 0.16666667163372039794921875;
                float2 _10554 = (((((-_10519) + (_10516 * 3.0)) - (_10513 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _10538;
                float2 _10558 = (((((_10519 * (-3.0)) + (_10516 * 3.0)) + (_10513 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _10551;
                float2 _10570 = ((_10510 - float2(0.5)) + (_10538 / _10554)) * _188.gLevel[_10439].zw;
                float2 _10582 = ((_10510 + float2(1.5)) + (_10551 / _10558)) * _188.gLevel[_10439].zw;
                float4 _17718;
                if (_10401 <= 0)
                {
                    float2 _17717;
                    if (_188.gConv.x > 0.5)
                    {
                        float2 _16740 = _7325;
                        _16740.y = 1.0 - _7325.y;
                        _17717 = _16740;
                    }
                    else
                    {
                        _17717 = _7325;
                    }
                    _17718 = gBackdrop0.sample(gLinear, _17717, level(0.0));
                }
                else
                {
                    float4 _17719;
                    if (_10401 == 1)
                    {
                        float2 _17710;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _16745 = _10570;
                            _16745.y = 1.0 - _10570.y;
                            _17710 = _16745;
                        }
                        else
                        {
                            _17710 = _10570;
                        }
                        float2 _10628 = float2(_10582.x, _10570.y);
                        float2 _17711;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _16752 = _10628;
                            _16752.y = 1.0 - _10570.y;
                            _17711 = _16752;
                        }
                        else
                        {
                            _17711 = _10628;
                        }
                        float2 _10646 = float2(_10570.x, _10582.y);
                        float2 _17713;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _16759 = _10646;
                            _16759.y = 1.0 - _10582.y;
                            _17713 = _16759;
                        }
                        else
                        {
                            _17713 = _10646;
                        }
                        float2 _17715;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _16766 = _10582;
                            _16766.y = 1.0 - _10582.y;
                            _17715 = _16766;
                        }
                        else
                        {
                            _17715 = _10582;
                        }
                        _17719 = (((gBackdrop1.sample(gLinear, _17710, level(0.0)) * (_10554.x * _10554.y)) + (gBackdrop1.sample(gLinear, _17711, level(0.0)) * (_10558.x * _10554.y))) + (gBackdrop1.sample(gLinear, _17713, level(0.0)) * (_10554.x * _10558.y))) + (gBackdrop1.sample(gLinear, _17715, level(0.0)) * (_10558.x * _10558.y));
                    }
                    else
                    {
                        float4 _17720;
                        if (_10401 == 2)
                        {
                            float2 _17703;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _16773 = _10570;
                                _16773.y = 1.0 - _10570.y;
                                _17703 = _16773;
                            }
                            else
                            {
                                _17703 = _10570;
                            }
                            float2 _10758 = float2(_10582.x, _10570.y);
                            float2 _17704;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _16780 = _10758;
                                _16780.y = 1.0 - _10570.y;
                                _17704 = _16780;
                            }
                            else
                            {
                                _17704 = _10758;
                            }
                            float2 _10776 = float2(_10570.x, _10582.y);
                            float2 _17706;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _16787 = _10776;
                                _16787.y = 1.0 - _10582.y;
                                _17706 = _16787;
                            }
                            else
                            {
                                _17706 = _10776;
                            }
                            float2 _17708;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _16794 = _10582;
                                _16794.y = 1.0 - _10582.y;
                                _17708 = _16794;
                            }
                            else
                            {
                                _17708 = _10582;
                            }
                            _17720 = (((gBackdrop2.sample(gLinear, _17703, level(0.0)) * (_10554.x * _10554.y)) + (gBackdrop2.sample(gLinear, _17704, level(0.0)) * (_10558.x * _10554.y))) + (gBackdrop2.sample(gLinear, _17706, level(0.0)) * (_10554.x * _10558.y))) + (gBackdrop2.sample(gLinear, _17708, level(0.0)) * (_10558.x * _10558.y));
                        }
                        else
                        {
                            float4 _17721;
                            if (_10401 == 3)
                            {
                                float2 _17696;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _16801 = _10570;
                                    _16801.y = 1.0 - _10570.y;
                                    _17696 = _16801;
                                }
                                else
                                {
                                    _17696 = _10570;
                                }
                                float2 _10888 = float2(_10582.x, _10570.y);
                                float2 _17697;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _16808 = _10888;
                                    _16808.y = 1.0 - _10570.y;
                                    _17697 = _16808;
                                }
                                else
                                {
                                    _17697 = _10888;
                                }
                                float2 _10906 = float2(_10570.x, _10582.y);
                                float2 _17699;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _16815 = _10906;
                                    _16815.y = 1.0 - _10582.y;
                                    _17699 = _16815;
                                }
                                else
                                {
                                    _17699 = _10906;
                                }
                                float2 _17701;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _16822 = _10582;
                                    _16822.y = 1.0 - _10582.y;
                                    _17701 = _16822;
                                }
                                else
                                {
                                    _17701 = _10582;
                                }
                                _17721 = (((gBackdrop3.sample(gLinear, _17696, level(0.0)) * (_10554.x * _10554.y)) + (gBackdrop3.sample(gLinear, _17697, level(0.0)) * (_10558.x * _10554.y))) + (gBackdrop3.sample(gLinear, _17699, level(0.0)) * (_10554.x * _10558.y))) + (gBackdrop3.sample(gLinear, _17701, level(0.0)) * (_10558.x * _10558.y));
                            }
                            else
                            {
                                float4 _17722;
                                if (_10401 == 4)
                                {
                                    float2 _17689;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16829 = _10570;
                                        _16829.y = 1.0 - _10570.y;
                                        _17689 = _16829;
                                    }
                                    else
                                    {
                                        _17689 = _10570;
                                    }
                                    float2 _11018 = float2(_10582.x, _10570.y);
                                    float2 _17690;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16836 = _11018;
                                        _16836.y = 1.0 - _10570.y;
                                        _17690 = _16836;
                                    }
                                    else
                                    {
                                        _17690 = _11018;
                                    }
                                    float2 _11036 = float2(_10570.x, _10582.y);
                                    float2 _17692;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16843 = _11036;
                                        _16843.y = 1.0 - _10582.y;
                                        _17692 = _16843;
                                    }
                                    else
                                    {
                                        _17692 = _11036;
                                    }
                                    float2 _17694;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16850 = _10582;
                                        _16850.y = 1.0 - _10582.y;
                                        _17694 = _16850;
                                    }
                                    else
                                    {
                                        _17694 = _10582;
                                    }
                                    _17722 = (((gBackdrop4.sample(gLinear, _17689, level(0.0)) * (_10554.x * _10554.y)) + (gBackdrop4.sample(gLinear, _17690, level(0.0)) * (_10558.x * _10554.y))) + (gBackdrop4.sample(gLinear, _17692, level(0.0)) * (_10554.x * _10558.y))) + (gBackdrop4.sample(gLinear, _17694, level(0.0)) * (_10558.x * _10558.y));
                                }
                                else
                                {
                                    float2 _17682;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16857 = _10570;
                                        _16857.y = 1.0 - _10570.y;
                                        _17682 = _16857;
                                    }
                                    else
                                    {
                                        _17682 = _10570;
                                    }
                                    float2 _11148 = float2(_10582.x, _10570.y);
                                    float2 _17683;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16864 = _11148;
                                        _16864.y = 1.0 - _10570.y;
                                        _17683 = _16864;
                                    }
                                    else
                                    {
                                        _17683 = _11148;
                                    }
                                    float2 _11166 = float2(_10570.x, _10582.y);
                                    float2 _17685;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16871 = _11166;
                                        _16871.y = 1.0 - _10582.y;
                                        _17685 = _16871;
                                    }
                                    else
                                    {
                                        _17685 = _11166;
                                    }
                                    float2 _17687;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16878 = _10582;
                                        _16878.y = 1.0 - _10582.y;
                                        _17687 = _16878;
                                    }
                                    else
                                    {
                                        _17687 = _10582;
                                    }
                                    _17722 = (((gBackdrop5.sample(gLinear, _17682, level(0.0)) * (_10554.x * _10554.y)) + (gBackdrop5.sample(gLinear, _17683, level(0.0)) * (_10558.x * _10554.y))) + (gBackdrop5.sample(gLinear, _17685, level(0.0)) * (_10554.x * _10558.y))) + (gBackdrop5.sample(gLinear, _17687, level(0.0)) * (_10558.x * _10558.y));
                                }
                                _17721 = _17722;
                            }
                            _17720 = _17721;
                        }
                        _17719 = _17720;
                    }
                    _17718 = _17719;
                }
                _10415 = _17751 + (_17718.xyz * (_10386 ? ((_17681 == 0) ? (1.0 - _10381) : _10381) : 1.0));
            }
            float3 _18141;
            if (((gFxData_1._data[_7121].w > 0.001000000047497451305389404296875) && (_7245 > 0.0)) && ((((gFxData_1._data[_7121].y * 0.300000011920928955078125) * gFxData_1._data[_7121].w) * _188.gDisplay.z) > (_7217 * 0.3499999940395355224609375)))
            {
                float _7345 = 0.300000011920928955078125 * gFxData_1._data[_7121].w;
                float2 _7352 = (_7303 + _7315) - (_7318 * _7345);
                float _11262 = fast::clamp(log2(fast::max(_7217, 1.0)) - 1.0, 0.0, 5.0);
                int _11265 = int(floor(_11262));
                float _11269 = _11262 - float(_11265);
                bool _11274 = (_11269 > 0.0199999995529651641845703125) && (_11265 < 5);
                float3 _17847;
                _17847 = float3(0.0);
                float3 _11303;
                for (int _17777 = 0; _17777 < 2; _17847 = _11303, _17777++)
                {
                    if ((_17777 > 0) && (!_11274))
                    {
                        break;
                    }
                    int _11289 = _11265 + _17777;
                    int _11327 = clamp(_11289, 1, 5);
                    float2 _11396 = (_7352 * _188.gLevel[_11327].xy) - float2(0.5);
                    float2 _11398 = floor(_11396);
                    float2 _11401 = _11396 - _11398;
                    float2 _11404 = _11401 * _11401;
                    float2 _11407 = _11404 * _11401;
                    float2 _11426 = (((_11407 * 3.0) - (_11404 * 6.0)) + float2(4.0)) * 0.16666667163372039794921875;
                    float2 _11439 = _11407 * 0.16666667163372039794921875;
                    float2 _11442 = (((((-_11407) + (_11404 * 3.0)) - (_11401 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _11426;
                    float2 _11446 = (((((_11407 * (-3.0)) + (_11404 * 3.0)) + (_11401 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _11439;
                    float2 _11458 = ((_11398 - float2(0.5)) + (_11426 / _11442)) * _188.gLevel[_11327].zw;
                    float2 _11470 = ((_11398 + float2(1.5)) + (_11439 / _11446)) * _188.gLevel[_11327].zw;
                    float4 _17814;
                    if (_11289 <= 0)
                    {
                        float2 _17813;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _16883 = _7352;
                            _16883.y = 1.0 - _7352.y;
                            _17813 = _16883;
                        }
                        else
                        {
                            _17813 = _7352;
                        }
                        _17814 = gBackdrop0.sample(gLinear, _17813, level(0.0));
                    }
                    else
                    {
                        float4 _17815;
                        if (_11289 == 1)
                        {
                            float2 _17806;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _16888 = _11458;
                                _16888.y = 1.0 - _11458.y;
                                _17806 = _16888;
                            }
                            else
                            {
                                _17806 = _11458;
                            }
                            float _11515 = _11458.y;
                            float2 _11516 = float2(_11470.x, _11515);
                            float2 _17807;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _16895 = _11516;
                                _16895.y = 1.0 - _11515;
                                _17807 = _16895;
                            }
                            else
                            {
                                _17807 = _11516;
                            }
                            float _11533 = _11470.y;
                            float2 _11534 = float2(_11458.x, _11533);
                            float2 _17809;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _16902 = _11534;
                                _16902.y = 1.0 - _11533;
                                _17809 = _16902;
                            }
                            else
                            {
                                _17809 = _11534;
                            }
                            float2 _17811;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _16909 = _11470;
                                _16909.y = 1.0 - _11470.y;
                                _17811 = _16909;
                            }
                            else
                            {
                                _17811 = _11470;
                            }
                            _17815 = (((gBackdrop1.sample(gLinear, _17806, level(0.0)) * (_11442.x * _11442.y)) + (gBackdrop1.sample(gLinear, _17807, level(0.0)) * (_11446.x * _11442.y))) + (gBackdrop1.sample(gLinear, _17809, level(0.0)) * (_11442.x * _11446.y))) + (gBackdrop1.sample(gLinear, _17811, level(0.0)) * (_11446.x * _11446.y));
                        }
                        else
                        {
                            float4 _17816;
                            if (_11289 == 2)
                            {
                                float2 _17799;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _16916 = _11458;
                                    _16916.y = 1.0 - _11458.y;
                                    _17799 = _16916;
                                }
                                else
                                {
                                    _17799 = _11458;
                                }
                                float _11645 = _11458.y;
                                float2 _11646 = float2(_11470.x, _11645);
                                float2 _17800;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _16923 = _11646;
                                    _16923.y = 1.0 - _11645;
                                    _17800 = _16923;
                                }
                                else
                                {
                                    _17800 = _11646;
                                }
                                float _11663 = _11470.y;
                                float2 _11664 = float2(_11458.x, _11663);
                                float2 _17802;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _16930 = _11664;
                                    _16930.y = 1.0 - _11663;
                                    _17802 = _16930;
                                }
                                else
                                {
                                    _17802 = _11664;
                                }
                                float2 _17804;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _16937 = _11470;
                                    _16937.y = 1.0 - _11470.y;
                                    _17804 = _16937;
                                }
                                else
                                {
                                    _17804 = _11470;
                                }
                                _17816 = (((gBackdrop2.sample(gLinear, _17799, level(0.0)) * (_11442.x * _11442.y)) + (gBackdrop2.sample(gLinear, _17800, level(0.0)) * (_11446.x * _11442.y))) + (gBackdrop2.sample(gLinear, _17802, level(0.0)) * (_11442.x * _11446.y))) + (gBackdrop2.sample(gLinear, _17804, level(0.0)) * (_11446.x * _11446.y));
                            }
                            else
                            {
                                float4 _17817;
                                if (_11289 == 3)
                                {
                                    float2 _17792;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16944 = _11458;
                                        _16944.y = 1.0 - _11458.y;
                                        _17792 = _16944;
                                    }
                                    else
                                    {
                                        _17792 = _11458;
                                    }
                                    float _11775 = _11458.y;
                                    float2 _11776 = float2(_11470.x, _11775);
                                    float2 _17793;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16951 = _11776;
                                        _16951.y = 1.0 - _11775;
                                        _17793 = _16951;
                                    }
                                    else
                                    {
                                        _17793 = _11776;
                                    }
                                    float _11793 = _11470.y;
                                    float2 _11794 = float2(_11458.x, _11793);
                                    float2 _17795;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16958 = _11794;
                                        _16958.y = 1.0 - _11793;
                                        _17795 = _16958;
                                    }
                                    else
                                    {
                                        _17795 = _11794;
                                    }
                                    float2 _17797;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _16965 = _11470;
                                        _16965.y = 1.0 - _11470.y;
                                        _17797 = _16965;
                                    }
                                    else
                                    {
                                        _17797 = _11470;
                                    }
                                    _17817 = (((gBackdrop3.sample(gLinear, _17792, level(0.0)) * (_11442.x * _11442.y)) + (gBackdrop3.sample(gLinear, _17793, level(0.0)) * (_11446.x * _11442.y))) + (gBackdrop3.sample(gLinear, _17795, level(0.0)) * (_11442.x * _11446.y))) + (gBackdrop3.sample(gLinear, _17797, level(0.0)) * (_11446.x * _11446.y));
                                }
                                else
                                {
                                    float4 _17818;
                                    if (_11289 == 4)
                                    {
                                        float2 _17785;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _16972 = _11458;
                                            _16972.y = 1.0 - _11458.y;
                                            _17785 = _16972;
                                        }
                                        else
                                        {
                                            _17785 = _11458;
                                        }
                                        float _11905 = _11458.y;
                                        float2 _11906 = float2(_11470.x, _11905);
                                        float2 _17786;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _16979 = _11906;
                                            _16979.y = 1.0 - _11905;
                                            _17786 = _16979;
                                        }
                                        else
                                        {
                                            _17786 = _11906;
                                        }
                                        float _11923 = _11470.y;
                                        float2 _11924 = float2(_11458.x, _11923);
                                        float2 _17788;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _16986 = _11924;
                                            _16986.y = 1.0 - _11923;
                                            _17788 = _16986;
                                        }
                                        else
                                        {
                                            _17788 = _11924;
                                        }
                                        float2 _17790;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _16993 = _11470;
                                            _16993.y = 1.0 - _11470.y;
                                            _17790 = _16993;
                                        }
                                        else
                                        {
                                            _17790 = _11470;
                                        }
                                        _17818 = (((gBackdrop4.sample(gLinear, _17785, level(0.0)) * (_11442.x * _11442.y)) + (gBackdrop4.sample(gLinear, _17786, level(0.0)) * (_11446.x * _11442.y))) + (gBackdrop4.sample(gLinear, _17788, level(0.0)) * (_11442.x * _11446.y))) + (gBackdrop4.sample(gLinear, _17790, level(0.0)) * (_11446.x * _11446.y));
                                    }
                                    else
                                    {
                                        float2 _17778;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17000 = _11458;
                                            _17000.y = 1.0 - _11458.y;
                                            _17778 = _17000;
                                        }
                                        else
                                        {
                                            _17778 = _11458;
                                        }
                                        float _12035 = _11458.y;
                                        float2 _12036 = float2(_11470.x, _12035);
                                        float2 _17779;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17007 = _12036;
                                            _17007.y = 1.0 - _12035;
                                            _17779 = _17007;
                                        }
                                        else
                                        {
                                            _17779 = _12036;
                                        }
                                        float _12053 = _11470.y;
                                        float2 _12054 = float2(_11458.x, _12053);
                                        float2 _17781;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17014 = _12054;
                                            _17014.y = 1.0 - _12053;
                                            _17781 = _17014;
                                        }
                                        else
                                        {
                                            _17781 = _12054;
                                        }
                                        float2 _17783;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17021 = _11470;
                                            _17021.y = 1.0 - _11470.y;
                                            _17783 = _17021;
                                        }
                                        else
                                        {
                                            _17783 = _11470;
                                        }
                                        _17818 = (((gBackdrop5.sample(gLinear, _17778, level(0.0)) * (_11442.x * _11442.y)) + (gBackdrop5.sample(gLinear, _17779, level(0.0)) * (_11446.x * _11442.y))) + (gBackdrop5.sample(gLinear, _17781, level(0.0)) * (_11442.x * _11446.y))) + (gBackdrop5.sample(gLinear, _17783, level(0.0)) * (_11446.x * _11446.y));
                                    }
                                    _17817 = _17818;
                                }
                                _17816 = _17817;
                            }
                            _17815 = _17816;
                        }
                        _17814 = _17815;
                    }
                    _11303 = _17847 + (_17814.xyz * (_11274 ? ((_17777 == 0) ? (1.0 - _11269) : _11269) : 1.0));
                }
                float3 _17025 = _17751;
                _17025.x = _17847.x;
                float2 _7363 = (_7303 + _7315) + (_7318 * _7345);
                float _12150 = fast::clamp(log2(fast::max(_7217, 1.0)) - 1.0, 0.0, 5.0);
                int _12153 = int(floor(_12150));
                float _12157 = _12150 - float(_12153);
                bool _12162 = (_12157 > 0.0199999995529651641845703125) && (_12153 < 5);
                float3 _17971;
                _17971 = float3(0.0);
                float3 _12191;
                for (int _17901 = 0; _17901 < 2; _17971 = _12191, _17901++)
                {
                    if ((_17901 > 0) && (!_12162))
                    {
                        break;
                    }
                    int _12177 = _12153 + _17901;
                    int _12215 = clamp(_12177, 1, 5);
                    float2 _12284 = (_7363 * _188.gLevel[_12215].xy) - float2(0.5);
                    float2 _12286 = floor(_12284);
                    float2 _12289 = _12284 - _12286;
                    float2 _12292 = _12289 * _12289;
                    float2 _12295 = _12292 * _12289;
                    float2 _12314 = (((_12295 * 3.0) - (_12292 * 6.0)) + float2(4.0)) * 0.16666667163372039794921875;
                    float2 _12327 = _12295 * 0.16666667163372039794921875;
                    float2 _12330 = (((((-_12295) + (_12292 * 3.0)) - (_12289 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _12314;
                    float2 _12334 = (((((_12295 * (-3.0)) + (_12292 * 3.0)) + (_12289 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _12327;
                    float2 _12346 = ((_12286 - float2(0.5)) + (_12314 / _12330)) * _188.gLevel[_12215].zw;
                    float2 _12358 = ((_12286 + float2(1.5)) + (_12327 / _12334)) * _188.gLevel[_12215].zw;
                    float4 _17938;
                    if (_12177 <= 0)
                    {
                        float2 _17937;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _17028 = _7363;
                            _17028.y = 1.0 - _7363.y;
                            _17937 = _17028;
                        }
                        else
                        {
                            _17937 = _7363;
                        }
                        _17938 = gBackdrop0.sample(gLinear, _17937, level(0.0));
                    }
                    else
                    {
                        float4 _17939;
                        if (_12177 == 1)
                        {
                            float2 _17930;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _17033 = _12346;
                                _17033.y = 1.0 - _12346.y;
                                _17930 = _17033;
                            }
                            else
                            {
                                _17930 = _12346;
                            }
                            float _12403 = _12346.y;
                            float2 _12404 = float2(_12358.x, _12403);
                            float2 _17931;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _17040 = _12404;
                                _17040.y = 1.0 - _12403;
                                _17931 = _17040;
                            }
                            else
                            {
                                _17931 = _12404;
                            }
                            float _12421 = _12358.y;
                            float2 _12422 = float2(_12346.x, _12421);
                            float2 _17933;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _17047 = _12422;
                                _17047.y = 1.0 - _12421;
                                _17933 = _17047;
                            }
                            else
                            {
                                _17933 = _12422;
                            }
                            float2 _17935;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _17054 = _12358;
                                _17054.y = 1.0 - _12358.y;
                                _17935 = _17054;
                            }
                            else
                            {
                                _17935 = _12358;
                            }
                            _17939 = (((gBackdrop1.sample(gLinear, _17930, level(0.0)) * (_12330.x * _12330.y)) + (gBackdrop1.sample(gLinear, _17931, level(0.0)) * (_12334.x * _12330.y))) + (gBackdrop1.sample(gLinear, _17933, level(0.0)) * (_12330.x * _12334.y))) + (gBackdrop1.sample(gLinear, _17935, level(0.0)) * (_12334.x * _12334.y));
                        }
                        else
                        {
                            float4 _17940;
                            if (_12177 == 2)
                            {
                                float2 _17923;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17061 = _12346;
                                    _17061.y = 1.0 - _12346.y;
                                    _17923 = _17061;
                                }
                                else
                                {
                                    _17923 = _12346;
                                }
                                float _12533 = _12346.y;
                                float2 _12534 = float2(_12358.x, _12533);
                                float2 _17924;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17068 = _12534;
                                    _17068.y = 1.0 - _12533;
                                    _17924 = _17068;
                                }
                                else
                                {
                                    _17924 = _12534;
                                }
                                float _12551 = _12358.y;
                                float2 _12552 = float2(_12346.x, _12551);
                                float2 _17926;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17075 = _12552;
                                    _17075.y = 1.0 - _12551;
                                    _17926 = _17075;
                                }
                                else
                                {
                                    _17926 = _12552;
                                }
                                float2 _17928;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17082 = _12358;
                                    _17082.y = 1.0 - _12358.y;
                                    _17928 = _17082;
                                }
                                else
                                {
                                    _17928 = _12358;
                                }
                                _17940 = (((gBackdrop2.sample(gLinear, _17923, level(0.0)) * (_12330.x * _12330.y)) + (gBackdrop2.sample(gLinear, _17924, level(0.0)) * (_12334.x * _12330.y))) + (gBackdrop2.sample(gLinear, _17926, level(0.0)) * (_12330.x * _12334.y))) + (gBackdrop2.sample(gLinear, _17928, level(0.0)) * (_12334.x * _12334.y));
                            }
                            else
                            {
                                float4 _17941;
                                if (_12177 == 3)
                                {
                                    float2 _17916;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _17089 = _12346;
                                        _17089.y = 1.0 - _12346.y;
                                        _17916 = _17089;
                                    }
                                    else
                                    {
                                        _17916 = _12346;
                                    }
                                    float _12663 = _12346.y;
                                    float2 _12664 = float2(_12358.x, _12663);
                                    float2 _17917;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _17096 = _12664;
                                        _17096.y = 1.0 - _12663;
                                        _17917 = _17096;
                                    }
                                    else
                                    {
                                        _17917 = _12664;
                                    }
                                    float _12681 = _12358.y;
                                    float2 _12682 = float2(_12346.x, _12681);
                                    float2 _17919;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _17103 = _12682;
                                        _17103.y = 1.0 - _12681;
                                        _17919 = _17103;
                                    }
                                    else
                                    {
                                        _17919 = _12682;
                                    }
                                    float2 _17921;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _17110 = _12358;
                                        _17110.y = 1.0 - _12358.y;
                                        _17921 = _17110;
                                    }
                                    else
                                    {
                                        _17921 = _12358;
                                    }
                                    _17941 = (((gBackdrop3.sample(gLinear, _17916, level(0.0)) * (_12330.x * _12330.y)) + (gBackdrop3.sample(gLinear, _17917, level(0.0)) * (_12334.x * _12330.y))) + (gBackdrop3.sample(gLinear, _17919, level(0.0)) * (_12330.x * _12334.y))) + (gBackdrop3.sample(gLinear, _17921, level(0.0)) * (_12334.x * _12334.y));
                                }
                                else
                                {
                                    float4 _17942;
                                    if (_12177 == 4)
                                    {
                                        float2 _17909;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17117 = _12346;
                                            _17117.y = 1.0 - _12346.y;
                                            _17909 = _17117;
                                        }
                                        else
                                        {
                                            _17909 = _12346;
                                        }
                                        float _12793 = _12346.y;
                                        float2 _12794 = float2(_12358.x, _12793);
                                        float2 _17910;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17124 = _12794;
                                            _17124.y = 1.0 - _12793;
                                            _17910 = _17124;
                                        }
                                        else
                                        {
                                            _17910 = _12794;
                                        }
                                        float _12811 = _12358.y;
                                        float2 _12812 = float2(_12346.x, _12811);
                                        float2 _17912;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17131 = _12812;
                                            _17131.y = 1.0 - _12811;
                                            _17912 = _17131;
                                        }
                                        else
                                        {
                                            _17912 = _12812;
                                        }
                                        float2 _17914;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17138 = _12358;
                                            _17138.y = 1.0 - _12358.y;
                                            _17914 = _17138;
                                        }
                                        else
                                        {
                                            _17914 = _12358;
                                        }
                                        _17942 = (((gBackdrop4.sample(gLinear, _17909, level(0.0)) * (_12330.x * _12330.y)) + (gBackdrop4.sample(gLinear, _17910, level(0.0)) * (_12334.x * _12330.y))) + (gBackdrop4.sample(gLinear, _17912, level(0.0)) * (_12330.x * _12334.y))) + (gBackdrop4.sample(gLinear, _17914, level(0.0)) * (_12334.x * _12334.y));
                                    }
                                    else
                                    {
                                        float2 _17902;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17145 = _12346;
                                            _17145.y = 1.0 - _12346.y;
                                            _17902 = _17145;
                                        }
                                        else
                                        {
                                            _17902 = _12346;
                                        }
                                        float _12923 = _12346.y;
                                        float2 _12924 = float2(_12358.x, _12923);
                                        float2 _17903;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17152 = _12924;
                                            _17152.y = 1.0 - _12923;
                                            _17903 = _17152;
                                        }
                                        else
                                        {
                                            _17903 = _12924;
                                        }
                                        float _12941 = _12358.y;
                                        float2 _12942 = float2(_12346.x, _12941);
                                        float2 _17905;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17159 = _12942;
                                            _17159.y = 1.0 - _12941;
                                            _17905 = _17159;
                                        }
                                        else
                                        {
                                            _17905 = _12942;
                                        }
                                        float2 _17907;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _17166 = _12358;
                                            _17166.y = 1.0 - _12358.y;
                                            _17907 = _17166;
                                        }
                                        else
                                        {
                                            _17907 = _12358;
                                        }
                                        _17942 = (((gBackdrop5.sample(gLinear, _17902, level(0.0)) * (_12330.x * _12330.y)) + (gBackdrop5.sample(gLinear, _17903, level(0.0)) * (_12334.x * _12330.y))) + (gBackdrop5.sample(gLinear, _17905, level(0.0)) * (_12330.x * _12334.y))) + (gBackdrop5.sample(gLinear, _17907, level(0.0)) * (_12334.x * _12334.y));
                                    }
                                    _17941 = _17942;
                                }
                                _17940 = _17941;
                            }
                            _17939 = _17940;
                        }
                        _17938 = _17939;
                    }
                    _12191 = _17971 + (_17938.xyz * (_12162 ? ((_17901 == 0) ? (1.0 - _12157) : _12157) : 1.0));
                }
                _17025.z = _17971.z;
                _18141 = _17025;
            }
            else
            {
                _18141 = _17751;
            }
            float3 _18361;
            if (_7245 > 0.0)
            {
                float2 _7386 = _7303 + (((_17679 * fast::min(_7236 * 0.5, 16.0)) * _188.gDisplay.zw) * _188.gTarget.zw);
                float _13038 = fast::clamp(log2(fast::max(16.0 * _188.gDisplay.z, 1.0)) - 1.0, 0.0, 5.0);
                int _13041 = int(floor(_13038));
                float _13045 = _13038 - float(_13041);
                bool _13050 = (_13045 > 0.0199999995529651641845703125) && (_13041 < 5);
                float3 _18126;
                _18126 = float3(0.0);
                float3 _13079;
                for (int _18111 = 0; _18111 < 2; _18126 = _13079, _18111++)
                {
                    if ((_18111 > 0) && (!_13050))
                    {
                        break;
                    }
                    int _13065 = _13041 + _18111;
                    float2 _18112;
                    if (_188.gConv.x > 0.5)
                    {
                        float2 _17173 = _7386;
                        _17173.y = 1.0 - _7386.y;
                        _18112 = _17173;
                    }
                    else
                    {
                        _18112 = _7386;
                    }
                    float4 _18113;
                    if (_13065 <= 0)
                    {
                        _18113 = gBackdrop0.sample(gLinear, _18112, level(0.0));
                    }
                    else
                    {
                        float4 _18114;
                        if (_13065 == 1)
                        {
                            _18114 = gBackdrop1.sample(gLinear, _18112, level(0.0));
                        }
                        else
                        {
                            float4 _18115;
                            if (_13065 == 2)
                            {
                                _18115 = gBackdrop2.sample(gLinear, _18112, level(0.0));
                            }
                            else
                            {
                                float4 _18116;
                                if (_13065 == 3)
                                {
                                    _18116 = gBackdrop3.sample(gLinear, _18112, level(0.0));
                                }
                                else
                                {
                                    float4 _18117;
                                    if (_13065 == 4)
                                    {
                                        _18117 = gBackdrop4.sample(gLinear, _18112, level(0.0));
                                    }
                                    else
                                    {
                                        _18117 = gBackdrop5.sample(gLinear, _18112, level(0.0));
                                    }
                                    _18116 = _18117;
                                }
                                _18115 = _18116;
                            }
                            _18114 = _18115;
                        }
                        _18113 = _18114;
                    }
                    _13079 = _18126 + (_18113.xyz * (_13050 ? ((_18111 == 0) ? (1.0 - _13045) : _13045) : 1.0));
                }
                _18361 = _18126;
            }
            else
            {
                _18361 = float3(0.5);
            }
            float _18157;
            if (in.i_shape.x > 0.001000000047497451305389404296875)
            {
                int _13168 = clamp(int(rint(log2(36.0 * _188.gDisplay.z) - 1.0)), 1, 4);
                float2 _18132;
                if (_188.gConv.x > 0.5)
                {
                    float2 _17177 = _7303;
                    _17177.y = 1.0 - _7303.y;
                    _18132 = _17177;
                }
                else
                {
                    _18132 = _7303;
                }
                float4 _18133;
                if (_13168 <= 0)
                {
                    _18133 = gBackdrop0.sample(gLinear, _18132, level(0.0));
                }
                else
                {
                    float4 _18134;
                    if (_13168 == 1)
                    {
                        _18134 = gBackdrop1.sample(gLinear, _18132, level(0.0));
                    }
                    else
                    {
                        float4 _18135;
                        if (_13168 == 2)
                        {
                            _18135 = gBackdrop2.sample(gLinear, _18132, level(0.0));
                        }
                        else
                        {
                            float4 _18136;
                            if (_13168 == 3)
                            {
                                _18136 = gBackdrop3.sample(gLinear, _18132, level(0.0));
                            }
                            else
                            {
                                float4 _18137;
                                if (_13168 == 4)
                                {
                                    _18137 = gBackdrop4.sample(gLinear, _18132, level(0.0));
                                }
                                else
                                {
                                    _18137 = gBackdrop5.sample(gLinear, _18132, level(0.0));
                                }
                                _18136 = _18137;
                            }
                            _18135 = _18136;
                        }
                        _18134 = _18135;
                    }
                    _18133 = _18134;
                }
                _18157 = dot(_18133.xyz, float3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            }
            else
            {
                _18157 = 0.5;
            }
            _18359 = _18361;
            _18156 = _18157;
            _18138 = _18141;
        }
        else
        {
            _18359 = float3(0.5);
            _18156 = 0.5;
            _18138 = float3(0.5);
        }
        float3 _7414 = mix(float3(dot(_18138, float3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))), _18138, float3(gFxData_1._data[_7137].x)) + float3(gFxData_1._data[_7137].y);
        float3 _18252;
        if (in.i_shape.x > 0.001000000047497451305389404296875)
        {
            float _7424 = fast::clamp(fast::max(_18156 + gFxData_1._data[_7137].y, 0.001000000047497451305389404296875), 0.0, 1.0);
            float _7432 = mix(_7424, dot(gFxData_1._data[_7129].xyz, float3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), in.i_shape.x);
            _18252 = select(mix(_7414, float3(1.0), float3((_7432 - _7424) / fast::max(1.0 - _7424, 0.001000000047497451305389404296875))), _7414 * (_7432 / _7424), bool3(_7432 < _7424));
        }
        else
        {
            _18252 = _7414;
        }
        float2 _7470 = fast::clamp((in.i_local - in.i_rect.xy) / fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875)), float2(0.0), float2(1.0));
        float2 _7518 = float2(cos(gFxData_1._data[_7137].w), sin(gFxData_1._data[_7137].w));
        float _7521 = dot(_17679, _7518);
        float _7532 = -_17450;
        float _7539 = _4252 * ((0.5 * abs(_17679.x)) + 0.0199999995529651641845703125);
        float _7546 = _4252 * ((0.5 * abs(_17679.y)) + 0.0199999995529651641845703125);
        float _18471;
        if ((((_7532 + _7539) + _7546) > 0.0) && (((_7532 - _7539) - _7546) < (0.5 * _7236)))
        {
            float _13272 = fast::max((_7532 + _7539) + _7546, 0.0) / _7236;
            float _13276 = fast::clamp(sqrt(2.0 * _13272), 0.12399999797344207763671875, 1.0);
            float _13278 = 1.0 - _13276;
            float _13281 = _13278 * _13278;
            float _13335 = fast::max((_7532 + _7539) - _7546, 0.0) / _7236;
            float _13339 = fast::clamp(sqrt(2.0 * _13335), 0.12399999797344207763671875, 1.0);
            float _13341 = 1.0 - _13339;
            float _13344 = _13341 * _13341;
            float _13398 = fast::max((_7532 - _7539) + _7546, 0.0) / _7236;
            float _13402 = fast::clamp(sqrt(2.0 * _13398), 0.12399999797344207763671875, 1.0);
            float _13404 = 1.0 - _13402;
            float _13407 = _13404 * _13404;
            float _13461 = fast::max((_7532 - _7539) - _7546, 0.0) / _7236;
            float _13465 = fast::clamp(sqrt(2.0 * _13461), 0.12399999797344207763671875, 1.0);
            float _13467 = 1.0 - _13465;
            float _13470 = _13467 * _13467;
            float _7593 = ((((((_13272 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _13272) * _13272) : ((_13272 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _13276) * _13276)) + ((((_13281 * _13281) * _13281) * _13278) * (0.02380952425301074981689453125 + (_13278 * ((-0.0386904776096343994140625) + (_13278 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_13272 - 0.5))))) * _7236) * _7236) - ((((_13335 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _13335) * _13335) : ((_13335 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _13339) * _13339)) + ((((_13344 * _13344) * _13344) * _13341) * (0.02380952425301074981689453125 + (_13341 * ((-0.0386904776096343994140625) + (_13341 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_13335 - 0.5))))) * _7236) * _7236)) - ((((_13398 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _13398) * _13398) : ((_13398 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _13402) * _13402)) + ((((_13407 * _13407) * _13407) * _13404) * (0.02380952425301074981689453125 + (_13404 * ((-0.0386904776096343994140625) + (_13404 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_13398 - 0.5))))) * _7236) * _7236)) + ((((_13461 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _13461) * _13461) : ((_13461 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _13465) * _13465)) + ((((_13470 * _13470) * _13470) * _13467) * (0.02380952425301074981689453125 + (_13467 * ((-0.0386904776096343994140625) + (_13467 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_13461 - 0.5))))) * _7236) * _7236);
            _18471 = _7593 / ((4.0 * _7539) * _7546);
        }
        else
        {
            _18471 = 0.0;
        }
        float _7625 = fast::clamp(0.5 + (0.5 * dot((in.i_local - ((in.i_rect.xy + in.i_rect.zw) * 0.5)) / _7228, _7518)), 0.0, 1.0);
        _19575 = ((_18471 * (pow(fast::clamp(_7521, 0.0, 1.0), 1.5) + (0.4000000059604644775390625 * pow(fast::clamp(-_7521, 0.0, 1.0), 1.5)))) * gFxData_1._data[_7137].z) * 1.60000002384185791015625;
        _19181 = gFxData_1._data[_7145];
        _19007 = float4((mix(mix(_18252, gFxData_1._data[_7129].xyz, float3(fast::clamp(gFxData_1._data[_7129].w * ((0.7200000286102294921875 + (0.550000011920928955078125 * (1.0 - _7251))) + (0.3499999940395355224609375 * ((dot(gFxData_1._data[_7129].xyz, float3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) > 0.5) ? (1.0 - _7470.y) : _7470.y))), 0.0, 1.0))), (_18359 * 1.10000002384185791015625) + float3(0.07999999821186065673828125), float3(pow(1.0 - _18256.z, 5.0) * 0.3499999940395355224609375)) + float3((((0.039999999105930328369140625 * _7625) * _7625) + (0.0500000007450580596923828125 * (1.0 - _7251))) * gFxData_1._data[_7137].z)) * _4290, _4290) + (_18478 * (1.0 - _4290));
    }
    else
    {
        _19575 = 0.0;
        _19181 = _17429;
        _19007 = _18478;
    }
    float4 _19017;
    float4 _19019;
    if ((in.i_flags.x & _3025) != 0u)
    {
        float4 _18624;
        float4 _18809;
        if (in.i_flags.y != 0u)
        {
            _18809 = gFxData_1._data[(in.i_instance * 24u) + 3u];
            _18624 = gFxData_1._data[(in.i_instance * 24u) + 4u];
        }
        else
        {
            _18809 = float4(0.0);
            _18624 = float4(0.0);
        }
        float4 _19002;
        do
        {
            if (in.i_flags.y == 0u)
            {
                _19002 = in.i_fill0;
                break;
            }
            float2 _13574 = fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875));
            float2 _13584 = fwidth(in.i_local);
            float _13586 = fast::max(length(_13584), 9.9999997473787516355514526367188e-05);
            float _18994;
            float _18998;
            if ((in.i_flags.y == 1u) || (in.i_flags.y == 4u))
            {
                float _13595 = cos(_18624.x);
                float _13598 = sin(_18624.x);
                float _13624 = ((dot(in.i_local - ((in.i_rect.xy + in.i_rect.zw) * 0.5), float2(_13595, _13598)) / fast::max(0.5 * ((abs(_13595) * _13574.x) + (abs(_13598) * _13574.y)), 0.001000000047497451305389404296875)) * 0.5) + 0.5;
                if (in.i_flags.y == 4u)
                {
                    float _13639 = fast::clamp((_13624 - _18624.y) / fast::max(_18624.z - _18624.y, 0.001000000047497451305389404296875), 0.0, 1.0);
                    _19002 = float4(fast::clamp(abs((fract(float3(_13639 * 0.800000011920928955078125) + float3(1.0, 0.66670000553131103515625, 0.33329999446868896484375)) * 6.0) - float3(3.0)) - float3(1.0), float3(0.0), float3(1.0)), in.i_fill0.w * pow(fast::max(sin(_13639 * 3.1415927410125732421875), 0.0), 0.60000002384185791015625));
                    break;
                }
                _18998 = -1.0;
                _18994 = _13624;
            }
            else
            {
                float _18995;
                float _18999;
                if (in.i_flags.y == 2u)
                {
                    _18999 = -1.0;
                    _18995 = length(in.i_local - (in.i_rect.xy + (_18624.xy * _13574))) / fast::max(_18624.z * fast::max(_13574.x, _13574.y), 0.001000000047497451305389404296875);
                }
                else
                {
                    float2 _13707 = in.i_local - (in.i_rect.xy + (_18624.xy * _13574));
                    float _13718 = fract(((precise::atan2(_13707.y, _13707.x) - _18624.z) * 0.15915493667125701904296875) + 1.0);
                    float _18996;
                    float _19000;
                    if (_18624.w > 0.5)
                    {
                        _19000 = -1.0;
                        _18996 = 0.5 - (0.5 * cos(_13718 * 6.283185482025146484375));
                    }
                    else
                    {
                        float _13738 = (((_13718 < 0.5) ? _13718 : (_13718 - 1.0)) * 6.283185482025146484375) * length(_13707);
                        float _19001;
                        if (abs(_13738) < _13586)
                        {
                            _19001 = fast::clamp(((_13738 / _13586) * 0.5) + 0.5, 0.0, 1.0);
                        }
                        else
                        {
                            _19001 = -1.0;
                        }
                        _19000 = _19001;
                        _18996 = _13718;
                    }
                    _18999 = _19000;
                    _18995 = _18996;
                }
                _18998 = _18999;
                _18994 = _18995;
            }
            float4 _13767 = float4(in.i_fill0.xyz * in.i_fill0.w, in.i_fill0.w);
            float4 _13779 = float4(_18809.xyz * _18809.w, _18809.w);
            float4 _13793 = select(mix(_13767, _13779, float4(fast::clamp(_18994, 0.0, 1.0))), mix(_13779, _13767, float4(_18998)), bool4(_18998 >= 0.0));
            _19002 = select(float4(0.0), float4(_13793.xyz / float3(_13793.w), _13793.w), bool4(_13793.w > 9.9999997473787516355514526367188e-06));
            break;
        } while(false);
        float4 _19003;
        float4 _19171;
        if ((in.i_flags.x & _3054) != 0u)
        {
            uint _13818 = (in.i_instance * 24u) + 18u;
            _19171 = gFxData_1._data[_13818];
            _19003 = _19002 * gTex.sample(gLinear, mix(gFxData_1._data[_13818].xy, gFxData_1._data[_13818].zw, (in.i_local - in.i_rect.xy) / fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875))));
        }
        else
        {
            _19171 = _17425;
            _19003 = _19002;
        }
        float _13828 = fast::clamp(_19003.w * _4290, 0.0, 1.0);
        _19019 = _19171;
        _19017 = float4(_19003.xyz * _13828, _13828) + (_19007 * (1.0 - _13828));
    }
    else
    {
        _19019 = _17425;
        _19017 = _19007;
    }
    float4 _19559;
    if ((in.i_flags.x & _3107) != 0u)
    {
        uint _13852 = (in.i_instance * 24u) + 21u;
        uint _13860 = (in.i_instance * 24u) + 3u;
        float2 _4730 = fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875));
        float2 _4737 = (in.i_local - in.i_rect.xy) / _4730;
        float _4748 = ((gFxData_1._data[_13860].x >= 0.0) ? gFxData_1._data[_13860].x : _188.gTime.x) * gFxData_1._data[_13852].z;
        float _4751 = _4737.x * 2.0;
        float _4752 = _4751 - 1.0;
        float _4757 = _4737.y * _4730.y;
        float _4760 = fast::max(gFxData_1._data[_13852].w, 0.001000000047497451305389404296875);
        float _4765 = fast::clamp(1.0 - (_4752 * _4752), 0.0, 1.0);
        float _4767 = pow(_4765, 1.2999999523162841796875);
        float _4769 = pow(_4765, 0.699999988079071044921875);
        float _4772 = fast::clamp(_4748 * 1.4285714626312255859375, 0.0, 1.0);
        float _4788 = (0.25 + (0.75 * ((_4772 * _4772) * (3.0 - (2.0 * _4772))))) * (0.85000002384185791015625 + (0.1500000059604644775390625 * sin(_4748 * 2.099999904632568359375)));
        float _4797 = ((gFxData_1._data[_13852].y * _4730.y) * _4788) * _4767;
        float _4823 = (_4730.y * (0.5 + ((gFxData_1._data[_13852].x * (0.5 - (_4752 * _4752))) * 0.5))) + (((0.14000000059604644775390625 * _4730.y) * _4767) * sin(((_4752 * 2.400000095367431640625) - (_4748 * 1.2000000476837158203125)) + 0.60000002384185791015625));
        float _19013;
        float _19014;
        float3 _19015;
        _19015 = float3(0.0);
        _19014 = _4823;
        _19013 = _4823;
        float3 _4895;
        float _19833;
        float _19834;
        for (int _19012 = 0; _19012 < 4; _19015 = _4895, _19014 = _19834, _19013 = _19833, _19012++)
        {
            float _4847 = _4823 + ((_4797 * _3271[_19012].x) * (0.800000011920928955078125 + (0.20000000298023223876953125 * sin((_4748 * 1.7000000476837158203125) + _3288[_19012].y))));
            _19833 = (_19012 == 0) ? _4847 : _19013;
            _19834 = (_19012 == 2) ? _4847 : _19014;
            float _4862 = _4760 * _3271[_19012].y;
            float _4867 = (_4757 - _4847) / _4862;
            float _4872 = _4760 * _3271[_19012].z;
            float3 _19804;
            _19804 = float3(0.0);
            for (int _19803 = 0; _19803 < 6; )
            {
                float _13885 = ((_4757 - _4847) - (_4872 * ((float(_19803) * 0.4000000059604644775390625) - 1.0))) / _4862;
                _19804 += (_1880[_19803] * exp((-_13885) * _13885));
                _19803++;
                continue;
            }
            _4895 = _19015 + (mix(_19804 * float3(0.237529695034027099609375, 0.24630542099475860595703125, 0.27624309062957763671875), float3(exp((-_4867) * _4867)), float3(_3288[_19012].x)) * (_3271[_19012].w * _4769));
        }
        float _4901 = _4760 * 1.5;
        float _4931 = fast::clamp((_4757 - _19013) / fast::max(_19014 - _19013, 0.001000000047497451305389404296875), 0.0, 1.0);
        float _4959 = (_4757 - (_19014 - (_4760 * 3.0))) / (((_4730.y * 0.0900000035762786865234375) + (_4797 * 0.20000000298023223876953125)) + 0.001000000047497451305389404296875);
        float _4962 = (_4751 - 1.0499999523162841796875) * 2.77777767181396484375;
        float _4987 = ((_4757 - _19013) + (_4760 * 5.0)) / (_4760 * 7.0);
        float3 _5013 = float3(1.0) - exp((-((((_19015 + (mix(float3(0.7799999713897705078125, 0.800000011920928955078125, 1.0), float3(1.0), float3(_4931)) * ((((1.0 / (1.0 + exp((-((_4757 - _19013) - (_4760 * 2.0))) / _4901))) / (1.0 + exp((-(_19014 - _4757)) / _4901))) * (0.0599999986588954925537109375 + (0.3499999940395355224609375 * pow(_4931, 2.5)))) * _4769))) + (float3(1.0, 0.980000019073486328125, 0.949999988079071044921875) * (exp(((-_4959) * _4959) - (_4962 * _4962)) * (0.5 + (1.10000002384185791015625 * _4788))))) + (float3(1.0, 0.680000007152557373046875, 0.4199999868869781494140625) * ((exp((-_4987) * _4987) * _4767) * 0.100000001490116119384765625))) * mix(float3(1.0, 0.9700000286102294921875, 0.939999997615814208984375), float3(0.939999997615814208984375, 0.9700000286102294921875, 1.0), float3(0.5 + (0.5 * sin(_4748 * 0.800000011920928955078125)))))) * 1.39999997615814208984375);
        float _5023 = (in.i_fill0.w * smoothstep(0.0, 0.119999997317790985107421875, _4737.y)) * smoothstep(1.0, 0.87999999523162841796875, _4737.y);
        float _5042 = (fast::clamp(fast::max(_5013.x, fast::max(_5013.y, _5013.z)), 0.0, 1.0) * _5023) * _4290;
        _19559 = float4((_5013 * _5023) * _4290, _5042) + (_19017 * (1.0 - _5042));
    }
    else
    {
        _19559 = _19017;
    }
    float4 _19570;
    if (((in.i_flags.x & _3540) != 0u) && ((in.i_flags.x & _3544) != 0u))
    {
        uint _13917 = (in.i_instance * 24u) + 7u;
        uint _13925 = (in.i_instance * 24u) + 8u;
        float2 _5076 = in.i_local - gFxData_1._data[_13925].zw;
        float2 _13968 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
        float2 _13977 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
        float _19532;
        if ((in.i_flags.x & _1347) != 0u)
        {
            float _14083 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
            float4 _14117 = gTex.sample(gLinear, mix(_19019.xy, _19019.zw, (fast::clamp(_5076, _17431.xy, _17431.zw) - _17431.xy) / fast::max(_17431.zw - _17431.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
            float _14141 = (_14117.w - 0.5) * in.i_radii.y;
            float2 _14182 = abs(_5076 - ((_17431.xy + _17431.zw) * 0.5)) - fast::max(((_17431.zw - _17431.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _14083), float2(0.0));
            _19532 = fast::max((-mix((fast::max(fast::min(_14117.x, _14117.y), fast::min(fast::max(_14117.x, _14117.y), _14117.z)) - 0.5) * in.i_radii.x, _14141, fast::clamp(abs(_14141) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _14083, length(fast::max(_14182, float2(0.0))) + fast::min(fast::max(_14182.x, _14182.y), 0.0)) - in.i_shape.w;
        }
        else
        {
            float _19533;
            if (in.i_flags.z == 1u)
            {
                float2 _13992 = _5076 - _13968;
                float _19531;
                do
                {
                    if (in.i_shape.w >= 6.282185077667236328125)
                    {
                        _19531 = abs(length(_13992) - in.i_radii.x) - in.i_radii.y;
                        break;
                    }
                    float _14226 = in.i_shape.z + (in.i_shape.w * 0.5);
                    float _14228 = cos(_14226);
                    float _14230 = sin(_14226);
                    float _14239 = dot(_13992, float2(-_14230, _14228));
                    float _14242 = dot(_13992, float2(_14228, _14230));
                    float2 _14243 = float2(_14239, _14242);
                    float _14246 = abs(_14239);
                    _14243.x = _14246;
                    float _14249 = in.i_shape.w * 0.5;
                    float _14251 = sin(_14249);
                    float _14253 = cos(_14249);
                    _19531 = (((_14253 * _14246) > (_14251 * _14242)) ? length(_14243 - (float2(_14251, _14253) * in.i_radii.x)) : abs(length(_14243) - in.i_radii.x)) - in.i_radii.y;
                    break;
                } while(false);
                _19533 = _19531;
            }
            else
            {
                float _19534;
                if (in.i_flags.z == 2u)
                {
                    float2 _14289 = _5076 - _17431.xy;
                    float2 _14292 = _17431.zw - _17431.xy;
                    _19534 = length(_14289 - (_14292 * fast::clamp(dot(_14289, _14292) / fast::max(dot(_14292, _14292), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                }
                else
                {
                    float2 _14019 = _5076 - _13968;
                    float _14345 = fast::min(_13977.x, _13977.y);
                    float _14348 = fast::min((_14019.x > 0.0) ? ((_14019.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_14019.y > 0.0) ? in.i_radii.w : in.i_radii.x), _14345);
                    float _14354 = _14348 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                    float _19516;
                    float _19517;
                    if (_14354 > _14345)
                    {
                        float _14368 = in.i_shape.y * fast::clamp((_14345 - _14348) / fast::max(0.60000002384185791015625 * _14348, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _19517 = _14368;
                        _19516 = _14348 * (1.0 + (0.60000002384185791015625 * _14368));
                    }
                    else
                    {
                        _19517 = in.i_shape.y;
                        _19516 = _14354;
                    }
                    float2 _14381 = (abs(_14019) - _13977) + float2(_19516);
                    float2 _14383 = fast::max(_14381, float2(0.0));
                    float _19518;
                    if ((_14383.x > 0.0) && (_14383.y > 0.0))
                    {
                        float _19519;
                        if ((_19517 > 0.001000000047497451305389404296875) && (_19516 > 9.9999997473787516355514526367188e-05))
                        {
                            float _14400 = 2.0 + (2.0 * _19517);
                            float2 _14405 = _14383 / float2(fast::max(_19516, 9.9999997473787516355514526367188e-05));
                            _19519 = pow(pow(_14405.x, _14400) + pow(_14405.y, _14400), 1.0 / _14400) * _19516;
                        }
                        else
                        {
                            _19519 = length(_14383);
                        }
                        _19518 = _19519;
                    }
                    else
                    {
                        _19518 = fast::max(_14383.x, _14383.y);
                    }
                    float _14440 = (fast::min(fast::max(_14381.x, _14381.y), 0.0) + _19518) - _19516;
                    float _19535;
                    if ((in.i_flags.x & _1416) != 0u)
                    {
                        float2 _14047 = fast::max((_17431.zw - _17431.xy) * 0.5, float2(0.001000000047497451305389404296875));
                        float2 _14050 = _5076 - ((_17431.xy + _17431.zw) * 0.5);
                        float _14476 = fast::min(_14047.x, _14047.y);
                        float _14479 = fast::min((_14050.x > 0.0) ? ((_14050.y > 0.0) ? _19181.x : _19181.x) : ((_14050.y > 0.0) ? _19181.x : _19181.x), _14476);
                        float _14485 = _14479 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _19522;
                        float _19523;
                        if (_14485 > _14476)
                        {
                            float _14499 = in.i_shape.y * fast::clamp((_14476 - _14479) / fast::max(0.60000002384185791015625 * _14479, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _19523 = _14499;
                            _19522 = _14479 * (1.0 + (0.60000002384185791015625 * _14499));
                        }
                        else
                        {
                            _19523 = in.i_shape.y;
                            _19522 = _14485;
                        }
                        float2 _14512 = (abs(_14050) - _14047) + float2(_19522);
                        float2 _14514 = fast::max(_14512, float2(0.0));
                        float _19524;
                        if ((_14514.x > 0.0) && (_14514.y > 0.0))
                        {
                            float _19525;
                            if ((_19523 > 0.001000000047497451305389404296875) && (_19522 > 9.9999997473787516355514526367188e-05))
                            {
                                float _14531 = 2.0 + (2.0 * _19523);
                                float2 _14536 = _14514 / float2(fast::max(_19522, 9.9999997473787516355514526367188e-05));
                                _19525 = pow(pow(_14536.x, _14531) + pow(_14536.y, _14531), 1.0 / _14531) * _19522;
                            }
                            else
                            {
                                _19525 = length(_14514);
                            }
                            _19524 = _19525;
                        }
                        else
                        {
                            _19524 = fast::max(_14514.x, _14514.y);
                        }
                        float _14571 = (fast::min(fast::max(_14512.x, _14512.y), 0.0) + _19524) - _19522;
                        float _14576 = fast::max(_19181.y, 9.9999997473787516355514526367188e-05);
                        float _14585 = fast::max(_14576 - abs(_14440 - _14571), 0.0) / _14576;
                        _19535 = fast::min(_14440, _14571) - (((_14585 * _14585) * _14576) * 0.25);
                    }
                    else
                    {
                        _19535 = _14440;
                    }
                    _19534 = _19535;
                }
                _19533 = _19534;
            }
            _19532 = _19533;
        }
        float _5085 = (_19532 + gFxData_1._data[_13925].y) / (fast::max(gFxData_1._data[_13925].x * 0.5, _4252 * 0.5) * 1.41421353816986083984375);
        float _14602 = sign(_5085);
        float _14604 = abs(_5085);
        float _14615 = 1.0 + ((0.2783930003643035888671875 + ((0.23038899898529052734375 + (0.07810799777507781982421875 * (_14604 * _14604))) * _14604)) * _14604);
        float _14618 = _14615 * _14615;
        float _14633 = fast::clamp(gFxData_1._data[_13917].w * ((0.5 + (0.5 * (_14602 - (_14602 / (_14618 * _14618))))) * _4290), 0.0, 1.0);
        _19570 = float4(gFxData_1._data[_13917].xyz * _14633, _14633) + (_19559 * (1.0 - _14633));
    }
    else
    {
        _19570 = _19559;
    }
    float4 _19595;
    if ((in.i_flags.x & _3604) != 0u)
    {
        uint _14657 = (in.i_instance * 24u) + 9u;
        uint _14665 = (in.i_instance * 24u) + 10u;
        float _5117 = fast::max(-_17450, 0.0) / fast::max(gFxData_1._data[_14665].z, 0.001000000047497451305389404296875);
        float _14675 = fast::clamp(gFxData_1._data[_14657].w * fast::clamp((exp(((-_5117) * _5117) * 2.2000000476837158203125) * gFxData_1._data[_14665].w) * _4290, 0.0, 1.0), 0.0, 1.0);
        _19595 = float4(gFxData_1._data[_14657].xyz * _14675, _14675) + (_19570 * (1.0 - _14675));
    }
    else
    {
        _19595 = _19570;
    }
    float3 _5148 = _19595.xyz + float3(_19575 * fast::clamp(_19595.w / fast::max(_4290, 0.001000000047497451305389404296875), 0.0, 1.0));
    float4 _17320 = _19595;
    _17320.x = _5148.x;
    _17320.y = _5148.y;
    _17320.z = _5148.z;
    float4 _19598;
    if ((in.i_flags.x & _3673) != 0u)
    {
        uint _14699 = (in.i_instance * 24u) + 5u;
        float4 _14701 = gFxData_1._data[_14699];
        uint _14707 = (in.i_instance * 24u) + 6u;
        float4 _19596;
        if (gFxData_1._data[_14707].z < 0.999000012874603271484375)
        {
            float2 _5206 = fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875));
            float _5217 = cos(gFxData_1._data[_14707].w);
            float _5220 = sin(gFxData_1._data[_14707].w);
            float4 _17337 = _14701;
            _17337.w = _14701.w * mix(1.0, gFxData_1._data[_14707].z, fast::clamp(((dot(in.i_local - ((in.i_rect.xy + in.i_rect.zw) * 0.5), float2(_5217, _5220)) / fast::max(0.5 * ((abs(_5217) * _5206.x) + (abs(_5220) * _5206.y)), 0.001000000047497451305389404296875)) * 0.5) + 0.5, 0.0, 1.0));
            _19596 = _17337;
        }
        else
        {
            _19596 = _14701;
        }
        float _14717 = fast::clamp(_19596.w * (fast::clamp(0.5 - ((_17450 - (gFxData_1._data[_14707].x * gFxData_1._data[_14707].y)) / _4252), 0.0, 1.0) - fast::clamp(0.5 - ((_17450 + (gFxData_1._data[_14707].x * (1.0 - gFxData_1._data[_14707].y))) / _4252), 0.0, 1.0)), 0.0, 1.0);
        _19598 = float4(_19596.xyz * _14717, _14717) + (_17320 * (1.0 - _14717));
    }
    else
    {
        _19598 = _17320;
    }
    float4 _19599;
    if ((in.i_flags.x & _3803) != 0u)
    {
        float2 _5281 = (in.i_local - in.i_rect.xy) / fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875));
        float _5303 = exp(-pow((((_5281.x * 0.85000002384185791015625) + (_5281.y * 0.1500000059604644775390625)) - ((fract(_188.gTime.x * in.i_misc.w) * 1.7999999523162841796875) - 0.4000000059604644775390625)) * 9.09090900421142578125, 2.0));
        _19599 = float4(_19598.xyz + float3(((_5303 * in.i_misc.z) * _4290) * fast::max(_19598.w, 0.3499999940395355224609375)), fast::max(_19598.w, ((_5303 * in.i_misc.z) * _4290) * 0.5));
    }
    else
    {
        _19599 = _19598;
    }
    float4 _19798;
    if ((in.i_flags.x & _3885) != 0u)
    {
        float3 _14742 = fract(floor(_17424).xyx * 0.103100001811981201171875);
        float3 _14751 = _14742 + float3(dot(_14742, _14742.yzx + float3(33.3300018310546875)));
        float3 _5354 = _19599.xyz + float3(((fract((_14751.x + _14751.y) * _14751.z) - 0.5) * in.i_misc.y) * _19599.w);
        float4 _17361 = _19599;
        _17361.x = _5354.x;
        _17361.y = _5354.y;
        _17361.z = _5354.z;
        _19798 = _17361;
    }
    else
    {
        _19798 = _19599;
    }
    float _19794;
    if (_231.gFade.z > 0.0)
    {
        _19794 = smoothstep(0.0, 1.0, fast::clamp((_17424.y - _231.gFade.x) / _231.gFade.z, 0.0, 1.0));
    }
    else
    {
        _19794 = 1.0;
    }
    float _19795;
    if (_231.gFade.w > 0.0)
    {
        _19795 = _19794 * smoothstep(0.0, 1.0, fast::clamp((_231.gFade.y - _17424.y) / _231.gFade.w, 0.0, 1.0));
    }
    else
    {
        _19795 = _19794;
    }
    float4 _5371 = _19798 * ((in.i_misc.x * _19610) * _19795);
    float4 _19799;
    if (((in.i_flags.x & _3925) != 0u) || ((in.i_flags.x & _3929) != 0u))
    {
        float3 _14803 = fract((floor(_17424) + float2(17.0)).xyx * 0.103100001811981201171875);
        float3 _14812 = _14803 + float3(dot(_14803, _14803.yzx + float3(33.3300018310546875)));
        float3 _5395 = _5371.xyz + float3(((fract((_14812.x + _14812.y) * _14812.z) - 0.5) * 0.0039215688593685626983642578125) * fast::clamp(_5371.w * 8.0, 0.0, 1.0));
        float4 _17373 = _5371;
        _17373.x = _5395.x;
        _17373.y = _5395.y;
        _17373.z = _5395.z;
        _19799 = _17373;
    }
    else
    {
        _19799 = _5371;
    }
    float3 _5405 = fast::max(_19799.xyz, float3(0.0));
    float4 _17379 = _19799;
    _17379.x = _5405.x;
    _17379.y = _5405.y;
    _17379.z = _5405.z;
    float4 _19800;
    if ((_188.gTime.w > 0.5) && (_19799.w > 9.9999997473787516355514526367188e-06))
    {
        float3 _14856 = fast::clamp(_17379.xyz / float3(_19799.w), float3(0.0), float3(1.0));
        float3 _14842 = select(pow((_14856 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _14856 * float3(0.077399380505084991455078125), _14856 <= float3(0.040449999272823333740234375)) * _19799.w;
        float4 _17388 = _17379;
        _17388.x = _14842.x;
        _17388.y = _14842.y;
        _17388.z = _14842.z;
        _19800 = _17388;
    }
    else
    {
        _19800 = _17379;
    }
    out._entryPointOutput = _19800;
    return out;
}

