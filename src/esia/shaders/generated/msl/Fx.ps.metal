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
constant uint _2961 = (65536u & kEsiaFxFeatures);
constant uint _3037 = (32u & kEsiaFxFeatures);
constant uint _3101 = (1u & kEsiaFxFeatures);
constant uint _3130 = (64u & kEsiaFxFeatures);
constant uint _3183 = (16384u & kEsiaFxFeatures);
constant uint _3615 = (4u & kEsiaFxFeatures);
constant uint _3619 = (256u & kEsiaFxFeatures);
constant uint _3679 = (16u & kEsiaFxFeatures);
constant uint _3748 = (2u & kEsiaFxFeatures);
constant uint _3878 = (128u & kEsiaFxFeatures);
constant uint _3960 = (2048u & kEsiaFxFeatures);
constant uint _4000 = (8u & kEsiaFxFeatures);
constant uint _4004 = (4u & kEsiaFxFeatures);

constant spvUnsafeArray<float3, 6> _1880 = spvUnsafeArray<float3, 6>({ float3(1.0, 0.4199999868869781494140625, 0.2199999988079071044921875), float3(1.0, 0.699999988079071044921875, 0.300000011920928955078125), float3(0.800000011920928955078125, 0.920000016689300537109375, 0.4000000059604644775390625), float3(0.3499999940395355224609375, 0.89999997615814208984375, 0.699999988079071044921875), float3(0.4000000059604644775390625, 0.62000000476837158203125, 1.0), float3(0.660000026226043701171875, 0.5, 1.0) });
constant spvUnsafeArray<float4, 4> _3346 = spvUnsafeArray<float4, 4>({ float4(-1.0, 1.0, 3.400000095367431640625, 2.599999904632568359375), float4(-0.550000011920928955078125, 0.800000011920928955078125, 2.0, 0.800000011920928955078125), float4(0.300000011920928955078125, 1.0, 1.2000000476837158203125, 1.2999999523162841796875), float4(0.62000000476837158203125, 0.800000011920928955078125, 1.60000002384185791015625, 0.449999988079071044921875) });
constant spvUnsafeArray<float2, 4> _3363 = spvUnsafeArray<float2, 4>({ float2(0.0), float2(0.100000001490116119384765625, 1.2999999523162841796875), float2(0.550000011920928955078125, 3.900000095367431640625), float2(0.20000000298023223876953125, 5.19999980926513671875) });

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
    float2 _5614 = gl_FragCoord.xy + _188.gConv.yy;
    float2 _18820;
    if (_188.gConv.x > 0.5)
    {
        float2 _17515 = _5614;
        _17515.y = _188.gTarget.y - _5614.y;
        _18820 = _17515;
    }
    else
    {
        _18820 = _5614;
    }
    float _4334 = dfdx(in.i_local.x);
    float _4338 = dfdy(in.i_local.x);
    float _4341 = fast::max(abs(_4334) + abs(_4338), 9.9999997473787516355514526367188e-05);
    float4 _18825;
    float4 _18828;
    if ((in.i_flags.z == 2u) || ((in.i_flags.x & _2516) != 0u))
    {
        _18828 = gFxData_1._data[(in.i_instance * 24u) + 15u];
        _18825 = gFxData_1._data[(in.i_instance * 24u) + 16u];
    }
    else
    {
        _18828 = float4(0.0);
        _18825 = float4(0.0);
    }
    float4 _18821;
    float4 _18827;
    if ((in.i_flags.x & _2537) != 0u)
    {
        _18827 = gFxData_1._data[(in.i_instance * 24u) + 15u];
        _18821 = gFxData_1._data[(in.i_instance * 24u) + 18u];
    }
    else
    {
        _18827 = _18828;
        _18821 = float4(0.0);
    }
    float2 _5699 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
    float2 _5708 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
    float _18846;
    if ((in.i_flags.x & _1347) != 0u)
    {
        float _5814 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
        float4 _5848 = gTex.sample(gLinear, mix(_18821.xy, _18821.zw, (fast::clamp(in.i_local, _18827.xy, _18827.zw) - _18827.xy) / fast::max(_18827.zw - _18827.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
        float _5872 = (_5848.w - 0.5) * in.i_radii.y;
        float2 _5913 = abs(in.i_local - ((_18827.xy + _18827.zw) * 0.5)) - fast::max(((_18827.zw - _18827.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _5814), float2(0.0));
        _18846 = fast::max((-mix((fast::max(fast::min(_5848.x, _5848.y), fast::min(fast::max(_5848.x, _5848.y), _5848.z)) - 0.5) * in.i_radii.x, _5872, fast::clamp(abs(_5872) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _5814, length(fast::max(_5913, float2(0.0))) + fast::min(fast::max(_5913.x, _5913.y), 0.0)) - in.i_shape.w;
    }
    else
    {
        float _18847;
        if (in.i_flags.z == 1u)
        {
            float2 _5723 = in.i_local - _5699;
            float _18845;
            do
            {
                if (in.i_shape.w >= 6.282185077667236328125)
                {
                    _18845 = abs(length(_5723) - in.i_radii.x) - in.i_radii.y;
                    break;
                }
                float _5957 = in.i_shape.z + (in.i_shape.w * 0.5);
                float _5959 = cos(_5957);
                float _5961 = sin(_5957);
                float _5970 = dot(_5723, float2(-_5961, _5959));
                float _5973 = dot(_5723, float2(_5959, _5961));
                float2 _5974 = float2(_5970, _5973);
                float _5977 = abs(_5970);
                _5974.x = _5977;
                float _5980 = in.i_shape.w * 0.5;
                float _5982 = sin(_5980);
                float _5984 = cos(_5980);
                _18845 = (((_5984 * _5977) > (_5982 * _5973)) ? length(_5974 - (float2(_5982, _5984) * in.i_radii.x)) : abs(length(_5974) - in.i_radii.x)) - in.i_radii.y;
                break;
            } while(false);
            _18847 = _18845;
        }
        else
        {
            float _18848;
            if (in.i_flags.z == 2u)
            {
                float2 _6020 = in.i_local - _18827.xy;
                float2 _6023 = _18827.zw - _18827.xy;
                _18848 = length(_6020 - (_6023 * fast::clamp(dot(_6020, _6023) / fast::max(dot(_6023, _6023), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
            }
            else
            {
                float2 _5750 = in.i_local - _5699;
                float _6076 = fast::min(_5708.x, _5708.y);
                float _6079 = fast::min((_5750.x > 0.0) ? ((_5750.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_5750.y > 0.0) ? in.i_radii.w : in.i_radii.x), _6076);
                float _6085 = _6079 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                float _18830;
                float _18831;
                if (_6085 > _6076)
                {
                    float _6099 = in.i_shape.y * fast::clamp((_6076 - _6079) / fast::max(0.60000002384185791015625 * _6079, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                    _18831 = _6099;
                    _18830 = _6079 * (1.0 + (0.60000002384185791015625 * _6099));
                }
                else
                {
                    _18831 = in.i_shape.y;
                    _18830 = _6085;
                }
                float2 _6112 = (abs(_5750) - _5708) + float2(_18830);
                float2 _6114 = fast::max(_6112, float2(0.0));
                float _18832;
                if ((_6114.x > 0.0) && (_6114.y > 0.0))
                {
                    float _18833;
                    if ((_18831 > 0.001000000047497451305389404296875) && (_18830 > 9.9999997473787516355514526367188e-05))
                    {
                        float _6131 = 2.0 + (2.0 * _18831);
                        float2 _6136 = _6114 / float2(fast::max(_18830, 9.9999997473787516355514526367188e-05));
                        _18833 = pow(pow(_6136.x, _6131) + pow(_6136.y, _6131), 1.0 / _6131) * _18830;
                    }
                    else
                    {
                        _18833 = length(_6114);
                    }
                    _18832 = _18833;
                }
                else
                {
                    _18832 = fast::max(_6114.x, _6114.y);
                }
                float _6171 = (fast::min(fast::max(_6112.x, _6112.y), 0.0) + _18832) - _18830;
                float _18849;
                if ((in.i_flags.x & _1416) != 0u)
                {
                    float2 _5778 = fast::max((_18827.zw - _18827.xy) * 0.5, float2(0.001000000047497451305389404296875));
                    float2 _5781 = in.i_local - ((_18827.xy + _18827.zw) * 0.5);
                    float _6207 = fast::min(_5778.x, _5778.y);
                    float _6210 = fast::min((_5781.x > 0.0) ? ((_5781.y > 0.0) ? _18825.x : _18825.x) : ((_5781.y > 0.0) ? _18825.x : _18825.x), _6207);
                    float _6216 = _6210 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                    float _18836;
                    float _18837;
                    if (_6216 > _6207)
                    {
                        float _6230 = in.i_shape.y * fast::clamp((_6207 - _6210) / fast::max(0.60000002384185791015625 * _6210, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _18837 = _6230;
                        _18836 = _6210 * (1.0 + (0.60000002384185791015625 * _6230));
                    }
                    else
                    {
                        _18837 = in.i_shape.y;
                        _18836 = _6216;
                    }
                    float2 _6243 = (abs(_5781) - _5778) + float2(_18836);
                    float2 _6245 = fast::max(_6243, float2(0.0));
                    float _18838;
                    if ((_6245.x > 0.0) && (_6245.y > 0.0))
                    {
                        float _18839;
                        if ((_18837 > 0.001000000047497451305389404296875) && (_18836 > 9.9999997473787516355514526367188e-05))
                        {
                            float _6262 = 2.0 + (2.0 * _18837);
                            float2 _6267 = _6245 / float2(fast::max(_18836, 9.9999997473787516355514526367188e-05));
                            _18839 = pow(pow(_6267.x, _6262) + pow(_6267.y, _6262), 1.0 / _6262) * _18836;
                        }
                        else
                        {
                            _18839 = length(_6245);
                        }
                        _18838 = _18839;
                    }
                    else
                    {
                        _18838 = fast::max(_6245.x, _6245.y);
                    }
                    float _6302 = (fast::min(fast::max(_6243.x, _6243.y), 0.0) + _18838) - _18836;
                    float _6307 = fast::max(_18825.y, 9.9999997473787516355514526367188e-05);
                    float _6316 = fast::max(_6307 - abs(_6171 - _6302), 0.0) / _6307;
                    _18849 = fast::min(_6171, _6302) - (((_6316 * _6316) * _6307) * 0.25);
                }
                else
                {
                    _18849 = _6171;
                }
                _18848 = _18849;
            }
            _18847 = _18848;
        }
        _18846 = _18847;
    }
    float _4379 = fast::clamp(0.5 - (_18846 / _4341), 0.0, 1.0);
    float _21277;
    if ((in.i_flags.x & _2570) != 0u)
    {
        uint _6332 = (in.i_instance * 24u) + 19u;
        uint _6340 = (in.i_instance * 24u) + 20u;
        float2 _4408 = fast::max((gFxData_1._data[_6332].zw - gFxData_1._data[_6332].xy) * 0.5, float2(0.001000000047497451305389404296875));
        float2 _4411 = in.i_local - ((gFxData_1._data[_6332].xy + gFxData_1._data[_6332].zw) * 0.5);
        float _6378 = fast::min(_4408.x, _4408.y);
        float _6381 = fast::min((_4411.x > 0.0) ? ((_4411.y > 0.0) ? gFxData_1._data[_6340].x : gFxData_1._data[_6340].x) : ((_4411.y > 0.0) ? gFxData_1._data[_6340].x : gFxData_1._data[_6340].x), _6378);
        float _6387 = _6381 * (1.0 + (0.60000002384185791015625 * gFxData_1._data[_6340].y));
        float _18850;
        float _18851;
        if (_6387 > _6378)
        {
            float _6401 = gFxData_1._data[_6340].y * fast::clamp((_6378 - _6381) / fast::max(0.60000002384185791015625 * _6381, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
            _18851 = _6401;
            _18850 = _6381 * (1.0 + (0.60000002384185791015625 * _6401));
        }
        else
        {
            _18851 = gFxData_1._data[_6340].y;
            _18850 = _6387;
        }
        float2 _6414 = (abs(_4411) - _4408) + float2(_18850);
        float2 _6416 = fast::max(_6414, float2(0.0));
        float _18852;
        if ((_6416.x > 0.0) && (_6416.y > 0.0))
        {
            float _18853;
            if ((_18851 > 0.001000000047497451305389404296875) && (_18850 > 9.9999997473787516355514526367188e-05))
            {
                float _6433 = 2.0 + (2.0 * _18851);
                float2 _6438 = _6416 / float2(fast::max(_18850, 9.9999997473787516355514526367188e-05));
                _18853 = pow(pow(_6438.x, _6433) + pow(_6438.y, _6433), 1.0 / _6433) * _18850;
            }
            else
            {
                _18853 = length(_6416);
            }
            _18852 = _18853;
        }
        else
        {
            _18852 = fast::max(_6416.x, _6416.y);
        }
        float _4423 = fast::clamp(0.5 - (((fast::min(fast::max(_6414.x, _6414.y), 0.0) + _18852) - _18850) / _4341), 0.0, 1.0);
        if (_4423 <= 0.0)
        {
            discard_fragment();
        }
        _21277 = _4423;
    }
    else
    {
        _21277 = 1.0;
    }
    bool _4434 = ((in.i_flags.x & _2637) != 0u) && (_4379 >= 0.999000012874603271484375);
    float4 _18963;
    if ((((in.i_flags.x & _2645) != 0u) && (!((in.i_flags.x & _2650) != 0u))) && (!_4434))
    {
        uint _6479 = (in.i_instance * 24u) + 7u;
        uint _6487 = (in.i_instance * 24u) + 8u;
        float2 _4465 = in.i_local - gFxData_1._data[_6487].zw;
        float2 _6530 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
        float2 _6539 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
        float _18917;
        if ((in.i_flags.x & _1347) != 0u)
        {
            float _6645 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
            float4 _6679 = gTex.sample(gLinear, mix(_18821.xy, _18821.zw, (fast::clamp(_4465, _18827.xy, _18827.zw) - _18827.xy) / fast::max(_18827.zw - _18827.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
            float _6703 = (_6679.w - 0.5) * in.i_radii.y;
            float2 _6744 = abs(_4465 - ((_18827.xy + _18827.zw) * 0.5)) - fast::max(((_18827.zw - _18827.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _6645), float2(0.0));
            _18917 = fast::max((-mix((fast::max(fast::min(_6679.x, _6679.y), fast::min(fast::max(_6679.x, _6679.y), _6679.z)) - 0.5) * in.i_radii.x, _6703, fast::clamp(abs(_6703) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _6645, length(fast::max(_6744, float2(0.0))) + fast::min(fast::max(_6744.x, _6744.y), 0.0)) - in.i_shape.w;
        }
        else
        {
            float _18918;
            if (in.i_flags.z == 1u)
            {
                float2 _6554 = _4465 - _6530;
                float _18916;
                do
                {
                    if (in.i_shape.w >= 6.282185077667236328125)
                    {
                        _18916 = abs(length(_6554) - in.i_radii.x) - in.i_radii.y;
                        break;
                    }
                    float _6788 = in.i_shape.z + (in.i_shape.w * 0.5);
                    float _6790 = cos(_6788);
                    float _6792 = sin(_6788);
                    float _6801 = dot(_6554, float2(-_6792, _6790));
                    float _6804 = dot(_6554, float2(_6790, _6792));
                    float2 _6805 = float2(_6801, _6804);
                    float _6808 = abs(_6801);
                    _6805.x = _6808;
                    float _6811 = in.i_shape.w * 0.5;
                    float _6813 = sin(_6811);
                    float _6815 = cos(_6811);
                    _18916 = (((_6815 * _6808) > (_6813 * _6804)) ? length(_6805 - (float2(_6813, _6815) * in.i_radii.x)) : abs(length(_6805) - in.i_radii.x)) - in.i_radii.y;
                    break;
                } while(false);
                _18918 = _18916;
            }
            else
            {
                float _18919;
                if (in.i_flags.z == 2u)
                {
                    float2 _6851 = _4465 - _18827.xy;
                    float2 _6854 = _18827.zw - _18827.xy;
                    _18919 = length(_6851 - (_6854 * fast::clamp(dot(_6851, _6854) / fast::max(dot(_6854, _6854), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                }
                else
                {
                    float2 _6581 = _4465 - _6530;
                    float _6907 = fast::min(_6539.x, _6539.y);
                    float _6910 = fast::min((_6581.x > 0.0) ? ((_6581.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_6581.y > 0.0) ? in.i_radii.w : in.i_radii.x), _6907);
                    float _6916 = _6910 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                    float _18901;
                    float _18902;
                    if (_6916 > _6907)
                    {
                        float _6930 = in.i_shape.y * fast::clamp((_6907 - _6910) / fast::max(0.60000002384185791015625 * _6910, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _18902 = _6930;
                        _18901 = _6910 * (1.0 + (0.60000002384185791015625 * _6930));
                    }
                    else
                    {
                        _18902 = in.i_shape.y;
                        _18901 = _6916;
                    }
                    float2 _6943 = (abs(_6581) - _6539) + float2(_18901);
                    float2 _6945 = fast::max(_6943, float2(0.0));
                    float _18903;
                    if ((_6945.x > 0.0) && (_6945.y > 0.0))
                    {
                        float _18904;
                        if ((_18902 > 0.001000000047497451305389404296875) && (_18901 > 9.9999997473787516355514526367188e-05))
                        {
                            float _6962 = 2.0 + (2.0 * _18902);
                            float2 _6967 = _6945 / float2(fast::max(_18901, 9.9999997473787516355514526367188e-05));
                            _18904 = pow(pow(_6967.x, _6962) + pow(_6967.y, _6962), 1.0 / _6962) * _18901;
                        }
                        else
                        {
                            _18904 = length(_6945);
                        }
                        _18903 = _18904;
                    }
                    else
                    {
                        _18903 = fast::max(_6945.x, _6945.y);
                    }
                    float _7002 = (fast::min(fast::max(_6943.x, _6943.y), 0.0) + _18903) - _18901;
                    float _18920;
                    if ((in.i_flags.x & _1416) != 0u)
                    {
                        float2 _6609 = fast::max((_18827.zw - _18827.xy) * 0.5, float2(0.001000000047497451305389404296875));
                        float2 _6612 = _4465 - ((_18827.xy + _18827.zw) * 0.5);
                        float _7038 = fast::min(_6609.x, _6609.y);
                        float _7041 = fast::min((_6612.x > 0.0) ? ((_6612.y > 0.0) ? _18825.x : _18825.x) : ((_6612.y > 0.0) ? _18825.x : _18825.x), _7038);
                        float _7047 = _7041 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _18907;
                        float _18908;
                        if (_7047 > _7038)
                        {
                            float _7061 = in.i_shape.y * fast::clamp((_7038 - _7041) / fast::max(0.60000002384185791015625 * _7041, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _18908 = _7061;
                            _18907 = _7041 * (1.0 + (0.60000002384185791015625 * _7061));
                        }
                        else
                        {
                            _18908 = in.i_shape.y;
                            _18907 = _7047;
                        }
                        float2 _7074 = (abs(_6612) - _6609) + float2(_18907);
                        float2 _7076 = fast::max(_7074, float2(0.0));
                        float _18909;
                        if ((_7076.x > 0.0) && (_7076.y > 0.0))
                        {
                            float _18910;
                            if ((_18908 > 0.001000000047497451305389404296875) && (_18907 > 9.9999997473787516355514526367188e-05))
                            {
                                float _7093 = 2.0 + (2.0 * _18908);
                                float2 _7098 = _7076 / float2(fast::max(_18907, 9.9999997473787516355514526367188e-05));
                                _18910 = pow(pow(_7098.x, _7093) + pow(_7098.y, _7093), 1.0 / _7093) * _18907;
                            }
                            else
                            {
                                _18910 = length(_7076);
                            }
                            _18909 = _18910;
                        }
                        else
                        {
                            _18909 = fast::max(_7076.x, _7076.y);
                        }
                        float _7133 = (fast::min(fast::max(_7074.x, _7074.y), 0.0) + _18909) - _18907;
                        float _7138 = fast::max(_18825.y, 9.9999997473787516355514526367188e-05);
                        float _7147 = fast::max(_7138 - abs(_7002 - _7133), 0.0) / _7138;
                        _18920 = fast::min(_7002, _7133) - (((_7147 * _7147) * _7138) * 0.25);
                    }
                    else
                    {
                        _18920 = _7002;
                    }
                    _18919 = _18920;
                }
                _18918 = _18919;
            }
            _18917 = _18918;
        }
        float _4474 = (_18917 - gFxData_1._data[_6487].y) / (fast::max(gFxData_1._data[_6487].x * 0.5, _4341 * 0.5) * 1.41421353816986083984375);
        float _7164 = sign(_4474);
        float _7166 = abs(_4474);
        float _7177 = 1.0 + ((0.2783930003643035888671875 + ((0.23038899898529052734375 + (0.07810799777507781982421875 * (_7166 * _7166))) * _7166)) * _7166);
        float _7180 = _7177 * _7177;
        float _7195 = fast::clamp(gFxData_1._data[_6479].w * (0.5 - (0.5 * (_7164 - (_7164 / (_7180 * _7180))))), 0.0, 1.0);
        _18963 = float4(gFxData_1._data[_6479].xyz * _7195, _7195);
    }
    else
    {
        _18963 = float4(0.0);
    }
    float4 _19063;
    if (((in.i_flags.x & _2715) != 0u) && (!_4434))
    {
        uint _7219 = (in.i_instance * 24u) + 9u;
        uint _7227 = (in.i_instance * 24u) + 10u;
        float _4502 = fast::max(gFxData_1._data[_7227].x, 0.001000000047497451305389404296875);
        float _18956;
        float _18959;
        if ((in.i_flags.x & _2744) != 0u)
        {
            uint _7235 = (in.i_instance * 24u) + 22u;
            float2 _4518 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
            float2 _4527 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
            float2 _4534 = in.i_rect.xy - gFxData_1._data[_7235].xy;
            float2 _4541 = gFxData_1._data[_7235].zw - in.i_rect.zw;
            float2 _4571 = fast::clamp(float2((in.i_local.x < _4518.x) ? _4534.x : _4541.x, (in.i_local.y < _4518.y) ? _4534.y : _4541.y) * float2(0.58823525905609130859375), float2(fast::min(_4502, 1.5)), float2(_4502));
            float _4576 = fast::min(_4527.x, _4527.y);
            float _18954;
            if (in.i_flags.z == 0u)
            {
                _18954 = fast::min(((in.i_local.x > _4518.x) ? ((in.i_local.y > _4518.y) ? in.i_radii.z : in.i_radii.y) : ((in.i_local.y > _4518.y) ? in.i_radii.w : in.i_radii.x)) * (1.0 + (0.60000002384185791015625 * in.i_shape.y)), _4576);
            }
            else
            {
                _18954 = _4576;
            }
            float2 _4625 = fast::max(abs(in.i_local - _4518) - (_4527 - float2(_18954)), float2(0.0));
            float _4627 = length(_4625);
            float2 _4635 = select(float2(0.707099974155426025390625), _4625 / float2(_4627), bool2(_4627 > 9.9999997473787516355514526367188e-05));
            float2 _4650 = in.i_local - gFxData_1._data[_7235].xy;
            float2 _4655 = gFxData_1._data[_7235].zw - in.i_local;
            _18959 = fast::clamp(fast::min(fast::min(_4650.x, _4650.y), fast::min(_4655.x, _4655.y)) * 0.666666686534881591796875, 0.0, 1.0);
            _18956 = rsqrt(dot(_4635 * _4635, float2(1.0) / (_4571 * _4571)));
        }
        else
        {
            _18959 = 1.0;
            _18956 = _4502;
        }
        float _4673 = fast::max(_18846, 0.0) / _18956;
        float _7245 = fast::clamp(gFxData_1._data[_7219].w * fast::clamp((exp(((-_4673) * _4673) * 2.2000000476837158203125) * gFxData_1._data[_7227].y) * _18959, 0.0, 1.0), 0.0, 1.0);
        _19063 = float4(gFxData_1._data[_7219].xyz * _7245, _7245) + (_18963 * (1.0 - _7245));
    }
    else
    {
        _19063 = _18963;
    }
    float4 _20057;
    if ((in.i_flags.x & _2961) != 0u)
    {
        float2 _4704 = _18820 * _188.gTarget.zw;
        float _7278 = fast::clamp(log2(fast::max(fast::max(in.i_radii.w / _4341, 4.0), 1.0)) - 1.0, 0.0, 5.0);
        int _7281 = int(floor(_7278));
        float _7285 = _7278 - float(_7281);
        bool _7290 = (_7285 > 0.0199999995529651641845703125) && (_7281 < 5);
        float3 _19035;
        _19035 = float3(0.0);
        float3 _7319;
        for (int _18965 = 0; _18965 < 2; _19035 = _7319, _18965++)
        {
            if ((_18965 > 0) && (!_7290))
            {
                break;
            }
            int _7305 = _7281 + _18965;
            int _7343 = clamp(_7305, 1, 5);
            float2 _7412 = (_4704 * _188.gLevel[_7343].xy) - float2(0.5);
            float2 _7414 = floor(_7412);
            float2 _7417 = _7412 - _7414;
            float2 _7420 = _7417 * _7417;
            float2 _7423 = _7420 * _7417;
            float2 _7442 = (((_7423 * 3.0) - (_7420 * 6.0)) + float2(4.0)) * 0.16666667163372039794921875;
            float2 _7455 = _7423 * 0.16666667163372039794921875;
            float2 _7458 = (((((-_7423) + (_7420 * 3.0)) - (_7417 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _7442;
            float2 _7462 = (((((_7423 * (-3.0)) + (_7420 * 3.0)) + (_7417 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _7455;
            float2 _7474 = ((_7414 - float2(0.5)) + (_7442 / _7458)) * _188.gLevel[_7343].zw;
            float2 _7486 = ((_7414 + float2(1.5)) + (_7455 / _7462)) * _188.gLevel[_7343].zw;
            float4 _19002;
            if (_7305 <= 0)
            {
                float2 _19001;
                if (_188.gConv.x > 0.5)
                {
                    float2 _17710 = _4704;
                    _17710.y = 1.0 - _4704.y;
                    _19001 = _17710;
                }
                else
                {
                    _19001 = _4704;
                }
                _19002 = gBackdrop0.sample(gLinear, _19001, level(0.0));
            }
            else
            {
                float4 _19003;
                if (_7305 == 1)
                {
                    float2 _18994;
                    if (_188.gConv.x > 0.5)
                    {
                        float2 _17715 = _7474;
                        _17715.y = 1.0 - _7474.y;
                        _18994 = _17715;
                    }
                    else
                    {
                        _18994 = _7474;
                    }
                    float _7531 = _7474.y;
                    float2 _7532 = float2(_7486.x, _7531);
                    float2 _18995;
                    if (_188.gConv.x > 0.5)
                    {
                        float2 _17722 = _7532;
                        _17722.y = 1.0 - _7531;
                        _18995 = _17722;
                    }
                    else
                    {
                        _18995 = _7532;
                    }
                    float _7549 = _7486.y;
                    float2 _7550 = float2(_7474.x, _7549);
                    float2 _18997;
                    if (_188.gConv.x > 0.5)
                    {
                        float2 _17729 = _7550;
                        _17729.y = 1.0 - _7549;
                        _18997 = _17729;
                    }
                    else
                    {
                        _18997 = _7550;
                    }
                    float2 _18999;
                    if (_188.gConv.x > 0.5)
                    {
                        float2 _17736 = _7486;
                        _17736.y = 1.0 - _7486.y;
                        _18999 = _17736;
                    }
                    else
                    {
                        _18999 = _7486;
                    }
                    _19003 = (((gBackdrop1.sample(gLinear, _18994, level(0.0)) * (_7458.x * _7458.y)) + (gBackdrop1.sample(gLinear, _18995, level(0.0)) * (_7462.x * _7458.y))) + (gBackdrop1.sample(gLinear, _18997, level(0.0)) * (_7458.x * _7462.y))) + (gBackdrop1.sample(gLinear, _18999, level(0.0)) * (_7462.x * _7462.y));
                }
                else
                {
                    float4 _19004;
                    if (_7305 == 2)
                    {
                        float2 _18987;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _17743 = _7474;
                            _17743.y = 1.0 - _7474.y;
                            _18987 = _17743;
                        }
                        else
                        {
                            _18987 = _7474;
                        }
                        float _7661 = _7474.y;
                        float2 _7662 = float2(_7486.x, _7661);
                        float2 _18988;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _17750 = _7662;
                            _17750.y = 1.0 - _7661;
                            _18988 = _17750;
                        }
                        else
                        {
                            _18988 = _7662;
                        }
                        float _7679 = _7486.y;
                        float2 _7680 = float2(_7474.x, _7679);
                        float2 _18990;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _17757 = _7680;
                            _17757.y = 1.0 - _7679;
                            _18990 = _17757;
                        }
                        else
                        {
                            _18990 = _7680;
                        }
                        float2 _18992;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _17764 = _7486;
                            _17764.y = 1.0 - _7486.y;
                            _18992 = _17764;
                        }
                        else
                        {
                            _18992 = _7486;
                        }
                        _19004 = (((gBackdrop2.sample(gLinear, _18987, level(0.0)) * (_7458.x * _7458.y)) + (gBackdrop2.sample(gLinear, _18988, level(0.0)) * (_7462.x * _7458.y))) + (gBackdrop2.sample(gLinear, _18990, level(0.0)) * (_7458.x * _7462.y))) + (gBackdrop2.sample(gLinear, _18992, level(0.0)) * (_7462.x * _7462.y));
                    }
                    else
                    {
                        float4 _19005;
                        if (_7305 == 3)
                        {
                            float2 _18980;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _17771 = _7474;
                                _17771.y = 1.0 - _7474.y;
                                _18980 = _17771;
                            }
                            else
                            {
                                _18980 = _7474;
                            }
                            float _7791 = _7474.y;
                            float2 _7792 = float2(_7486.x, _7791);
                            float2 _18981;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _17778 = _7792;
                                _17778.y = 1.0 - _7791;
                                _18981 = _17778;
                            }
                            else
                            {
                                _18981 = _7792;
                            }
                            float _7809 = _7486.y;
                            float2 _7810 = float2(_7474.x, _7809);
                            float2 _18983;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _17785 = _7810;
                                _17785.y = 1.0 - _7809;
                                _18983 = _17785;
                            }
                            else
                            {
                                _18983 = _7810;
                            }
                            float2 _18985;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _17792 = _7486;
                                _17792.y = 1.0 - _7486.y;
                                _18985 = _17792;
                            }
                            else
                            {
                                _18985 = _7486;
                            }
                            _19005 = (((gBackdrop3.sample(gLinear, _18980, level(0.0)) * (_7458.x * _7458.y)) + (gBackdrop3.sample(gLinear, _18981, level(0.0)) * (_7462.x * _7458.y))) + (gBackdrop3.sample(gLinear, _18983, level(0.0)) * (_7458.x * _7462.y))) + (gBackdrop3.sample(gLinear, _18985, level(0.0)) * (_7462.x * _7462.y));
                        }
                        else
                        {
                            float4 _19006;
                            if (_7305 == 4)
                            {
                                float2 _18973;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17799 = _7474;
                                    _17799.y = 1.0 - _7474.y;
                                    _18973 = _17799;
                                }
                                else
                                {
                                    _18973 = _7474;
                                }
                                float _7921 = _7474.y;
                                float2 _7922 = float2(_7486.x, _7921);
                                float2 _18974;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17806 = _7922;
                                    _17806.y = 1.0 - _7921;
                                    _18974 = _17806;
                                }
                                else
                                {
                                    _18974 = _7922;
                                }
                                float _7939 = _7486.y;
                                float2 _7940 = float2(_7474.x, _7939);
                                float2 _18976;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17813 = _7940;
                                    _17813.y = 1.0 - _7939;
                                    _18976 = _17813;
                                }
                                else
                                {
                                    _18976 = _7940;
                                }
                                float2 _18978;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17820 = _7486;
                                    _17820.y = 1.0 - _7486.y;
                                    _18978 = _17820;
                                }
                                else
                                {
                                    _18978 = _7486;
                                }
                                _19006 = (((gBackdrop4.sample(gLinear, _18973, level(0.0)) * (_7458.x * _7458.y)) + (gBackdrop4.sample(gLinear, _18974, level(0.0)) * (_7462.x * _7458.y))) + (gBackdrop4.sample(gLinear, _18976, level(0.0)) * (_7458.x * _7462.y))) + (gBackdrop4.sample(gLinear, _18978, level(0.0)) * (_7462.x * _7462.y));
                            }
                            else
                            {
                                float2 _18966;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17827 = _7474;
                                    _17827.y = 1.0 - _7474.y;
                                    _18966 = _17827;
                                }
                                else
                                {
                                    _18966 = _7474;
                                }
                                float _8051 = _7474.y;
                                float2 _8052 = float2(_7486.x, _8051);
                                float2 _18967;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17834 = _8052;
                                    _17834.y = 1.0 - _8051;
                                    _18967 = _17834;
                                }
                                else
                                {
                                    _18967 = _8052;
                                }
                                float _8069 = _7486.y;
                                float2 _8070 = float2(_7474.x, _8069);
                                float2 _18969;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17841 = _8070;
                                    _17841.y = 1.0 - _8069;
                                    _18969 = _17841;
                                }
                                else
                                {
                                    _18969 = _8070;
                                }
                                float2 _18971;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _17848 = _7486;
                                    _17848.y = 1.0 - _7486.y;
                                    _18971 = _17848;
                                }
                                else
                                {
                                    _18971 = _7486;
                                }
                                _19006 = (((gBackdrop5.sample(gLinear, _18966, level(0.0)) * (_7458.x * _7458.y)) + (gBackdrop5.sample(gLinear, _18967, level(0.0)) * (_7462.x * _7458.y))) + (gBackdrop5.sample(gLinear, _18969, level(0.0)) * (_7458.x * _7462.y))) + (gBackdrop5.sample(gLinear, _18971, level(0.0)) * (_7462.x * _7462.y));
                            }
                            _19005 = _19006;
                        }
                        _19004 = _19005;
                    }
                    _19003 = _19004;
                }
                _19002 = _19003;
            }
            _7319 = _19035 + (_19002.xyz * (_7290 ? ((_18965 == 0) ? (1.0 - _7285) : _7285) : 1.0));
        }
        float _8155 = dot(in.i_fill0.xyz, float3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float _4734 = fast::max(_18846, 0.0) / fast::max(in.i_radii.w, 0.001000000047497451305389404296875);
        float _4737 = (_8155 > 0.5) ? 0.0 : 1.0;
        float _8167 = fast::clamp(0.85000002384185791015625 * ((fast::clamp((0.5 - abs(_8155 - dot(select(float3(0.5), _19035, bool3(_188.gTime.z > 0.5)), float3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)))) * 4.0, 0.0, 1.0) * in.i_radii.z) * exp(((-_4734) * _4734) * 2.2000000476837158203125)), 0.0, 1.0);
        _20057 = float4(float4(_4737, _4737, _4737, 0.85000002384185791015625).xyz * _8167, _8167) + (_19063 * (1.0 - _8167));
    }
    else
    {
        _20057 = _19063;
    }
    float4 _20644;
    float4 _20818;
    float _21241;
    if (((in.i_flags.x & _3037) != 0u) && (_4379 > 0.0))
    {
        uint _8191 = (in.i_instance * 24u) + 11u;
        uint _8199 = (in.i_instance * 24u) + 12u;
        uint _8207 = (in.i_instance * 24u) + 13u;
        uint _8215 = (in.i_instance * 24u) + 16u;
        float _8287 = gFxData_1._data[_8191].x * _188.gDisplay.z;
        float2 _8298 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(1.0));
        float _8306 = fast::clamp(gFxData_1._data[_8191].z, 0.001000000047497451305389404296875, fast::min(_8298.x, _8298.y));
        float _8315 = fast::clamp(1.0 - (fast::max(-_18846, 0.0) / _8306), 0.0, 1.0);
        float _8321 = sqrt(fast::clamp(1.0 - (_8315 * _8315), 0.0, 1.0));
        float2 _19258;
        float3 _19835;
        if (_8315 > 0.0)
        {
            float2 _8728 = in.i_local + float2(0.5, 0.0);
            float2 _8798 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
            float2 _8807 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
            float _19194;
            if ((in.i_flags.x & _1347) != 0u)
            {
                float _8913 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
                float4 _8947 = gTex.sample(gLinear, mix(_18821.xy, _18821.zw, (fast::clamp(_8728, _18827.xy, _18827.zw) - _18827.xy) / fast::max(_18827.zw - _18827.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
                float _8971 = (_8947.w - 0.5) * in.i_radii.y;
                float2 _9012 = abs(_8728 - ((_18827.xy + _18827.zw) * 0.5)) - fast::max(((_18827.zw - _18827.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _8913), float2(0.0));
                _19194 = fast::max((-mix((fast::max(fast::min(_8947.x, _8947.y), fast::min(fast::max(_8947.x, _8947.y), _8947.z)) - 0.5) * in.i_radii.x, _8971, fast::clamp(abs(_8971) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _8913, length(fast::max(_9012, float2(0.0))) + fast::min(fast::max(_9012.x, _9012.y), 0.0)) - in.i_shape.w;
            }
            else
            {
                float _19195;
                if (in.i_flags.z == 1u)
                {
                    float2 _8822 = _8728 - _8798;
                    float _19193;
                    do
                    {
                        if (in.i_shape.w >= 6.282185077667236328125)
                        {
                            _19193 = abs(length(_8822) - in.i_radii.x) - in.i_radii.y;
                            break;
                        }
                        float _9056 = in.i_shape.z + (in.i_shape.w * 0.5);
                        float _9058 = cos(_9056);
                        float _9060 = sin(_9056);
                        float _9069 = dot(_8822, float2(-_9060, _9058));
                        float _9072 = dot(_8822, float2(_9058, _9060));
                        float2 _9073 = float2(_9069, _9072);
                        float _9076 = abs(_9069);
                        _9073.x = _9076;
                        float _9079 = in.i_shape.w * 0.5;
                        float _9081 = sin(_9079);
                        float _9083 = cos(_9079);
                        _19193 = (((_9083 * _9076) > (_9081 * _9072)) ? length(_9073 - (float2(_9081, _9083) * in.i_radii.x)) : abs(length(_9073) - in.i_radii.x)) - in.i_radii.y;
                        break;
                    } while(false);
                    _19195 = _19193;
                }
                else
                {
                    float _19196;
                    if (in.i_flags.z == 2u)
                    {
                        float2 _9119 = _8728 - _18827.xy;
                        float2 _9122 = _18827.zw - _18827.xy;
                        _19196 = length(_9119 - (_9122 * fast::clamp(dot(_9119, _9122) / fast::max(dot(_9122, _9122), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                    }
                    else
                    {
                        float2 _8849 = _8728 - _8798;
                        float _9175 = fast::min(_8807.x, _8807.y);
                        float _9178 = fast::min((_8849.x > 0.0) ? ((_8849.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_8849.y > 0.0) ? in.i_radii.w : in.i_radii.x), _9175);
                        float _9184 = _9178 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _19178;
                        float _19179;
                        if (_9184 > _9175)
                        {
                            float _9198 = in.i_shape.y * fast::clamp((_9175 - _9178) / fast::max(0.60000002384185791015625 * _9178, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _19179 = _9198;
                            _19178 = _9178 * (1.0 + (0.60000002384185791015625 * _9198));
                        }
                        else
                        {
                            _19179 = in.i_shape.y;
                            _19178 = _9184;
                        }
                        float2 _9211 = (abs(_8849) - _8807) + float2(_19178);
                        float2 _9213 = fast::max(_9211, float2(0.0));
                        float _19180;
                        if ((_9213.x > 0.0) && (_9213.y > 0.0))
                        {
                            float _19181;
                            if ((_19179 > 0.001000000047497451305389404296875) && (_19178 > 9.9999997473787516355514526367188e-05))
                            {
                                float _9230 = 2.0 + (2.0 * _19179);
                                float2 _9235 = _9213 / float2(fast::max(_19178, 9.9999997473787516355514526367188e-05));
                                _19181 = pow(pow(_9235.x, _9230) + pow(_9235.y, _9230), 1.0 / _9230) * _19178;
                            }
                            else
                            {
                                _19181 = length(_9213);
                            }
                            _19180 = _19181;
                        }
                        else
                        {
                            _19180 = fast::max(_9213.x, _9213.y);
                        }
                        float _9270 = (fast::min(fast::max(_9211.x, _9211.y), 0.0) + _19180) - _19178;
                        float _19197;
                        if ((in.i_flags.x & _1416) != 0u)
                        {
                            float2 _8877 = fast::max((_18827.zw - _18827.xy) * 0.5, float2(0.001000000047497451305389404296875));
                            float2 _8880 = _8728 - ((_18827.xy + _18827.zw) * 0.5);
                            float _9306 = fast::min(_8877.x, _8877.y);
                            float _9309 = fast::min((_8880.x > 0.0) ? ((_8880.y > 0.0) ? gFxData_1._data[_8215].x : gFxData_1._data[_8215].x) : ((_8880.y > 0.0) ? gFxData_1._data[_8215].x : gFxData_1._data[_8215].x), _9306);
                            float _9315 = _9309 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                            float _19184;
                            float _19185;
                            if (_9315 > _9306)
                            {
                                float _9329 = in.i_shape.y * fast::clamp((_9306 - _9309) / fast::max(0.60000002384185791015625 * _9309, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _19185 = _9329;
                                _19184 = _9309 * (1.0 + (0.60000002384185791015625 * _9329));
                            }
                            else
                            {
                                _19185 = in.i_shape.y;
                                _19184 = _9315;
                            }
                            float2 _9342 = (abs(_8880) - _8877) + float2(_19184);
                            float2 _9344 = fast::max(_9342, float2(0.0));
                            float _19186;
                            if ((_9344.x > 0.0) && (_9344.y > 0.0))
                            {
                                float _19187;
                                if ((_19185 > 0.001000000047497451305389404296875) && (_19184 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _9361 = 2.0 + (2.0 * _19185);
                                    float2 _9366 = _9344 / float2(fast::max(_19184, 9.9999997473787516355514526367188e-05));
                                    _19187 = pow(pow(_9366.x, _9361) + pow(_9366.y, _9361), 1.0 / _9361) * _19184;
                                }
                                else
                                {
                                    _19187 = length(_9344);
                                }
                                _19186 = _19187;
                            }
                            else
                            {
                                _19186 = fast::max(_9344.x, _9344.y);
                            }
                            float _9401 = (fast::min(fast::max(_9342.x, _9342.y), 0.0) + _19186) - _19184;
                            float _9406 = fast::max(gFxData_1._data[_8215].y, 9.9999997473787516355514526367188e-05);
                            float _9415 = fast::max(_9406 - abs(_9270 - _9401), 0.0) / _9406;
                            _19197 = fast::min(_9270, _9401) - (((_9415 * _9415) * _9406) * 0.25);
                        }
                        else
                        {
                            _19197 = _9270;
                        }
                        _19196 = _19197;
                    }
                    _19195 = _19196;
                }
                _19194 = _19195;
            }
            float2 _8732 = in.i_local - float2(0.5, 0.0);
            float2 _9466 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
            float2 _9475 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
            float _19214;
            if ((in.i_flags.x & _1347) != 0u)
            {
                float _9581 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
                float4 _9615 = gTex.sample(gLinear, mix(_18821.xy, _18821.zw, (fast::clamp(_8732, _18827.xy, _18827.zw) - _18827.xy) / fast::max(_18827.zw - _18827.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
                float _9639 = (_9615.w - 0.5) * in.i_radii.y;
                float2 _9680 = abs(_8732 - ((_18827.xy + _18827.zw) * 0.5)) - fast::max(((_18827.zw - _18827.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _9581), float2(0.0));
                _19214 = fast::max((-mix((fast::max(fast::min(_9615.x, _9615.y), fast::min(fast::max(_9615.x, _9615.y), _9615.z)) - 0.5) * in.i_radii.x, _9639, fast::clamp(abs(_9639) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _9581, length(fast::max(_9680, float2(0.0))) + fast::min(fast::max(_9680.x, _9680.y), 0.0)) - in.i_shape.w;
            }
            else
            {
                float _19215;
                if (in.i_flags.z == 1u)
                {
                    float2 _9490 = _8732 - _9466;
                    float _19213;
                    do
                    {
                        if (in.i_shape.w >= 6.282185077667236328125)
                        {
                            _19213 = abs(length(_9490) - in.i_radii.x) - in.i_radii.y;
                            break;
                        }
                        float _9724 = in.i_shape.z + (in.i_shape.w * 0.5);
                        float _9726 = cos(_9724);
                        float _9728 = sin(_9724);
                        float _9737 = dot(_9490, float2(-_9728, _9726));
                        float _9740 = dot(_9490, float2(_9726, _9728));
                        float2 _9741 = float2(_9737, _9740);
                        float _9744 = abs(_9737);
                        _9741.x = _9744;
                        float _9747 = in.i_shape.w * 0.5;
                        float _9749 = sin(_9747);
                        float _9751 = cos(_9747);
                        _19213 = (((_9751 * _9744) > (_9749 * _9740)) ? length(_9741 - (float2(_9749, _9751) * in.i_radii.x)) : abs(length(_9741) - in.i_radii.x)) - in.i_radii.y;
                        break;
                    } while(false);
                    _19215 = _19213;
                }
                else
                {
                    float _19216;
                    if (in.i_flags.z == 2u)
                    {
                        float2 _9787 = _8732 - _18827.xy;
                        float2 _9790 = _18827.zw - _18827.xy;
                        _19216 = length(_9787 - (_9790 * fast::clamp(dot(_9787, _9790) / fast::max(dot(_9790, _9790), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                    }
                    else
                    {
                        float2 _9517 = _8732 - _9466;
                        float _9843 = fast::min(_9475.x, _9475.y);
                        float _9846 = fast::min((_9517.x > 0.0) ? ((_9517.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_9517.y > 0.0) ? in.i_radii.w : in.i_radii.x), _9843);
                        float _9852 = _9846 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _19198;
                        float _19199;
                        if (_9852 > _9843)
                        {
                            float _9866 = in.i_shape.y * fast::clamp((_9843 - _9846) / fast::max(0.60000002384185791015625 * _9846, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _19199 = _9866;
                            _19198 = _9846 * (1.0 + (0.60000002384185791015625 * _9866));
                        }
                        else
                        {
                            _19199 = in.i_shape.y;
                            _19198 = _9852;
                        }
                        float2 _9879 = (abs(_9517) - _9475) + float2(_19198);
                        float2 _9881 = fast::max(_9879, float2(0.0));
                        float _19200;
                        if ((_9881.x > 0.0) && (_9881.y > 0.0))
                        {
                            float _19201;
                            if ((_19199 > 0.001000000047497451305389404296875) && (_19198 > 9.9999997473787516355514526367188e-05))
                            {
                                float _9898 = 2.0 + (2.0 * _19199);
                                float2 _9903 = _9881 / float2(fast::max(_19198, 9.9999997473787516355514526367188e-05));
                                _19201 = pow(pow(_9903.x, _9898) + pow(_9903.y, _9898), 1.0 / _9898) * _19198;
                            }
                            else
                            {
                                _19201 = length(_9881);
                            }
                            _19200 = _19201;
                        }
                        else
                        {
                            _19200 = fast::max(_9881.x, _9881.y);
                        }
                        float _9938 = (fast::min(fast::max(_9879.x, _9879.y), 0.0) + _19200) - _19198;
                        float _19217;
                        if ((in.i_flags.x & _1416) != 0u)
                        {
                            float2 _9545 = fast::max((_18827.zw - _18827.xy) * 0.5, float2(0.001000000047497451305389404296875));
                            float2 _9548 = _8732 - ((_18827.xy + _18827.zw) * 0.5);
                            float _9974 = fast::min(_9545.x, _9545.y);
                            float _9977 = fast::min((_9548.x > 0.0) ? ((_9548.y > 0.0) ? gFxData_1._data[_8215].x : gFxData_1._data[_8215].x) : ((_9548.y > 0.0) ? gFxData_1._data[_8215].x : gFxData_1._data[_8215].x), _9974);
                            float _9983 = _9977 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                            float _19204;
                            float _19205;
                            if (_9983 > _9974)
                            {
                                float _9997 = in.i_shape.y * fast::clamp((_9974 - _9977) / fast::max(0.60000002384185791015625 * _9977, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _19205 = _9997;
                                _19204 = _9977 * (1.0 + (0.60000002384185791015625 * _9997));
                            }
                            else
                            {
                                _19205 = in.i_shape.y;
                                _19204 = _9983;
                            }
                            float2 _10010 = (abs(_9548) - _9545) + float2(_19204);
                            float2 _10012 = fast::max(_10010, float2(0.0));
                            float _19206;
                            if ((_10012.x > 0.0) && (_10012.y > 0.0))
                            {
                                float _19207;
                                if ((_19205 > 0.001000000047497451305389404296875) && (_19204 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _10029 = 2.0 + (2.0 * _19205);
                                    float2 _10034 = _10012 / float2(fast::max(_19204, 9.9999997473787516355514526367188e-05));
                                    _19207 = pow(pow(_10034.x, _10029) + pow(_10034.y, _10029), 1.0 / _10029) * _19204;
                                }
                                else
                                {
                                    _19207 = length(_10012);
                                }
                                _19206 = _19207;
                            }
                            else
                            {
                                _19206 = fast::max(_10012.x, _10012.y);
                            }
                            float _10069 = (fast::min(fast::max(_10010.x, _10010.y), 0.0) + _19206) - _19204;
                            float _10074 = fast::max(gFxData_1._data[_8215].y, 9.9999997473787516355514526367188e-05);
                            float _10083 = fast::max(_10074 - abs(_9938 - _10069), 0.0) / _10074;
                            _19217 = fast::min(_9938, _10069) - (((_10083 * _10083) * _10074) * 0.25);
                        }
                        else
                        {
                            _19217 = _9938;
                        }
                        _19216 = _19217;
                    }
                    _19215 = _19216;
                }
                _19214 = _19215;
            }
            float2 _8737 = in.i_local + float2(0.0, 0.5);
            float2 _10134 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
            float2 _10143 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
            float _19234;
            if ((in.i_flags.x & _1347) != 0u)
            {
                float _10249 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
                float4 _10283 = gTex.sample(gLinear, mix(_18821.xy, _18821.zw, (fast::clamp(_8737, _18827.xy, _18827.zw) - _18827.xy) / fast::max(_18827.zw - _18827.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
                float _10307 = (_10283.w - 0.5) * in.i_radii.y;
                float2 _10348 = abs(_8737 - ((_18827.xy + _18827.zw) * 0.5)) - fast::max(((_18827.zw - _18827.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _10249), float2(0.0));
                _19234 = fast::max((-mix((fast::max(fast::min(_10283.x, _10283.y), fast::min(fast::max(_10283.x, _10283.y), _10283.z)) - 0.5) * in.i_radii.x, _10307, fast::clamp(abs(_10307) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _10249, length(fast::max(_10348, float2(0.0))) + fast::min(fast::max(_10348.x, _10348.y), 0.0)) - in.i_shape.w;
            }
            else
            {
                float _19235;
                if (in.i_flags.z == 1u)
                {
                    float2 _10158 = _8737 - _10134;
                    float _19233;
                    do
                    {
                        if (in.i_shape.w >= 6.282185077667236328125)
                        {
                            _19233 = abs(length(_10158) - in.i_radii.x) - in.i_radii.y;
                            break;
                        }
                        float _10392 = in.i_shape.z + (in.i_shape.w * 0.5);
                        float _10394 = cos(_10392);
                        float _10396 = sin(_10392);
                        float _10405 = dot(_10158, float2(-_10396, _10394));
                        float _10408 = dot(_10158, float2(_10394, _10396));
                        float2 _10409 = float2(_10405, _10408);
                        float _10412 = abs(_10405);
                        _10409.x = _10412;
                        float _10415 = in.i_shape.w * 0.5;
                        float _10417 = sin(_10415);
                        float _10419 = cos(_10415);
                        _19233 = (((_10419 * _10412) > (_10417 * _10408)) ? length(_10409 - (float2(_10417, _10419) * in.i_radii.x)) : abs(length(_10409) - in.i_radii.x)) - in.i_radii.y;
                        break;
                    } while(false);
                    _19235 = _19233;
                }
                else
                {
                    float _19236;
                    if (in.i_flags.z == 2u)
                    {
                        float2 _10455 = _8737 - _18827.xy;
                        float2 _10458 = _18827.zw - _18827.xy;
                        _19236 = length(_10455 - (_10458 * fast::clamp(dot(_10455, _10458) / fast::max(dot(_10458, _10458), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                    }
                    else
                    {
                        float2 _10185 = _8737 - _10134;
                        float _10511 = fast::min(_10143.x, _10143.y);
                        float _10514 = fast::min((_10185.x > 0.0) ? ((_10185.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_10185.y > 0.0) ? in.i_radii.w : in.i_radii.x), _10511);
                        float _10520 = _10514 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _19218;
                        float _19219;
                        if (_10520 > _10511)
                        {
                            float _10534 = in.i_shape.y * fast::clamp((_10511 - _10514) / fast::max(0.60000002384185791015625 * _10514, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _19219 = _10534;
                            _19218 = _10514 * (1.0 + (0.60000002384185791015625 * _10534));
                        }
                        else
                        {
                            _19219 = in.i_shape.y;
                            _19218 = _10520;
                        }
                        float2 _10547 = (abs(_10185) - _10143) + float2(_19218);
                        float2 _10549 = fast::max(_10547, float2(0.0));
                        float _19220;
                        if ((_10549.x > 0.0) && (_10549.y > 0.0))
                        {
                            float _19221;
                            if ((_19219 > 0.001000000047497451305389404296875) && (_19218 > 9.9999997473787516355514526367188e-05))
                            {
                                float _10566 = 2.0 + (2.0 * _19219);
                                float2 _10571 = _10549 / float2(fast::max(_19218, 9.9999997473787516355514526367188e-05));
                                _19221 = pow(pow(_10571.x, _10566) + pow(_10571.y, _10566), 1.0 / _10566) * _19218;
                            }
                            else
                            {
                                _19221 = length(_10549);
                            }
                            _19220 = _19221;
                        }
                        else
                        {
                            _19220 = fast::max(_10549.x, _10549.y);
                        }
                        float _10606 = (fast::min(fast::max(_10547.x, _10547.y), 0.0) + _19220) - _19218;
                        float _19237;
                        if ((in.i_flags.x & _1416) != 0u)
                        {
                            float2 _10213 = fast::max((_18827.zw - _18827.xy) * 0.5, float2(0.001000000047497451305389404296875));
                            float2 _10216 = _8737 - ((_18827.xy + _18827.zw) * 0.5);
                            float _10642 = fast::min(_10213.x, _10213.y);
                            float _10645 = fast::min((_10216.x > 0.0) ? ((_10216.y > 0.0) ? gFxData_1._data[_8215].x : gFxData_1._data[_8215].x) : ((_10216.y > 0.0) ? gFxData_1._data[_8215].x : gFxData_1._data[_8215].x), _10642);
                            float _10651 = _10645 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                            float _19224;
                            float _19225;
                            if (_10651 > _10642)
                            {
                                float _10665 = in.i_shape.y * fast::clamp((_10642 - _10645) / fast::max(0.60000002384185791015625 * _10645, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _19225 = _10665;
                                _19224 = _10645 * (1.0 + (0.60000002384185791015625 * _10665));
                            }
                            else
                            {
                                _19225 = in.i_shape.y;
                                _19224 = _10651;
                            }
                            float2 _10678 = (abs(_10216) - _10213) + float2(_19224);
                            float2 _10680 = fast::max(_10678, float2(0.0));
                            float _19226;
                            if ((_10680.x > 0.0) && (_10680.y > 0.0))
                            {
                                float _19227;
                                if ((_19225 > 0.001000000047497451305389404296875) && (_19224 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _10697 = 2.0 + (2.0 * _19225);
                                    float2 _10702 = _10680 / float2(fast::max(_19224, 9.9999997473787516355514526367188e-05));
                                    _19227 = pow(pow(_10702.x, _10697) + pow(_10702.y, _10697), 1.0 / _10697) * _19224;
                                }
                                else
                                {
                                    _19227 = length(_10680);
                                }
                                _19226 = _19227;
                            }
                            else
                            {
                                _19226 = fast::max(_10680.x, _10680.y);
                            }
                            float _10737 = (fast::min(fast::max(_10678.x, _10678.y), 0.0) + _19226) - _19224;
                            float _10742 = fast::max(gFxData_1._data[_8215].y, 9.9999997473787516355514526367188e-05);
                            float _10751 = fast::max(_10742 - abs(_10606 - _10737), 0.0) / _10742;
                            _19237 = fast::min(_10606, _10737) - (((_10751 * _10751) * _10742) * 0.25);
                        }
                        else
                        {
                            _19237 = _10606;
                        }
                        _19236 = _19237;
                    }
                    _19235 = _19236;
                }
                _19234 = _19235;
            }
            float2 _8741 = in.i_local - float2(0.0, 0.5);
            float2 _10802 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
            float2 _10811 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
            float _19254;
            if ((in.i_flags.x & _1347) != 0u)
            {
                float _10917 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
                float4 _10951 = gTex.sample(gLinear, mix(_18821.xy, _18821.zw, (fast::clamp(_8741, _18827.xy, _18827.zw) - _18827.xy) / fast::max(_18827.zw - _18827.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
                float _10975 = (_10951.w - 0.5) * in.i_radii.y;
                float2 _11016 = abs(_8741 - ((_18827.xy + _18827.zw) * 0.5)) - fast::max(((_18827.zw - _18827.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _10917), float2(0.0));
                _19254 = fast::max((-mix((fast::max(fast::min(_10951.x, _10951.y), fast::min(fast::max(_10951.x, _10951.y), _10951.z)) - 0.5) * in.i_radii.x, _10975, fast::clamp(abs(_10975) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _10917, length(fast::max(_11016, float2(0.0))) + fast::min(fast::max(_11016.x, _11016.y), 0.0)) - in.i_shape.w;
            }
            else
            {
                float _19255;
                if (in.i_flags.z == 1u)
                {
                    float2 _10826 = _8741 - _10802;
                    float _19253;
                    do
                    {
                        if (in.i_shape.w >= 6.282185077667236328125)
                        {
                            _19253 = abs(length(_10826) - in.i_radii.x) - in.i_radii.y;
                            break;
                        }
                        float _11060 = in.i_shape.z + (in.i_shape.w * 0.5);
                        float _11062 = cos(_11060);
                        float _11064 = sin(_11060);
                        float _11073 = dot(_10826, float2(-_11064, _11062));
                        float _11076 = dot(_10826, float2(_11062, _11064));
                        float2 _11077 = float2(_11073, _11076);
                        float _11080 = abs(_11073);
                        _11077.x = _11080;
                        float _11083 = in.i_shape.w * 0.5;
                        float _11085 = sin(_11083);
                        float _11087 = cos(_11083);
                        _19253 = (((_11087 * _11080) > (_11085 * _11076)) ? length(_11077 - (float2(_11085, _11087) * in.i_radii.x)) : abs(length(_11077) - in.i_radii.x)) - in.i_radii.y;
                        break;
                    } while(false);
                    _19255 = _19253;
                }
                else
                {
                    float _19256;
                    if (in.i_flags.z == 2u)
                    {
                        float2 _11123 = _8741 - _18827.xy;
                        float2 _11126 = _18827.zw - _18827.xy;
                        _19256 = length(_11123 - (_11126 * fast::clamp(dot(_11123, _11126) / fast::max(dot(_11126, _11126), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                    }
                    else
                    {
                        float2 _10853 = _8741 - _10802;
                        float _11179 = fast::min(_10811.x, _10811.y);
                        float _11182 = fast::min((_10853.x > 0.0) ? ((_10853.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_10853.y > 0.0) ? in.i_radii.w : in.i_radii.x), _11179);
                        float _11188 = _11182 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _19238;
                        float _19239;
                        if (_11188 > _11179)
                        {
                            float _11202 = in.i_shape.y * fast::clamp((_11179 - _11182) / fast::max(0.60000002384185791015625 * _11182, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _19239 = _11202;
                            _19238 = _11182 * (1.0 + (0.60000002384185791015625 * _11202));
                        }
                        else
                        {
                            _19239 = in.i_shape.y;
                            _19238 = _11188;
                        }
                        float2 _11215 = (abs(_10853) - _10811) + float2(_19238);
                        float2 _11217 = fast::max(_11215, float2(0.0));
                        float _19240;
                        if ((_11217.x > 0.0) && (_11217.y > 0.0))
                        {
                            float _19241;
                            if ((_19239 > 0.001000000047497451305389404296875) && (_19238 > 9.9999997473787516355514526367188e-05))
                            {
                                float _11234 = 2.0 + (2.0 * _19239);
                                float2 _11239 = _11217 / float2(fast::max(_19238, 9.9999997473787516355514526367188e-05));
                                _19241 = pow(pow(_11239.x, _11234) + pow(_11239.y, _11234), 1.0 / _11234) * _19238;
                            }
                            else
                            {
                                _19241 = length(_11217);
                            }
                            _19240 = _19241;
                        }
                        else
                        {
                            _19240 = fast::max(_11217.x, _11217.y);
                        }
                        float _11274 = (fast::min(fast::max(_11215.x, _11215.y), 0.0) + _19240) - _19238;
                        float _19257;
                        if ((in.i_flags.x & _1416) != 0u)
                        {
                            float2 _10881 = fast::max((_18827.zw - _18827.xy) * 0.5, float2(0.001000000047497451305389404296875));
                            float2 _10884 = _8741 - ((_18827.xy + _18827.zw) * 0.5);
                            float _11310 = fast::min(_10881.x, _10881.y);
                            float _11313 = fast::min((_10884.x > 0.0) ? ((_10884.y > 0.0) ? gFxData_1._data[_8215].x : gFxData_1._data[_8215].x) : ((_10884.y > 0.0) ? gFxData_1._data[_8215].x : gFxData_1._data[_8215].x), _11310);
                            float _11319 = _11313 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                            float _19244;
                            float _19245;
                            if (_11319 > _11310)
                            {
                                float _11333 = in.i_shape.y * fast::clamp((_11310 - _11313) / fast::max(0.60000002384185791015625 * _11313, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _19245 = _11333;
                                _19244 = _11313 * (1.0 + (0.60000002384185791015625 * _11333));
                            }
                            else
                            {
                                _19245 = in.i_shape.y;
                                _19244 = _11319;
                            }
                            float2 _11346 = (abs(_10884) - _10881) + float2(_19244);
                            float2 _11348 = fast::max(_11346, float2(0.0));
                            float _19246;
                            if ((_11348.x > 0.0) && (_11348.y > 0.0))
                            {
                                float _19247;
                                if ((_19245 > 0.001000000047497451305389404296875) && (_19244 > 9.9999997473787516355514526367188e-05))
                                {
                                    float _11365 = 2.0 + (2.0 * _19245);
                                    float2 _11370 = _11348 / float2(fast::max(_19244, 9.9999997473787516355514526367188e-05));
                                    _19247 = pow(pow(_11370.x, _11365) + pow(_11370.y, _11365), 1.0 / _11365) * _19244;
                                }
                                else
                                {
                                    _19247 = length(_11348);
                                }
                                _19246 = _19247;
                            }
                            else
                            {
                                _19246 = fast::max(_11348.x, _11348.y);
                            }
                            float _11405 = (fast::min(fast::max(_11346.x, _11346.y), 0.0) + _19246) - _19244;
                            float _11410 = fast::max(gFxData_1._data[_8215].y, 9.9999997473787516355514526367188e-05);
                            float _11419 = fast::max(_11410 - abs(_11274 - _11405), 0.0) / _11410;
                            _19257 = fast::min(_11274, _11405) - (((_11419 * _11419) * _11410) * 0.25);
                        }
                        else
                        {
                            _19257 = _11274;
                        }
                        _19256 = _19257;
                    }
                    _19255 = _19256;
                }
                _19254 = _19255;
            }
            float2 _8747 = float2(_19194 - _19214, _19234 - _19254);
            float _8749 = length(_8747);
            float2 _8757 = select(float2(0.0, -1.0), _8747 / float2(_8749), bool2(_8749 > 9.9999997473787516355514526367188e-06));
            _19835 = fast::normalize(float3(_8757 * fast::min(_8315 / fast::max(_8321, 0.001000000047497451305389404296875), 8.0), 1.0));
            _19258 = _8757;
        }
        else
        {
            _19835 = float3(0.0, 0.0, 1.0);
            _19258 = float2(0.0, -1.0);
        }
        float2 _8347 = ((-_19258) * gFxData_1._data[_8191].y) * (1.0 - _8321);
        float2 _19259;
        if (gFxData_1._data[_8215].z > 0.0)
        {
            _19259 = (((in.i_rect.xy + in.i_rect.zw) * 0.5) - in.i_local) * (gFxData_1._data[_8215].z / (1.0 + gFxData_1._data[_8215].z));
        }
        else
        {
            _19259 = float2(0.0);
        }
        float2 _8373 = _18820 * _188.gTarget.zw;
        float2 _8380 = _188.gDisplay.zw * _188.gTarget.zw;
        float2 _8385 = (_8347 + _19259) * _8380;
        float2 _8388 = _8347 * _8380;
        float3 _19717;
        float _19735;
        float3 _19938;
        if (_188.gTime.z > 0.5)
        {
            float2 _8395 = _8373 + _8385;
            float _11444 = fast::clamp(log2(fast::max(_8287, 1.0)) - 1.0, 0.0, 5.0);
            int _11447 = int(floor(_11444));
            float _11451 = _11444 - float(_11447);
            bool _11456 = (_11451 > 0.0199999995529651641845703125) && (_11447 < 5);
            float3 _19330;
            _19330 = float3(0.0);
            float3 _11485;
            for (int _19260 = 0; _19260 < 2; _19330 = _11485, _19260++)
            {
                if ((_19260 > 0) && (!_11456))
                {
                    break;
                }
                int _11471 = _11447 + _19260;
                int _11509 = clamp(_11471, 1, 5);
                float2 _11578 = (_8395 * _188.gLevel[_11509].xy) - float2(0.5);
                float2 _11580 = floor(_11578);
                float2 _11583 = _11578 - _11580;
                float2 _11586 = _11583 * _11583;
                float2 _11589 = _11586 * _11583;
                float2 _11608 = (((_11589 * 3.0) - (_11586 * 6.0)) + float2(4.0)) * 0.16666667163372039794921875;
                float2 _11621 = _11589 * 0.16666667163372039794921875;
                float2 _11624 = (((((-_11589) + (_11586 * 3.0)) - (_11583 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _11608;
                float2 _11628 = (((((_11589 * (-3.0)) + (_11586 * 3.0)) + (_11583 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _11621;
                float2 _11640 = ((_11580 - float2(0.5)) + (_11608 / _11624)) * _188.gLevel[_11509].zw;
                float2 _11652 = ((_11580 + float2(1.5)) + (_11621 / _11628)) * _188.gLevel[_11509].zw;
                float4 _19297;
                if (_11471 <= 0)
                {
                    float2 _19296;
                    if (_188.gConv.x > 0.5)
                    {
                        float2 _18136 = _8395;
                        _18136.y = 1.0 - _8395.y;
                        _19296 = _18136;
                    }
                    else
                    {
                        _19296 = _8395;
                    }
                    _19297 = gBackdrop0.sample(gLinear, _19296, level(0.0));
                }
                else
                {
                    float4 _19298;
                    if (_11471 == 1)
                    {
                        float2 _19289;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _18141 = _11640;
                            _18141.y = 1.0 - _11640.y;
                            _19289 = _18141;
                        }
                        else
                        {
                            _19289 = _11640;
                        }
                        float2 _11698 = float2(_11652.x, _11640.y);
                        float2 _19290;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _18148 = _11698;
                            _18148.y = 1.0 - _11640.y;
                            _19290 = _18148;
                        }
                        else
                        {
                            _19290 = _11698;
                        }
                        float2 _11716 = float2(_11640.x, _11652.y);
                        float2 _19292;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _18155 = _11716;
                            _18155.y = 1.0 - _11652.y;
                            _19292 = _18155;
                        }
                        else
                        {
                            _19292 = _11716;
                        }
                        float2 _19294;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _18162 = _11652;
                            _18162.y = 1.0 - _11652.y;
                            _19294 = _18162;
                        }
                        else
                        {
                            _19294 = _11652;
                        }
                        _19298 = (((gBackdrop1.sample(gLinear, _19289, level(0.0)) * (_11624.x * _11624.y)) + (gBackdrop1.sample(gLinear, _19290, level(0.0)) * (_11628.x * _11624.y))) + (gBackdrop1.sample(gLinear, _19292, level(0.0)) * (_11624.x * _11628.y))) + (gBackdrop1.sample(gLinear, _19294, level(0.0)) * (_11628.x * _11628.y));
                    }
                    else
                    {
                        float4 _19299;
                        if (_11471 == 2)
                        {
                            float2 _19282;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18169 = _11640;
                                _18169.y = 1.0 - _11640.y;
                                _19282 = _18169;
                            }
                            else
                            {
                                _19282 = _11640;
                            }
                            float2 _11828 = float2(_11652.x, _11640.y);
                            float2 _19283;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18176 = _11828;
                                _18176.y = 1.0 - _11640.y;
                                _19283 = _18176;
                            }
                            else
                            {
                                _19283 = _11828;
                            }
                            float2 _11846 = float2(_11640.x, _11652.y);
                            float2 _19285;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18183 = _11846;
                                _18183.y = 1.0 - _11652.y;
                                _19285 = _18183;
                            }
                            else
                            {
                                _19285 = _11846;
                            }
                            float2 _19287;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18190 = _11652;
                                _18190.y = 1.0 - _11652.y;
                                _19287 = _18190;
                            }
                            else
                            {
                                _19287 = _11652;
                            }
                            _19299 = (((gBackdrop2.sample(gLinear, _19282, level(0.0)) * (_11624.x * _11624.y)) + (gBackdrop2.sample(gLinear, _19283, level(0.0)) * (_11628.x * _11624.y))) + (gBackdrop2.sample(gLinear, _19285, level(0.0)) * (_11624.x * _11628.y))) + (gBackdrop2.sample(gLinear, _19287, level(0.0)) * (_11628.x * _11628.y));
                        }
                        else
                        {
                            float4 _19300;
                            if (_11471 == 3)
                            {
                                float2 _19275;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18197 = _11640;
                                    _18197.y = 1.0 - _11640.y;
                                    _19275 = _18197;
                                }
                                else
                                {
                                    _19275 = _11640;
                                }
                                float2 _11958 = float2(_11652.x, _11640.y);
                                float2 _19276;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18204 = _11958;
                                    _18204.y = 1.0 - _11640.y;
                                    _19276 = _18204;
                                }
                                else
                                {
                                    _19276 = _11958;
                                }
                                float2 _11976 = float2(_11640.x, _11652.y);
                                float2 _19278;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18211 = _11976;
                                    _18211.y = 1.0 - _11652.y;
                                    _19278 = _18211;
                                }
                                else
                                {
                                    _19278 = _11976;
                                }
                                float2 _19280;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18218 = _11652;
                                    _18218.y = 1.0 - _11652.y;
                                    _19280 = _18218;
                                }
                                else
                                {
                                    _19280 = _11652;
                                }
                                _19300 = (((gBackdrop3.sample(gLinear, _19275, level(0.0)) * (_11624.x * _11624.y)) + (gBackdrop3.sample(gLinear, _19276, level(0.0)) * (_11628.x * _11624.y))) + (gBackdrop3.sample(gLinear, _19278, level(0.0)) * (_11624.x * _11628.y))) + (gBackdrop3.sample(gLinear, _19280, level(0.0)) * (_11628.x * _11628.y));
                            }
                            else
                            {
                                float4 _19301;
                                if (_11471 == 4)
                                {
                                    float2 _19268;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18225 = _11640;
                                        _18225.y = 1.0 - _11640.y;
                                        _19268 = _18225;
                                    }
                                    else
                                    {
                                        _19268 = _11640;
                                    }
                                    float2 _12088 = float2(_11652.x, _11640.y);
                                    float2 _19269;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18232 = _12088;
                                        _18232.y = 1.0 - _11640.y;
                                        _19269 = _18232;
                                    }
                                    else
                                    {
                                        _19269 = _12088;
                                    }
                                    float2 _12106 = float2(_11640.x, _11652.y);
                                    float2 _19271;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18239 = _12106;
                                        _18239.y = 1.0 - _11652.y;
                                        _19271 = _18239;
                                    }
                                    else
                                    {
                                        _19271 = _12106;
                                    }
                                    float2 _19273;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18246 = _11652;
                                        _18246.y = 1.0 - _11652.y;
                                        _19273 = _18246;
                                    }
                                    else
                                    {
                                        _19273 = _11652;
                                    }
                                    _19301 = (((gBackdrop4.sample(gLinear, _19268, level(0.0)) * (_11624.x * _11624.y)) + (gBackdrop4.sample(gLinear, _19269, level(0.0)) * (_11628.x * _11624.y))) + (gBackdrop4.sample(gLinear, _19271, level(0.0)) * (_11624.x * _11628.y))) + (gBackdrop4.sample(gLinear, _19273, level(0.0)) * (_11628.x * _11628.y));
                                }
                                else
                                {
                                    float2 _19261;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18253 = _11640;
                                        _18253.y = 1.0 - _11640.y;
                                        _19261 = _18253;
                                    }
                                    else
                                    {
                                        _19261 = _11640;
                                    }
                                    float2 _12218 = float2(_11652.x, _11640.y);
                                    float2 _19262;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18260 = _12218;
                                        _18260.y = 1.0 - _11640.y;
                                        _19262 = _18260;
                                    }
                                    else
                                    {
                                        _19262 = _12218;
                                    }
                                    float2 _12236 = float2(_11640.x, _11652.y);
                                    float2 _19264;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18267 = _12236;
                                        _18267.y = 1.0 - _11652.y;
                                        _19264 = _18267;
                                    }
                                    else
                                    {
                                        _19264 = _12236;
                                    }
                                    float2 _19266;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18274 = _11652;
                                        _18274.y = 1.0 - _11652.y;
                                        _19266 = _18274;
                                    }
                                    else
                                    {
                                        _19266 = _11652;
                                    }
                                    _19301 = (((gBackdrop5.sample(gLinear, _19261, level(0.0)) * (_11624.x * _11624.y)) + (gBackdrop5.sample(gLinear, _19262, level(0.0)) * (_11628.x * _11624.y))) + (gBackdrop5.sample(gLinear, _19264, level(0.0)) * (_11624.x * _11628.y))) + (gBackdrop5.sample(gLinear, _19266, level(0.0)) * (_11628.x * _11628.y));
                                }
                                _19300 = _19301;
                            }
                            _19299 = _19300;
                        }
                        _19298 = _19299;
                    }
                    _19297 = _19298;
                }
                _11485 = _19330 + (_19297.xyz * (_11456 ? ((_19260 == 0) ? (1.0 - _11451) : _11451) : 1.0));
            }
            float3 _19720;
            if (((gFxData_1._data[_8191].w > 0.001000000047497451305389404296875) && (_8315 > 0.0)) && ((((gFxData_1._data[_8191].y * 0.300000011920928955078125) * gFxData_1._data[_8191].w) * _188.gDisplay.z) > (_8287 * 0.3499999940395355224609375)))
            {
                float _8415 = 0.300000011920928955078125 * gFxData_1._data[_8191].w;
                float2 _8422 = (_8373 + _8385) - (_8388 * _8415);
                float _12332 = fast::clamp(log2(fast::max(_8287, 1.0)) - 1.0, 0.0, 5.0);
                int _12335 = int(floor(_12332));
                float _12339 = _12332 - float(_12335);
                bool _12344 = (_12339 > 0.0199999995529651641845703125) && (_12335 < 5);
                float3 _19426;
                _19426 = float3(0.0);
                float3 _12373;
                for (int _19356 = 0; _19356 < 2; _19426 = _12373, _19356++)
                {
                    if ((_19356 > 0) && (!_12344))
                    {
                        break;
                    }
                    int _12359 = _12335 + _19356;
                    int _12397 = clamp(_12359, 1, 5);
                    float2 _12466 = (_8422 * _188.gLevel[_12397].xy) - float2(0.5);
                    float2 _12468 = floor(_12466);
                    float2 _12471 = _12466 - _12468;
                    float2 _12474 = _12471 * _12471;
                    float2 _12477 = _12474 * _12471;
                    float2 _12496 = (((_12477 * 3.0) - (_12474 * 6.0)) + float2(4.0)) * 0.16666667163372039794921875;
                    float2 _12509 = _12477 * 0.16666667163372039794921875;
                    float2 _12512 = (((((-_12477) + (_12474 * 3.0)) - (_12471 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _12496;
                    float2 _12516 = (((((_12477 * (-3.0)) + (_12474 * 3.0)) + (_12471 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _12509;
                    float2 _12528 = ((_12468 - float2(0.5)) + (_12496 / _12512)) * _188.gLevel[_12397].zw;
                    float2 _12540 = ((_12468 + float2(1.5)) + (_12509 / _12516)) * _188.gLevel[_12397].zw;
                    float4 _19393;
                    if (_12359 <= 0)
                    {
                        float2 _19392;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _18279 = _8422;
                            _18279.y = 1.0 - _8422.y;
                            _19392 = _18279;
                        }
                        else
                        {
                            _19392 = _8422;
                        }
                        _19393 = gBackdrop0.sample(gLinear, _19392, level(0.0));
                    }
                    else
                    {
                        float4 _19394;
                        if (_12359 == 1)
                        {
                            float2 _19385;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18284 = _12528;
                                _18284.y = 1.0 - _12528.y;
                                _19385 = _18284;
                            }
                            else
                            {
                                _19385 = _12528;
                            }
                            float _12585 = _12528.y;
                            float2 _12586 = float2(_12540.x, _12585);
                            float2 _19386;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18291 = _12586;
                                _18291.y = 1.0 - _12585;
                                _19386 = _18291;
                            }
                            else
                            {
                                _19386 = _12586;
                            }
                            float _12603 = _12540.y;
                            float2 _12604 = float2(_12528.x, _12603);
                            float2 _19388;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18298 = _12604;
                                _18298.y = 1.0 - _12603;
                                _19388 = _18298;
                            }
                            else
                            {
                                _19388 = _12604;
                            }
                            float2 _19390;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18305 = _12540;
                                _18305.y = 1.0 - _12540.y;
                                _19390 = _18305;
                            }
                            else
                            {
                                _19390 = _12540;
                            }
                            _19394 = (((gBackdrop1.sample(gLinear, _19385, level(0.0)) * (_12512.x * _12512.y)) + (gBackdrop1.sample(gLinear, _19386, level(0.0)) * (_12516.x * _12512.y))) + (gBackdrop1.sample(gLinear, _19388, level(0.0)) * (_12512.x * _12516.y))) + (gBackdrop1.sample(gLinear, _19390, level(0.0)) * (_12516.x * _12516.y));
                        }
                        else
                        {
                            float4 _19395;
                            if (_12359 == 2)
                            {
                                float2 _19378;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18312 = _12528;
                                    _18312.y = 1.0 - _12528.y;
                                    _19378 = _18312;
                                }
                                else
                                {
                                    _19378 = _12528;
                                }
                                float _12715 = _12528.y;
                                float2 _12716 = float2(_12540.x, _12715);
                                float2 _19379;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18319 = _12716;
                                    _18319.y = 1.0 - _12715;
                                    _19379 = _18319;
                                }
                                else
                                {
                                    _19379 = _12716;
                                }
                                float _12733 = _12540.y;
                                float2 _12734 = float2(_12528.x, _12733);
                                float2 _19381;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18326 = _12734;
                                    _18326.y = 1.0 - _12733;
                                    _19381 = _18326;
                                }
                                else
                                {
                                    _19381 = _12734;
                                }
                                float2 _19383;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18333 = _12540;
                                    _18333.y = 1.0 - _12540.y;
                                    _19383 = _18333;
                                }
                                else
                                {
                                    _19383 = _12540;
                                }
                                _19395 = (((gBackdrop2.sample(gLinear, _19378, level(0.0)) * (_12512.x * _12512.y)) + (gBackdrop2.sample(gLinear, _19379, level(0.0)) * (_12516.x * _12512.y))) + (gBackdrop2.sample(gLinear, _19381, level(0.0)) * (_12512.x * _12516.y))) + (gBackdrop2.sample(gLinear, _19383, level(0.0)) * (_12516.x * _12516.y));
                            }
                            else
                            {
                                float4 _19396;
                                if (_12359 == 3)
                                {
                                    float2 _19371;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18340 = _12528;
                                        _18340.y = 1.0 - _12528.y;
                                        _19371 = _18340;
                                    }
                                    else
                                    {
                                        _19371 = _12528;
                                    }
                                    float _12845 = _12528.y;
                                    float2 _12846 = float2(_12540.x, _12845);
                                    float2 _19372;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18347 = _12846;
                                        _18347.y = 1.0 - _12845;
                                        _19372 = _18347;
                                    }
                                    else
                                    {
                                        _19372 = _12846;
                                    }
                                    float _12863 = _12540.y;
                                    float2 _12864 = float2(_12528.x, _12863);
                                    float2 _19374;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18354 = _12864;
                                        _18354.y = 1.0 - _12863;
                                        _19374 = _18354;
                                    }
                                    else
                                    {
                                        _19374 = _12864;
                                    }
                                    float2 _19376;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18361 = _12540;
                                        _18361.y = 1.0 - _12540.y;
                                        _19376 = _18361;
                                    }
                                    else
                                    {
                                        _19376 = _12540;
                                    }
                                    _19396 = (((gBackdrop3.sample(gLinear, _19371, level(0.0)) * (_12512.x * _12512.y)) + (gBackdrop3.sample(gLinear, _19372, level(0.0)) * (_12516.x * _12512.y))) + (gBackdrop3.sample(gLinear, _19374, level(0.0)) * (_12512.x * _12516.y))) + (gBackdrop3.sample(gLinear, _19376, level(0.0)) * (_12516.x * _12516.y));
                                }
                                else
                                {
                                    float4 _19397;
                                    if (_12359 == 4)
                                    {
                                        float2 _19364;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18368 = _12528;
                                            _18368.y = 1.0 - _12528.y;
                                            _19364 = _18368;
                                        }
                                        else
                                        {
                                            _19364 = _12528;
                                        }
                                        float _12975 = _12528.y;
                                        float2 _12976 = float2(_12540.x, _12975);
                                        float2 _19365;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18375 = _12976;
                                            _18375.y = 1.0 - _12975;
                                            _19365 = _18375;
                                        }
                                        else
                                        {
                                            _19365 = _12976;
                                        }
                                        float _12993 = _12540.y;
                                        float2 _12994 = float2(_12528.x, _12993);
                                        float2 _19367;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18382 = _12994;
                                            _18382.y = 1.0 - _12993;
                                            _19367 = _18382;
                                        }
                                        else
                                        {
                                            _19367 = _12994;
                                        }
                                        float2 _19369;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18389 = _12540;
                                            _18389.y = 1.0 - _12540.y;
                                            _19369 = _18389;
                                        }
                                        else
                                        {
                                            _19369 = _12540;
                                        }
                                        _19397 = (((gBackdrop4.sample(gLinear, _19364, level(0.0)) * (_12512.x * _12512.y)) + (gBackdrop4.sample(gLinear, _19365, level(0.0)) * (_12516.x * _12512.y))) + (gBackdrop4.sample(gLinear, _19367, level(0.0)) * (_12512.x * _12516.y))) + (gBackdrop4.sample(gLinear, _19369, level(0.0)) * (_12516.x * _12516.y));
                                    }
                                    else
                                    {
                                        float2 _19357;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18396 = _12528;
                                            _18396.y = 1.0 - _12528.y;
                                            _19357 = _18396;
                                        }
                                        else
                                        {
                                            _19357 = _12528;
                                        }
                                        float _13105 = _12528.y;
                                        float2 _13106 = float2(_12540.x, _13105);
                                        float2 _19358;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18403 = _13106;
                                            _18403.y = 1.0 - _13105;
                                            _19358 = _18403;
                                        }
                                        else
                                        {
                                            _19358 = _13106;
                                        }
                                        float _13123 = _12540.y;
                                        float2 _13124 = float2(_12528.x, _13123);
                                        float2 _19360;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18410 = _13124;
                                            _18410.y = 1.0 - _13123;
                                            _19360 = _18410;
                                        }
                                        else
                                        {
                                            _19360 = _13124;
                                        }
                                        float2 _19362;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18417 = _12540;
                                            _18417.y = 1.0 - _12540.y;
                                            _19362 = _18417;
                                        }
                                        else
                                        {
                                            _19362 = _12540;
                                        }
                                        _19397 = (((gBackdrop5.sample(gLinear, _19357, level(0.0)) * (_12512.x * _12512.y)) + (gBackdrop5.sample(gLinear, _19358, level(0.0)) * (_12516.x * _12512.y))) + (gBackdrop5.sample(gLinear, _19360, level(0.0)) * (_12512.x * _12516.y))) + (gBackdrop5.sample(gLinear, _19362, level(0.0)) * (_12516.x * _12516.y));
                                    }
                                    _19396 = _19397;
                                }
                                _19395 = _19396;
                            }
                            _19394 = _19395;
                        }
                        _19393 = _19394;
                    }
                    _12373 = _19426 + (_19393.xyz * (_12344 ? ((_19356 == 0) ? (1.0 - _12339) : _12339) : 1.0));
                }
                float3 _18421 = _19330;
                _18421.x = _19426.x;
                float2 _8433 = (_8373 + _8385) + (_8388 * _8415);
                float _13220 = fast::clamp(log2(fast::max(_8287, 1.0)) - 1.0, 0.0, 5.0);
                int _13223 = int(floor(_13220));
                float _13227 = _13220 - float(_13223);
                bool _13232 = (_13227 > 0.0199999995529651641845703125) && (_13223 < 5);
                float3 _19550;
                _19550 = float3(0.0);
                float3 _13261;
                for (int _19480 = 0; _19480 < 2; _19550 = _13261, _19480++)
                {
                    if ((_19480 > 0) && (!_13232))
                    {
                        break;
                    }
                    int _13247 = _13223 + _19480;
                    int _13285 = clamp(_13247, 1, 5);
                    float2 _13354 = (_8433 * _188.gLevel[_13285].xy) - float2(0.5);
                    float2 _13356 = floor(_13354);
                    float2 _13359 = _13354 - _13356;
                    float2 _13362 = _13359 * _13359;
                    float2 _13365 = _13362 * _13359;
                    float2 _13384 = (((_13365 * 3.0) - (_13362 * 6.0)) + float2(4.0)) * 0.16666667163372039794921875;
                    float2 _13397 = _13365 * 0.16666667163372039794921875;
                    float2 _13400 = (((((-_13365) + (_13362 * 3.0)) - (_13359 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _13384;
                    float2 _13404 = (((((_13365 * (-3.0)) + (_13362 * 3.0)) + (_13359 * 3.0)) + float2(1.0)) * 0.16666667163372039794921875) + _13397;
                    float2 _13416 = ((_13356 - float2(0.5)) + (_13384 / _13400)) * _188.gLevel[_13285].zw;
                    float2 _13428 = ((_13356 + float2(1.5)) + (_13397 / _13404)) * _188.gLevel[_13285].zw;
                    float4 _19517;
                    if (_13247 <= 0)
                    {
                        float2 _19516;
                        if (_188.gConv.x > 0.5)
                        {
                            float2 _18424 = _8433;
                            _18424.y = 1.0 - _8433.y;
                            _19516 = _18424;
                        }
                        else
                        {
                            _19516 = _8433;
                        }
                        _19517 = gBackdrop0.sample(gLinear, _19516, level(0.0));
                    }
                    else
                    {
                        float4 _19518;
                        if (_13247 == 1)
                        {
                            float2 _19509;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18429 = _13416;
                                _18429.y = 1.0 - _13416.y;
                                _19509 = _18429;
                            }
                            else
                            {
                                _19509 = _13416;
                            }
                            float _13473 = _13416.y;
                            float2 _13474 = float2(_13428.x, _13473);
                            float2 _19510;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18436 = _13474;
                                _18436.y = 1.0 - _13473;
                                _19510 = _18436;
                            }
                            else
                            {
                                _19510 = _13474;
                            }
                            float _13491 = _13428.y;
                            float2 _13492 = float2(_13416.x, _13491);
                            float2 _19512;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18443 = _13492;
                                _18443.y = 1.0 - _13491;
                                _19512 = _18443;
                            }
                            else
                            {
                                _19512 = _13492;
                            }
                            float2 _19514;
                            if (_188.gConv.x > 0.5)
                            {
                                float2 _18450 = _13428;
                                _18450.y = 1.0 - _13428.y;
                                _19514 = _18450;
                            }
                            else
                            {
                                _19514 = _13428;
                            }
                            _19518 = (((gBackdrop1.sample(gLinear, _19509, level(0.0)) * (_13400.x * _13400.y)) + (gBackdrop1.sample(gLinear, _19510, level(0.0)) * (_13404.x * _13400.y))) + (gBackdrop1.sample(gLinear, _19512, level(0.0)) * (_13400.x * _13404.y))) + (gBackdrop1.sample(gLinear, _19514, level(0.0)) * (_13404.x * _13404.y));
                        }
                        else
                        {
                            float4 _19519;
                            if (_13247 == 2)
                            {
                                float2 _19502;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18457 = _13416;
                                    _18457.y = 1.0 - _13416.y;
                                    _19502 = _18457;
                                }
                                else
                                {
                                    _19502 = _13416;
                                }
                                float _13603 = _13416.y;
                                float2 _13604 = float2(_13428.x, _13603);
                                float2 _19503;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18464 = _13604;
                                    _18464.y = 1.0 - _13603;
                                    _19503 = _18464;
                                }
                                else
                                {
                                    _19503 = _13604;
                                }
                                float _13621 = _13428.y;
                                float2 _13622 = float2(_13416.x, _13621);
                                float2 _19505;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18471 = _13622;
                                    _18471.y = 1.0 - _13621;
                                    _19505 = _18471;
                                }
                                else
                                {
                                    _19505 = _13622;
                                }
                                float2 _19507;
                                if (_188.gConv.x > 0.5)
                                {
                                    float2 _18478 = _13428;
                                    _18478.y = 1.0 - _13428.y;
                                    _19507 = _18478;
                                }
                                else
                                {
                                    _19507 = _13428;
                                }
                                _19519 = (((gBackdrop2.sample(gLinear, _19502, level(0.0)) * (_13400.x * _13400.y)) + (gBackdrop2.sample(gLinear, _19503, level(0.0)) * (_13404.x * _13400.y))) + (gBackdrop2.sample(gLinear, _19505, level(0.0)) * (_13400.x * _13404.y))) + (gBackdrop2.sample(gLinear, _19507, level(0.0)) * (_13404.x * _13404.y));
                            }
                            else
                            {
                                float4 _19520;
                                if (_13247 == 3)
                                {
                                    float2 _19495;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18485 = _13416;
                                        _18485.y = 1.0 - _13416.y;
                                        _19495 = _18485;
                                    }
                                    else
                                    {
                                        _19495 = _13416;
                                    }
                                    float _13733 = _13416.y;
                                    float2 _13734 = float2(_13428.x, _13733);
                                    float2 _19496;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18492 = _13734;
                                        _18492.y = 1.0 - _13733;
                                        _19496 = _18492;
                                    }
                                    else
                                    {
                                        _19496 = _13734;
                                    }
                                    float _13751 = _13428.y;
                                    float2 _13752 = float2(_13416.x, _13751);
                                    float2 _19498;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18499 = _13752;
                                        _18499.y = 1.0 - _13751;
                                        _19498 = _18499;
                                    }
                                    else
                                    {
                                        _19498 = _13752;
                                    }
                                    float2 _19500;
                                    if (_188.gConv.x > 0.5)
                                    {
                                        float2 _18506 = _13428;
                                        _18506.y = 1.0 - _13428.y;
                                        _19500 = _18506;
                                    }
                                    else
                                    {
                                        _19500 = _13428;
                                    }
                                    _19520 = (((gBackdrop3.sample(gLinear, _19495, level(0.0)) * (_13400.x * _13400.y)) + (gBackdrop3.sample(gLinear, _19496, level(0.0)) * (_13404.x * _13400.y))) + (gBackdrop3.sample(gLinear, _19498, level(0.0)) * (_13400.x * _13404.y))) + (gBackdrop3.sample(gLinear, _19500, level(0.0)) * (_13404.x * _13404.y));
                                }
                                else
                                {
                                    float4 _19521;
                                    if (_13247 == 4)
                                    {
                                        float2 _19488;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18513 = _13416;
                                            _18513.y = 1.0 - _13416.y;
                                            _19488 = _18513;
                                        }
                                        else
                                        {
                                            _19488 = _13416;
                                        }
                                        float _13863 = _13416.y;
                                        float2 _13864 = float2(_13428.x, _13863);
                                        float2 _19489;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18520 = _13864;
                                            _18520.y = 1.0 - _13863;
                                            _19489 = _18520;
                                        }
                                        else
                                        {
                                            _19489 = _13864;
                                        }
                                        float _13881 = _13428.y;
                                        float2 _13882 = float2(_13416.x, _13881);
                                        float2 _19491;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18527 = _13882;
                                            _18527.y = 1.0 - _13881;
                                            _19491 = _18527;
                                        }
                                        else
                                        {
                                            _19491 = _13882;
                                        }
                                        float2 _19493;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18534 = _13428;
                                            _18534.y = 1.0 - _13428.y;
                                            _19493 = _18534;
                                        }
                                        else
                                        {
                                            _19493 = _13428;
                                        }
                                        _19521 = (((gBackdrop4.sample(gLinear, _19488, level(0.0)) * (_13400.x * _13400.y)) + (gBackdrop4.sample(gLinear, _19489, level(0.0)) * (_13404.x * _13400.y))) + (gBackdrop4.sample(gLinear, _19491, level(0.0)) * (_13400.x * _13404.y))) + (gBackdrop4.sample(gLinear, _19493, level(0.0)) * (_13404.x * _13404.y));
                                    }
                                    else
                                    {
                                        float2 _19481;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18541 = _13416;
                                            _18541.y = 1.0 - _13416.y;
                                            _19481 = _18541;
                                        }
                                        else
                                        {
                                            _19481 = _13416;
                                        }
                                        float _13993 = _13416.y;
                                        float2 _13994 = float2(_13428.x, _13993);
                                        float2 _19482;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18548 = _13994;
                                            _18548.y = 1.0 - _13993;
                                            _19482 = _18548;
                                        }
                                        else
                                        {
                                            _19482 = _13994;
                                        }
                                        float _14011 = _13428.y;
                                        float2 _14012 = float2(_13416.x, _14011);
                                        float2 _19484;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18555 = _14012;
                                            _18555.y = 1.0 - _14011;
                                            _19484 = _18555;
                                        }
                                        else
                                        {
                                            _19484 = _14012;
                                        }
                                        float2 _19486;
                                        if (_188.gConv.x > 0.5)
                                        {
                                            float2 _18562 = _13428;
                                            _18562.y = 1.0 - _13428.y;
                                            _19486 = _18562;
                                        }
                                        else
                                        {
                                            _19486 = _13428;
                                        }
                                        _19521 = (((gBackdrop5.sample(gLinear, _19481, level(0.0)) * (_13400.x * _13400.y)) + (gBackdrop5.sample(gLinear, _19482, level(0.0)) * (_13404.x * _13400.y))) + (gBackdrop5.sample(gLinear, _19484, level(0.0)) * (_13400.x * _13404.y))) + (gBackdrop5.sample(gLinear, _19486, level(0.0)) * (_13404.x * _13404.y));
                                    }
                                    _19520 = _19521;
                                }
                                _19519 = _19520;
                            }
                            _19518 = _19519;
                        }
                        _19517 = _19518;
                    }
                    _13261 = _19550 + (_19517.xyz * (_13232 ? ((_19480 == 0) ? (1.0 - _13227) : _13227) : 1.0));
                }
                _18421.z = _19550.z;
                _19720 = _18421;
            }
            else
            {
                _19720 = _19330;
            }
            float3 _19940;
            if (_8315 > 0.0)
            {
                float2 _8456 = _8373 + (((_19258 * fast::min(_8306 * 0.5, 16.0)) * _188.gDisplay.zw) * _188.gTarget.zw);
                float _14108 = fast::clamp(log2(fast::max(16.0 * _188.gDisplay.z, 1.0)) - 1.0, 0.0, 5.0);
                int _14111 = int(floor(_14108));
                float _14115 = _14108 - float(_14111);
                bool _14120 = (_14115 > 0.0199999995529651641845703125) && (_14111 < 5);
                float3 _19705;
                _19705 = float3(0.0);
                float3 _14149;
                for (int _19690 = 0; _19690 < 2; _19705 = _14149, _19690++)
                {
                    if ((_19690 > 0) && (!_14120))
                    {
                        break;
                    }
                    int _14135 = _14111 + _19690;
                    float2 _19691;
                    if (_188.gConv.x > 0.5)
                    {
                        float2 _18569 = _8456;
                        _18569.y = 1.0 - _8456.y;
                        _19691 = _18569;
                    }
                    else
                    {
                        _19691 = _8456;
                    }
                    float4 _19692;
                    if (_14135 <= 0)
                    {
                        _19692 = gBackdrop0.sample(gLinear, _19691, level(0.0));
                    }
                    else
                    {
                        float4 _19693;
                        if (_14135 == 1)
                        {
                            _19693 = gBackdrop1.sample(gLinear, _19691, level(0.0));
                        }
                        else
                        {
                            float4 _19694;
                            if (_14135 == 2)
                            {
                                _19694 = gBackdrop2.sample(gLinear, _19691, level(0.0));
                            }
                            else
                            {
                                float4 _19695;
                                if (_14135 == 3)
                                {
                                    _19695 = gBackdrop3.sample(gLinear, _19691, level(0.0));
                                }
                                else
                                {
                                    float4 _19696;
                                    if (_14135 == 4)
                                    {
                                        _19696 = gBackdrop4.sample(gLinear, _19691, level(0.0));
                                    }
                                    else
                                    {
                                        _19696 = gBackdrop5.sample(gLinear, _19691, level(0.0));
                                    }
                                    _19695 = _19696;
                                }
                                _19694 = _19695;
                            }
                            _19693 = _19694;
                        }
                        _19692 = _19693;
                    }
                    _14149 = _19705 + (_19692.xyz * (_14120 ? ((_19690 == 0) ? (1.0 - _14115) : _14115) : 1.0));
                }
                _19940 = _19705;
            }
            else
            {
                _19940 = float3(0.5);
            }
            float _19736;
            if (in.i_shape.x > 0.001000000047497451305389404296875)
            {
                int _14238 = clamp(int(rint(log2(36.0 * _188.gDisplay.z) - 1.0)), 1, 4);
                float2 _19711;
                if (_188.gConv.x > 0.5)
                {
                    float2 _18573 = _8373;
                    _18573.y = 1.0 - _8373.y;
                    _19711 = _18573;
                }
                else
                {
                    _19711 = _8373;
                }
                float4 _19712;
                if (_14238 <= 0)
                {
                    _19712 = gBackdrop0.sample(gLinear, _19711, level(0.0));
                }
                else
                {
                    float4 _19713;
                    if (_14238 == 1)
                    {
                        _19713 = gBackdrop1.sample(gLinear, _19711, level(0.0));
                    }
                    else
                    {
                        float4 _19714;
                        if (_14238 == 2)
                        {
                            _19714 = gBackdrop2.sample(gLinear, _19711, level(0.0));
                        }
                        else
                        {
                            float4 _19715;
                            if (_14238 == 3)
                            {
                                _19715 = gBackdrop3.sample(gLinear, _19711, level(0.0));
                            }
                            else
                            {
                                float4 _19716;
                                if (_14238 == 4)
                                {
                                    _19716 = gBackdrop4.sample(gLinear, _19711, level(0.0));
                                }
                                else
                                {
                                    _19716 = gBackdrop5.sample(gLinear, _19711, level(0.0));
                                }
                                _19715 = _19716;
                            }
                            _19714 = _19715;
                        }
                        _19713 = _19714;
                    }
                    _19712 = _19713;
                }
                _19736 = dot(_19712.xyz, float3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            }
            else
            {
                _19736 = 0.5;
            }
            _19938 = _19940;
            _19735 = _19736;
            _19717 = _19720;
        }
        else
        {
            _19938 = float3(0.5);
            _19735 = 0.5;
            _19717 = float3(0.5);
        }
        float3 _8484 = mix(float3(dot(_19717, float3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))), _19717, float3(gFxData_1._data[_8207].x)) + float3(gFxData_1._data[_8207].y);
        float3 _19831;
        if (in.i_shape.x > 0.001000000047497451305389404296875)
        {
            float _8494 = fast::clamp(fast::max(_19735 + gFxData_1._data[_8207].y, 0.001000000047497451305389404296875), 0.0, 1.0);
            float _8502 = mix(_8494, dot(gFxData_1._data[_8199].xyz, float3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), in.i_shape.x);
            _19831 = select(mix(_8484, float3(1.0), float3((_8502 - _8494) / fast::max(1.0 - _8494, 0.001000000047497451305389404296875))), _8484 * (_8502 / _8494), bool3(_8502 < _8494));
        }
        else
        {
            _19831 = _8484;
        }
        float2 _8540 = fast::clamp((in.i_local - in.i_rect.xy) / fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875)), float2(0.0), float2(1.0));
        float2 _8588 = float2(cos(gFxData_1._data[_8207].w), sin(gFxData_1._data[_8207].w));
        float _8591 = dot(_19258, _8588);
        float _8602 = -_18846;
        float _8609 = _4341 * ((0.5 * abs(_19258.x)) + 0.0199999995529651641845703125);
        float _8616 = _4341 * ((0.5 * abs(_19258.y)) + 0.0199999995529651641845703125);
        float _20050;
        if ((((_8602 + _8609) + _8616) > 0.0) && (((_8602 - _8609) - _8616) < (0.5 * _8306)))
        {
            float _14342 = fast::max((_8602 + _8609) + _8616, 0.0) / _8306;
            float _14346 = fast::clamp(sqrt(2.0 * _14342), 0.12399999797344207763671875, 1.0);
            float _14348 = 1.0 - _14346;
            float _14351 = _14348 * _14348;
            float _14405 = fast::max((_8602 + _8609) - _8616, 0.0) / _8306;
            float _14409 = fast::clamp(sqrt(2.0 * _14405), 0.12399999797344207763671875, 1.0);
            float _14411 = 1.0 - _14409;
            float _14414 = _14411 * _14411;
            float _14468 = fast::max((_8602 - _8609) + _8616, 0.0) / _8306;
            float _14472 = fast::clamp(sqrt(2.0 * _14468), 0.12399999797344207763671875, 1.0);
            float _14474 = 1.0 - _14472;
            float _14477 = _14474 * _14474;
            float _14531 = fast::max((_8602 - _8609) - _8616, 0.0) / _8306;
            float _14535 = fast::clamp(sqrt(2.0 * _14531), 0.12399999797344207763671875, 1.0);
            float _14537 = 1.0 - _14535;
            float _14540 = _14537 * _14537;
            float _8663 = ((((((_14342 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _14342) * _14342) : ((_14342 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _14346) * _14346)) + ((((_14351 * _14351) * _14351) * _14348) * (0.02380952425301074981689453125 + (_14348 * ((-0.0386904776096343994140625) + (_14348 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_14342 - 0.5))))) * _8306) * _8306) - ((((_14405 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _14405) * _14405) : ((_14405 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _14409) * _14409)) + ((((_14414 * _14414) * _14414) * _14411) * (0.02380952425301074981689453125 + (_14411 * ((-0.0386904776096343994140625) + (_14411 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_14405 - 0.5))))) * _8306) * _8306)) - ((((_14468 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _14468) * _14468) : ((_14468 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _14472) * _14472)) + ((((_14477 * _14477) * _14477) * _14474) * (0.02380952425301074981689453125 + (_14474 * ((-0.0386904776096343994140625) + (_14474 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_14468 - 0.5))))) * _8306) * _8306)) + ((((_14531 < 0.007687999866902828216552734375) ? ((0.2579232752323150634765625 * _14531) * _14531) : ((_14531 < 0.5) ? (((-0.000989689142443239688873291015625) + ((0.0113648362457752227783203125 * _14535) * _14535)) + ((((_14540 * _14540) * _14540) * _14537) * (0.02380952425301074981689453125 + (_14537 * ((-0.0386904776096343994140625) + (_14537 * 0.01587301678955554962158203125)))))) : (0.01037514768540859222412109375 + (0.022729672491550445556640625 * (_14531 - 0.5))))) * _8306) * _8306);
            _20050 = _8663 / ((4.0 * _8609) * _8616);
        }
        else
        {
            _20050 = 0.0;
        }
        float _8695 = fast::clamp(0.5 + (0.5 * dot((in.i_local - ((in.i_rect.xy + in.i_rect.zw) * 0.5)) / _8298, _8588)), 0.0, 1.0);
        _21241 = ((_20050 * (pow(fast::clamp(_8591, 0.0, 1.0), 1.5) + (0.4000000059604644775390625 * pow(fast::clamp(-_8591, 0.0, 1.0), 1.5)))) * gFxData_1._data[_8207].z) * 1.60000002384185791015625;
        _20818 = gFxData_1._data[_8215];
        _20644 = float4((mix(mix(_19831, gFxData_1._data[_8199].xyz, float3(fast::clamp(gFxData_1._data[_8199].w * ((0.7200000286102294921875 + (0.550000011920928955078125 * (1.0 - _8321))) + (0.3499999940395355224609375 * ((dot(gFxData_1._data[_8199].xyz, float3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) > 0.5) ? (1.0 - _8540.y) : _8540.y))), 0.0, 1.0))), (_19938 * 1.10000002384185791015625) + float3(0.07999999821186065673828125), float3(pow(1.0 - _19835.z, 5.0) * 0.3499999940395355224609375)) + float3((((0.039999999105930328369140625 * _8695) * _8695) + (0.0500000007450580596923828125 * (1.0 - _8321))) * gFxData_1._data[_8207].z)) * _4379, _4379) + (_20057 * (1.0 - _4379));
    }
    else
    {
        _21241 = 0.0;
        _20818 = _18825;
        _20644 = _20057;
    }
    float4 _20654;
    float4 _20656;
    if ((in.i_flags.x & _3101) != 0u)
    {
        float4 _20203;
        float4 _20417;
        if (in.i_flags.y != 0u)
        {
            _20417 = gFxData_1._data[(in.i_instance * 24u) + 3u];
            _20203 = gFxData_1._data[(in.i_instance * 24u) + 4u];
        }
        else
        {
            _20417 = float4(0.0);
            _20203 = float4(0.0);
        }
        float4 _20639;
        do
        {
            if (in.i_flags.y == 0u)
            {
                _20639 = in.i_fill0;
                break;
            }
            float2 _14644 = fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875));
            float2 _14654 = fwidth(in.i_local);
            float _14656 = fast::max(length(_14654), 9.9999997473787516355514526367188e-05);
            float _20631;
            float _20635;
            if ((in.i_flags.y == 1u) || (in.i_flags.y == 4u))
            {
                float _14665 = cos(_20203.x);
                float _14668 = sin(_20203.x);
                float _14694 = ((dot(in.i_local - ((in.i_rect.xy + in.i_rect.zw) * 0.5), float2(_14665, _14668)) / fast::max(0.5 * ((abs(_14665) * _14644.x) + (abs(_14668) * _14644.y)), 0.001000000047497451305389404296875)) * 0.5) + 0.5;
                if (in.i_flags.y == 4u)
                {
                    float _14709 = fast::clamp((_14694 - _20203.y) / fast::max(_20203.z - _20203.y, 0.001000000047497451305389404296875), 0.0, 1.0);
                    _20639 = float4(fast::clamp(abs((fract(float3(_14709 * 0.800000011920928955078125) + float3(1.0, 0.66670000553131103515625, 0.33329999446868896484375)) * 6.0) - float3(3.0)) - float3(1.0), float3(0.0), float3(1.0)), in.i_fill0.w * pow(fast::max(sin(_14709 * 3.1415927410125732421875), 0.0), 0.60000002384185791015625));
                    break;
                }
                _20635 = -1.0;
                _20631 = _14694;
            }
            else
            {
                float _20632;
                float _20636;
                if (in.i_flags.y == 2u)
                {
                    _20636 = -1.0;
                    _20632 = length(in.i_local - (in.i_rect.xy + (_20203.xy * _14644))) / fast::max(_20203.z * fast::max(_14644.x, _14644.y), 0.001000000047497451305389404296875);
                }
                else
                {
                    float2 _14777 = in.i_local - (in.i_rect.xy + (_20203.xy * _14644));
                    float _14788 = fract(((precise::atan2(_14777.y, _14777.x) - _20203.z) * 0.15915493667125701904296875) + 1.0);
                    float _20633;
                    float _20637;
                    if (_20203.w > 0.5)
                    {
                        _20637 = -1.0;
                        _20633 = 0.5 - (0.5 * cos(_14788 * 6.283185482025146484375));
                    }
                    else
                    {
                        float _14808 = (((_14788 < 0.5) ? _14788 : (_14788 - 1.0)) * 6.283185482025146484375) * length(_14777);
                        float _20638;
                        if (abs(_14808) < _14656)
                        {
                            _20638 = fast::clamp(((_14808 / _14656) * 0.5) + 0.5, 0.0, 1.0);
                        }
                        else
                        {
                            _20638 = -1.0;
                        }
                        _20637 = _20638;
                        _20633 = _14788;
                    }
                    _20636 = _20637;
                    _20632 = _20633;
                }
                _20635 = _20636;
                _20631 = _20632;
            }
            float4 _14837 = float4(in.i_fill0.xyz * in.i_fill0.w, in.i_fill0.w);
            float4 _14849 = float4(_20417.xyz * _20417.w, _20417.w);
            float4 _14863 = select(mix(_14837, _14849, float4(fast::clamp(_20631, 0.0, 1.0))), mix(_14849, _14837, float4(_20635)), bool4(_20635 >= 0.0));
            _20639 = select(float4(0.0), float4(_14863.xyz / float3(_14863.w), _14863.w), bool4(_14863.w > 9.9999997473787516355514526367188e-06));
            break;
        } while(false);
        float4 _20640;
        float4 _20808;
        if ((in.i_flags.x & _3130) != 0u)
        {
            uint _14888 = (in.i_instance * 24u) + 18u;
            _20808 = gFxData_1._data[_14888];
            _20640 = _20639 * gTex.sample(gLinear, mix(gFxData_1._data[_14888].xy, gFxData_1._data[_14888].zw, (in.i_local - in.i_rect.xy) / fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875))));
        }
        else
        {
            _20808 = _18821;
            _20640 = _20639;
        }
        float _14898 = fast::clamp(_20640.w * _4379, 0.0, 1.0);
        _20656 = _20808;
        _20654 = float4(_20640.xyz * _14898, _14898) + (_20644 * (1.0 - _14898));
    }
    else
    {
        _20656 = _18821;
        _20654 = _20644;
    }
    float4 _21225;
    if ((in.i_flags.x & _3183) != 0u)
    {
        uint _14922 = (in.i_instance * 24u) + 21u;
        uint _14930 = (in.i_instance * 24u) + 3u;
        float2 _4878 = fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875));
        float2 _4885 = (in.i_local - in.i_rect.xy) / _4878;
        float _4896 = ((gFxData_1._data[_14930].x >= 0.0) ? gFxData_1._data[_14930].x : _188.gTime.x) * gFxData_1._data[_14922].z;
        float _4899 = _4885.x * 2.0;
        float _4900 = _4899 - 1.0;
        float _4905 = _4885.y * _4878.y;
        float _4908 = fast::max(gFxData_1._data[_14922].w, 0.001000000047497451305389404296875);
        float _4913 = fast::clamp(1.0 - (_4900 * _4900), 0.0, 1.0);
        float _4915 = pow(_4913, 1.2999999523162841796875);
        float _4917 = pow(_4913, 0.699999988079071044921875);
        float _4920 = fast::clamp(_4896 * 1.4285714626312255859375, 0.0, 1.0);
        float _4936 = (0.25 + (0.75 * ((_4920 * _4920) * (3.0 - (2.0 * _4920))))) * (0.85000002384185791015625 + (0.1500000059604644775390625 * sin(_4896 * 2.099999904632568359375)));
        float _4945 = ((gFxData_1._data[_14922].y * _4878.y) * _4936) * _4915;
        float _4971 = (_4878.y * (0.5 + ((gFxData_1._data[_14922].x * (0.5 - (_4900 * _4900))) * 0.5))) + (((0.14000000059604644775390625 * _4878.y) * _4915) * sin(((_4900 * 2.400000095367431640625) - (_4896 * 1.2000000476837158203125)) + 0.60000002384185791015625));
        float _20650;
        float _20651;
        float3 _20652;
        _20652 = float3(0.0);
        _20651 = _4971;
        _20650 = _4971;
        float3 _5043;
        float _21528;
        float _21529;
        for (int _20649 = 0; _20649 < 4; _20652 = _5043, _20651 = _21529, _20650 = _21528, _20649++)
        {
            float _4995 = _4971 + ((_4945 * _3346[_20649].x) * (0.800000011920928955078125 + (0.20000000298023223876953125 * sin((_4896 * 1.7000000476837158203125) + _3363[_20649].y))));
            _21528 = (_20649 == 0) ? _4995 : _20650;
            _21529 = (_20649 == 2) ? _4995 : _20651;
            float _5010 = _4908 * _3346[_20649].y;
            float _5015 = (_4905 - _4995) / _5010;
            float _5020 = _4908 * _3346[_20649].z;
            float3 _21499;
            _21499 = float3(0.0);
            for (int _21498 = 0; _21498 < 6; )
            {
                float _14955 = ((_4905 - _4995) - (_5020 * ((float(_21498) * 0.4000000059604644775390625) - 1.0))) / _5010;
                _21499 += (_1880[_21498] * exp((-_14955) * _14955));
                _21498++;
                continue;
            }
            _5043 = _20652 + (mix(_21499 * float3(0.237529695034027099609375, 0.24630542099475860595703125, 0.27624309062957763671875), float3(exp((-_5015) * _5015)), float3(_3363[_20649].x)) * (_3346[_20649].w * _4917));
        }
        float _5049 = _4908 * 1.5;
        float _5079 = fast::clamp((_4905 - _20650) / fast::max(_20651 - _20650, 0.001000000047497451305389404296875), 0.0, 1.0);
        float _5107 = (_4905 - (_20651 - (_4908 * 3.0))) / (((_4878.y * 0.0900000035762786865234375) + (_4945 * 0.20000000298023223876953125)) + 0.001000000047497451305389404296875);
        float _5110 = (_4899 - 1.0499999523162841796875) * 2.77777767181396484375;
        float _5135 = ((_4905 - _20650) + (_4908 * 5.0)) / (_4908 * 7.0);
        float3 _5161 = float3(1.0) - exp((-((((_20652 + (mix(float3(0.7799999713897705078125, 0.800000011920928955078125, 1.0), float3(1.0), float3(_5079)) * ((((1.0 / (1.0 + exp((-((_4905 - _20650) - (_4908 * 2.0))) / _5049))) / (1.0 + exp((-(_20651 - _4905)) / _5049))) * (0.0599999986588954925537109375 + (0.3499999940395355224609375 * pow(_5079, 2.5)))) * _4917))) + (float3(1.0, 0.980000019073486328125, 0.949999988079071044921875) * (exp(((-_5107) * _5107) - (_5110 * _5110)) * (0.5 + (1.10000002384185791015625 * _4936))))) + (float3(1.0, 0.680000007152557373046875, 0.4199999868869781494140625) * ((exp((-_5135) * _5135) * _4915) * 0.100000001490116119384765625))) * mix(float3(1.0, 0.9700000286102294921875, 0.939999997615814208984375), float3(0.939999997615814208984375, 0.9700000286102294921875, 1.0), float3(0.5 + (0.5 * sin(_4896 * 0.800000011920928955078125)))))) * 1.39999997615814208984375);
        float _5171 = (in.i_fill0.w * smoothstep(0.0, 0.119999997317790985107421875, _4885.y)) * smoothstep(1.0, 0.87999999523162841796875, _4885.y);
        float _5190 = (fast::clamp(fast::max(_5161.x, fast::max(_5161.y, _5161.z)), 0.0, 1.0) * _5171) * _4379;
        _21225 = float4((_5161 * _5171) * _4379, _5190) + (_20654 * (1.0 - _5190));
    }
    else
    {
        _21225 = _20654;
    }
    float4 _21236;
    if (((in.i_flags.x & _3615) != 0u) && ((in.i_flags.x & _3619) != 0u))
    {
        uint _14987 = (in.i_instance * 24u) + 7u;
        uint _14995 = (in.i_instance * 24u) + 8u;
        float2 _5224 = in.i_local - gFxData_1._data[_14995].zw;
        float2 _15038 = (in.i_rect.xy + in.i_rect.zw) * 0.5;
        float2 _15047 = fast::max((in.i_rect.zw - in.i_rect.xy) * 0.5, float2(0.001000000047497451305389404296875));
        float _21198;
        if ((in.i_flags.x & _1347) != 0u)
        {
            float _15153 = 1.0 / fast::max(in.i_shape.z, 9.9999999747524270787835121154785e-07);
            float4 _15187 = gTex.sample(gLinear, mix(_20656.xy, _20656.zw, (fast::clamp(_5224, _18827.xy, _18827.zw) - _18827.xy) / fast::max(_18827.zw - _18827.xy, float2(9.9999999747524270787835121154785e-07))), level(0.0));
            float _15211 = (_15187.w - 0.5) * in.i_radii.y;
            float2 _15252 = abs(_5224 - ((_18827.xy + _18827.zw) * 0.5)) - fast::max(((_18827.zw - _18827.xy) * 0.5) - float2(((0.5 * in.i_radii.y) + 1.0) * _15153), float2(0.0));
            _21198 = fast::max((-mix((fast::max(fast::min(_15187.x, _15187.y), fast::min(fast::max(_15187.x, _15187.y), _15187.z)) - 0.5) * in.i_radii.x, _15211, fast::clamp(abs(_15211) - ((0.5 * in.i_radii.x) - 1.5), 0.0, 1.0))) * _15153, length(fast::max(_15252, float2(0.0))) + fast::min(fast::max(_15252.x, _15252.y), 0.0)) - in.i_shape.w;
        }
        else
        {
            float _21199;
            if (in.i_flags.z == 1u)
            {
                float2 _15062 = _5224 - _15038;
                float _21197;
                do
                {
                    if (in.i_shape.w >= 6.282185077667236328125)
                    {
                        _21197 = abs(length(_15062) - in.i_radii.x) - in.i_radii.y;
                        break;
                    }
                    float _15296 = in.i_shape.z + (in.i_shape.w * 0.5);
                    float _15298 = cos(_15296);
                    float _15300 = sin(_15296);
                    float _15309 = dot(_15062, float2(-_15300, _15298));
                    float _15312 = dot(_15062, float2(_15298, _15300));
                    float2 _15313 = float2(_15309, _15312);
                    float _15316 = abs(_15309);
                    _15313.x = _15316;
                    float _15319 = in.i_shape.w * 0.5;
                    float _15321 = sin(_15319);
                    float _15323 = cos(_15319);
                    _21197 = (((_15323 * _15316) > (_15321 * _15312)) ? length(_15313 - (float2(_15321, _15323) * in.i_radii.x)) : abs(length(_15313) - in.i_radii.x)) - in.i_radii.y;
                    break;
                } while(false);
                _21199 = _21197;
            }
            else
            {
                float _21200;
                if (in.i_flags.z == 2u)
                {
                    float2 _15359 = _5224 - _18827.xy;
                    float2 _15362 = _18827.zw - _18827.xy;
                    _21200 = length(_15359 - (_15362 * fast::clamp(dot(_15359, _15362) / fast::max(dot(_15362, _15362), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - in.i_radii.x;
                }
                else
                {
                    float2 _15089 = _5224 - _15038;
                    float _15415 = fast::min(_15047.x, _15047.y);
                    float _15418 = fast::min((_15089.x > 0.0) ? ((_15089.y > 0.0) ? in.i_radii.z : in.i_radii.y) : ((_15089.y > 0.0) ? in.i_radii.w : in.i_radii.x), _15415);
                    float _15424 = _15418 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                    float _21182;
                    float _21183;
                    if (_15424 > _15415)
                    {
                        float _15438 = in.i_shape.y * fast::clamp((_15415 - _15418) / fast::max(0.60000002384185791015625 * _15418, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _21183 = _15438;
                        _21182 = _15418 * (1.0 + (0.60000002384185791015625 * _15438));
                    }
                    else
                    {
                        _21183 = in.i_shape.y;
                        _21182 = _15424;
                    }
                    float2 _15451 = (abs(_15089) - _15047) + float2(_21182);
                    float2 _15453 = fast::max(_15451, float2(0.0));
                    float _21184;
                    if ((_15453.x > 0.0) && (_15453.y > 0.0))
                    {
                        float _21185;
                        if ((_21183 > 0.001000000047497451305389404296875) && (_21182 > 9.9999997473787516355514526367188e-05))
                        {
                            float _15470 = 2.0 + (2.0 * _21183);
                            float2 _15475 = _15453 / float2(fast::max(_21182, 9.9999997473787516355514526367188e-05));
                            _21185 = pow(pow(_15475.x, _15470) + pow(_15475.y, _15470), 1.0 / _15470) * _21182;
                        }
                        else
                        {
                            _21185 = length(_15453);
                        }
                        _21184 = _21185;
                    }
                    else
                    {
                        _21184 = fast::max(_15453.x, _15453.y);
                    }
                    float _15510 = (fast::min(fast::max(_15451.x, _15451.y), 0.0) + _21184) - _21182;
                    float _21201;
                    if ((in.i_flags.x & _1416) != 0u)
                    {
                        float2 _15117 = fast::max((_18827.zw - _18827.xy) * 0.5, float2(0.001000000047497451305389404296875));
                        float2 _15120 = _5224 - ((_18827.xy + _18827.zw) * 0.5);
                        float _15546 = fast::min(_15117.x, _15117.y);
                        float _15549 = fast::min((_15120.x > 0.0) ? ((_15120.y > 0.0) ? _20818.x : _20818.x) : ((_15120.y > 0.0) ? _20818.x : _20818.x), _15546);
                        float _15555 = _15549 * (1.0 + (0.60000002384185791015625 * in.i_shape.y));
                        float _21188;
                        float _21189;
                        if (_15555 > _15546)
                        {
                            float _15569 = in.i_shape.y * fast::clamp((_15546 - _15549) / fast::max(0.60000002384185791015625 * _15549, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _21189 = _15569;
                            _21188 = _15549 * (1.0 + (0.60000002384185791015625 * _15569));
                        }
                        else
                        {
                            _21189 = in.i_shape.y;
                            _21188 = _15555;
                        }
                        float2 _15582 = (abs(_15120) - _15117) + float2(_21188);
                        float2 _15584 = fast::max(_15582, float2(0.0));
                        float _21190;
                        if ((_15584.x > 0.0) && (_15584.y > 0.0))
                        {
                            float _21191;
                            if ((_21189 > 0.001000000047497451305389404296875) && (_21188 > 9.9999997473787516355514526367188e-05))
                            {
                                float _15601 = 2.0 + (2.0 * _21189);
                                float2 _15606 = _15584 / float2(fast::max(_21188, 9.9999997473787516355514526367188e-05));
                                _21191 = pow(pow(_15606.x, _15601) + pow(_15606.y, _15601), 1.0 / _15601) * _21188;
                            }
                            else
                            {
                                _21191 = length(_15584);
                            }
                            _21190 = _21191;
                        }
                        else
                        {
                            _21190 = fast::max(_15584.x, _15584.y);
                        }
                        float _15641 = (fast::min(fast::max(_15582.x, _15582.y), 0.0) + _21190) - _21188;
                        float _15646 = fast::max(_20818.y, 9.9999997473787516355514526367188e-05);
                        float _15655 = fast::max(_15646 - abs(_15510 - _15641), 0.0) / _15646;
                        _21201 = fast::min(_15510, _15641) - (((_15655 * _15655) * _15646) * 0.25);
                    }
                    else
                    {
                        _21201 = _15510;
                    }
                    _21200 = _21201;
                }
                _21199 = _21200;
            }
            _21198 = _21199;
        }
        float _5233 = (_21198 + gFxData_1._data[_14995].y) / (fast::max(gFxData_1._data[_14995].x * 0.5, _4341 * 0.5) * 1.41421353816986083984375);
        float _15672 = sign(_5233);
        float _15674 = abs(_5233);
        float _15685 = 1.0 + ((0.2783930003643035888671875 + ((0.23038899898529052734375 + (0.07810799777507781982421875 * (_15674 * _15674))) * _15674)) * _15674);
        float _15688 = _15685 * _15685;
        float _15703 = fast::clamp(gFxData_1._data[_14987].w * ((0.5 + (0.5 * (_15672 - (_15672 / (_15688 * _15688))))) * _4379), 0.0, 1.0);
        _21236 = float4(gFxData_1._data[_14987].xyz * _15703, _15703) + (_21225 * (1.0 - _15703));
    }
    else
    {
        _21236 = _21225;
    }
    float4 _21261;
    if ((in.i_flags.x & _3679) != 0u)
    {
        uint _15727 = (in.i_instance * 24u) + 9u;
        uint _15735 = (in.i_instance * 24u) + 10u;
        float _5265 = fast::max(-_18846, 0.0) / fast::max(gFxData_1._data[_15735].z, 0.001000000047497451305389404296875);
        float _15745 = fast::clamp(gFxData_1._data[_15727].w * fast::clamp((exp(((-_5265) * _5265) * 2.2000000476837158203125) * gFxData_1._data[_15735].w) * _4379, 0.0, 1.0), 0.0, 1.0);
        _21261 = float4(gFxData_1._data[_15727].xyz * _15745, _15745) + (_21236 * (1.0 - _15745));
    }
    else
    {
        _21261 = _21236;
    }
    float3 _5296 = _21261.xyz + float3(_21241 * fast::clamp(_21261.w / fast::max(_4379, 0.001000000047497451305389404296875), 0.0, 1.0));
    float4 _18716 = _21261;
    _18716.x = _5296.x;
    _18716.y = _5296.y;
    _18716.z = _5296.z;
    float4 _21264;
    if ((in.i_flags.x & _3748) != 0u)
    {
        uint _15769 = (in.i_instance * 24u) + 5u;
        float4 _15771 = gFxData_1._data[_15769];
        uint _15777 = (in.i_instance * 24u) + 6u;
        float4 _21262;
        if (gFxData_1._data[_15777].z < 0.999000012874603271484375)
        {
            float2 _5354 = fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875));
            float _5365 = cos(gFxData_1._data[_15777].w);
            float _5368 = sin(gFxData_1._data[_15777].w);
            float4 _18733 = _15771;
            _18733.w = _15771.w * mix(1.0, gFxData_1._data[_15777].z, fast::clamp(((dot(in.i_local - ((in.i_rect.xy + in.i_rect.zw) * 0.5), float2(_5365, _5368)) / fast::max(0.5 * ((abs(_5365) * _5354.x) + (abs(_5368) * _5354.y)), 0.001000000047497451305389404296875)) * 0.5) + 0.5, 0.0, 1.0));
            _21262 = _18733;
        }
        else
        {
            _21262 = _15771;
        }
        float _15787 = fast::clamp(_21262.w * (fast::clamp(0.5 - ((_18846 - (gFxData_1._data[_15777].x * gFxData_1._data[_15777].y)) / _4341), 0.0, 1.0) - fast::clamp(0.5 - ((_18846 + (gFxData_1._data[_15777].x * (1.0 - gFxData_1._data[_15777].y))) / _4341), 0.0, 1.0)), 0.0, 1.0);
        _21264 = float4(_21262.xyz * _15787, _15787) + (_18716 * (1.0 - _15787));
    }
    else
    {
        _21264 = _18716;
    }
    float4 _21265;
    if ((in.i_flags.x & _3878) != 0u)
    {
        float2 _5429 = (in.i_local - in.i_rect.xy) / fast::max(in.i_rect.zw - in.i_rect.xy, float2(0.001000000047497451305389404296875));
        float _5451 = exp(-pow((((_5429.x * 0.85000002384185791015625) + (_5429.y * 0.1500000059604644775390625)) - ((fract(_188.gTime.x * in.i_misc.w) * 1.7999999523162841796875) - 0.4000000059604644775390625)) * 9.09090900421142578125, 2.0));
        _21265 = float4(_21264.xyz + float3(((_5451 * in.i_misc.z) * _4379) * fast::max(_21264.w, 0.3499999940395355224609375)), fast::max(_21264.w, ((_5451 * in.i_misc.z) * _4379) * 0.5));
    }
    else
    {
        _21265 = _21264;
    }
    float4 _21493;
    if ((in.i_flags.x & _3960) != 0u)
    {
        float3 _15812 = fract(floor(_18820).xyx * 0.103100001811981201171875);
        float3 _15821 = _15812 + float3(dot(_15812, _15812.yzx + float3(33.3300018310546875)));
        float3 _5502 = _21265.xyz + float3(((fract((_15821.x + _15821.y) * _15821.z) - 0.5) * in.i_misc.y) * _21265.w);
        float4 _18757 = _21265;
        _18757.x = _5502.x;
        _18757.y = _5502.y;
        _18757.z = _5502.z;
        _21493 = _18757;
    }
    else
    {
        _21493 = _21265;
    }
    float _21489;
    if (_231.gFade.z > 0.0)
    {
        _21489 = smoothstep(0.0, 1.0, fast::clamp((_18820.y - _231.gFade.x) / _231.gFade.z, 0.0, 1.0));
    }
    else
    {
        _21489 = 1.0;
    }
    float _21490;
    if (_231.gFade.w > 0.0)
    {
        _21490 = _21489 * smoothstep(0.0, 1.0, fast::clamp((_231.gFade.y - _18820.y) / _231.gFade.w, 0.0, 1.0));
    }
    else
    {
        _21490 = _21489;
    }
    float4 _5519 = _21493 * ((in.i_misc.x * _21277) * _21490);
    float4 _21494;
    if (((in.i_flags.x & _4000) != 0u) || ((in.i_flags.x & _4004) != 0u))
    {
        float3 _15873 = fract((floor(_18820) + float2(17.0)).xyx * 0.103100001811981201171875);
        float3 _15882 = _15873 + float3(dot(_15873, _15873.yzx + float3(33.3300018310546875)));
        float3 _5543 = _5519.xyz + float3(((fract((_15882.x + _15882.y) * _15882.z) - 0.5) * 0.0039215688593685626983642578125) * fast::clamp(_5519.w * 8.0, 0.0, 1.0));
        float4 _18769 = _5519;
        _18769.x = _5543.x;
        _18769.y = _5543.y;
        _18769.z = _5543.z;
        _21494 = _18769;
    }
    else
    {
        _21494 = _5519;
    }
    float3 _5553 = fast::max(_21494.xyz, float3(0.0));
    float4 _18775 = _21494;
    _18775.x = _5553.x;
    _18775.y = _5553.y;
    _18775.z = _5553.z;
    float4 _21495;
    if ((_188.gTime.w > 0.5) && (_21494.w > 9.9999997473787516355514526367188e-06))
    {
        float3 _15926 = fast::clamp(_18775.xyz / float3(_21494.w), float3(0.0), float3(1.0));
        float3 _15912 = select(pow((_15926 + float3(0.054999999701976776123046875)) * float3(0.947867333889007568359375), float3(2.400000095367431640625)), _15926 * float3(0.077399380505084991455078125), _15926 <= float3(0.040449999272823333740234375)) * _21494.w;
        float4 _18784 = _18775;
        _18784.x = _15912.x;
        _18784.y = _15912.y;
        _18784.z = _15912.z;
        _21495 = _18784;
    }
    else
    {
        _21495 = _18775;
    }
    out._entryPointOutput = _21495;
    return out;
}

