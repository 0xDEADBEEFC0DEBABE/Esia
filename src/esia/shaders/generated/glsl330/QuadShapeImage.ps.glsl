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

vec2 _1601;

layout(std140) uniform WgtFrame
{
    vec4 gXform;
    vec4 gTarget;
    vec4 gDisplay;
    vec4 gTime;
    vec4 gLevel[6];
    vec4 gText;
    vec4 gConv;
} _77;

layout(std140) uniform WgtDraw
{
    vec4 gFade;
    vec4 gDrawInfo;
} _109;

uniform sampler2D SPIRV_Cross_CombinedgTexgLinear;

in vec4 esia_v0;
in vec2 esia_v1;
flat in vec4 esia_v2;
flat in vec4 esia_v3;
flat in float esia_v4;
layout(location = 0) out vec4 _entryPointOutput;

void main()
{
    vec4 _1599;
    do
    {
        vec4 _772 = texture(SPIRV_Cross_CombinedgTexgLinear, esia_v1);
        float _775 = dFdx(esia_v1.x);
        float _779 = dFdy(esia_v1.x);
        float _782 = max(abs(_775) + abs(_779), 9.9999997473787516355514526367188e-05);
        SPIRV_CROSS_BRANCH
        if (esia_v4 > (-0.5))
        {
            float _1594;
            do
            {
                float _845 = floor(esia_v4 + 0.5);
                SPIRV_CROSS_BRANCH
                if (_845 > 4.5)
                {
                    float _1593;
                    do
                    {
                        vec2 _969 = esia_v1 - esia_v2.xy;
                        SPIRV_CROSS_BRANCH
                        if (_845 < 5.5)
                        {
                            _1593 = clamp((esia_v3.y - abs(dot(_969, normalize(vec2(esia_v2.y - esia_v2.w, esia_v2.z - esia_v2.x))))) / max(esia_v3.y - esia_v3.x, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                            break;
                        }
                        SPIRV_CROSS_BRANCH
                        if (dot(_969, _969) < 9.9999999600419720025001879548654e-13)
                        {
                            _1593 = 1.0;
                            break;
                        }
                        float _1006 = floor(esia_v3.z + 0.5);
                        float _1008 = 3.1415927410125732421875 / _1006;
                        vec2 _1012 = normalize(esia_v2.xy - esia_v2.zw);
                        vec2 _1018 = vec2(-_1012.y, _1012.x);
                        float _1036 = (clamp(floor(atan(max(dot(_969, _1012), 0.0), dot(_969, _1018)) / _1008), 0.0, _1006 - 1.0) + 0.5) * _1008;
                        float _1039 = cos(1.57079637050628662109375 / _1006);
                        _1593 = clamp(((esia_v3.y * _1039) - dot(_969, (_1018 * cos(_1036)) + (_1012 * sin(_1036)))) / max((esia_v3.y - esia_v3.x) * _1039, 9.9999999747524270787835121154785e-07), 0.0, 1.0);
                        break;
                    } while(false);
                    _1594 = _1593;
                    break;
                }
                SPIRV_CROSS_BRANCH
                if (_845 > 3.5)
                {
                    _1594 = 1.0;
                    break;
                }
                float _1592;
                SPIRV_CROSS_BRANCH
                if (_845 >= 1.5)
                {
                    vec2 _1072 = esia_v1 - esia_v2.xy;
                    vec2 _1075 = esia_v2.zw - esia_v2.xy;
                    _1592 = length(_1072 - (_1075 * clamp(dot(_1072, _1075) / max(dot(_1075, _1075), 9.9999999747524270787835121154785e-07), 0.0, 1.0))) - esia_v3.x;
                }
                else
                {
                    vec2 _882 = esia_v1 - ((esia_v2.xy + esia_v2.zw) * 0.5);
                    vec2 _891 = max((esia_v2.zw - esia_v2.xy) * 0.5, vec2(0.001000000047497451305389404296875));
                    float _1128 = min(_891.x, _891.y);
                    float _1131 = min((_882.x > 0.0) ? ((_882.y > 0.0) ? esia_v3.x : esia_v3.x) : ((_882.y > 0.0) ? esia_v3.x : esia_v3.x), _1128);
                    float _1137 = _1131 * (1.0 + (0.60000002384185791015625 * esia_v3.y));
                    float _1586;
                    float _1587;
                    if (_1137 > _1128)
                    {
                        float _1151 = esia_v3.y * clamp((_1128 - _1131) / max(0.60000002384185791015625 * _1131, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _1587 = _1151;
                        _1586 = _1131 * (1.0 + (0.60000002384185791015625 * _1151));
                    }
                    else
                    {
                        _1587 = esia_v3.y;
                        _1586 = _1137;
                    }
                    vec2 _1164 = (abs(_882) - _891) + vec2(_1586);
                    vec2 _1166 = max(_1164, vec2(0.0));
                    float _1588;
                    SPIRV_CROSS_BRANCH
                    if ((_1166.x > 0.0) && (_1166.y > 0.0))
                    {
                        float _1589;
                        if ((_1587 > 0.001000000047497451305389404296875) && (_1586 > 9.9999997473787516355514526367188e-05))
                        {
                            float _1183 = 2.0 + (2.0 * _1587);
                            vec2 _1188 = _1166 / vec2(max(_1586, 9.9999997473787516355514526367188e-05));
                            _1589 = pow(pow(_1188.x, _1183) + pow(_1188.y, _1183), 1.0 / _1183) * _1586;
                        }
                        else
                        {
                            _1589 = length(_1166);
                        }
                        _1588 = _1589;
                    }
                    else
                    {
                        _1588 = max(_1166.x, _1166.y);
                    }
                    _1592 = (min(max(_1164.x, _1164.y), 0.0) + _1588) - _1586;
                }
                SPIRV_CROSS_BRANCH
                if ((_845 - (2.0 * floor(_845 * 0.5))) > 0.5)
                {
                    _1594 = clamp(0.5 - ((_1592 - (esia_v3.z * esia_v3.w)) / _782), 0.0, 1.0) - clamp(0.5 - ((_1592 + (esia_v3.z * (1.0 - esia_v3.w))) / _782), 0.0, 1.0);
                    break;
                }
                _1594 = clamp(0.5 - (_1592 / _782), 0.0, 1.0);
                break;
            } while(false);
            vec2 _1232 = gl_FragCoord.xy + _77.gConv.yy;
            vec2 _1595;
            if (_77.gConv.x > 0.5)
            {
                vec2 _1550;
                _1550.y = _77.gTarget.y - _1232.y;
                _1595 = _1550;
            }
            else
            {
                _1595 = _1232;
            }
            float _1596;
            if (_109.gFade.z > 0.0)
            {
                _1596 = smoothstep(0.0, 1.0, clamp((_1595.y - _109.gFade.x) / _109.gFade.z, 0.0, 1.0));
            }
            else
            {
                _1596 = 1.0;
            }
            float _1597;
            if (_109.gFade.w > 0.0)
            {
                _1597 = _1596 * smoothstep(0.0, 1.0, clamp((_109.gFade.y - _1595.y) / _109.gFade.w, 0.0, 1.0));
            }
            else
            {
                _1597 = _1596;
            }
            vec4 _796 = vec4(esia_v0.xyz, (esia_v0.w * _1594) * _1597);
            vec4 _1598;
            if (_77.gTime.w > 0.5)
            {
                vec3 _1304 = clamp(_796.xyz, vec3(0.0), vec3(1.0));
                vec3 _1310 = pow((_1304 + vec3(0.054999999701976776123046875)) * vec3(0.947867333889007568359375), vec3(2.400000095367431640625));
                vec3 _1313 = _1304 * vec3(0.077399380505084991455078125);
                bvec3 _1315 = lessThanEqual(_1304, vec3(0.040449999272823333740234375));
                vec3 _1316 = vec3(_1315.x ? _1313.x : _1310.x, _1315.y ? _1313.y : _1310.y, _1315.z ? _1313.z : _1310.z);
                vec4 _1552 = _796;
                _1552.x = _1316.x;
                _1552.y = _1316.y;
                _1552.z = _1316.z;
                _1598 = _1552;
            }
            else
            {
                _1598 = _796;
            }
            _1599 = _1598;
            break;
        }
        vec4 _1325 = esia_v0 * _772;
        vec2 _1344 = gl_FragCoord.xy + _77.gConv.yy;
        vec2 _1579;
        if (_77.gConv.x > 0.5)
        {
            vec2 _1559;
            _1559.y = _77.gTarget.y - _1344.y;
            _1579 = _1559;
        }
        else
        {
            _1579 = _1344;
        }
        float _1580;
        if (_109.gFade.z > 0.0)
        {
            _1580 = smoothstep(0.0, 1.0, clamp((_1579.y - _109.gFade.x) / _109.gFade.z, 0.0, 1.0));
        }
        else
        {
            _1580 = 1.0;
        }
        float _1581;
        if (_109.gFade.w > 0.0)
        {
            _1581 = _1580 * smoothstep(0.0, 1.0, clamp((_109.gFade.y - _1579.y) / _109.gFade.w, 0.0, 1.0));
        }
        else
        {
            _1581 = _1580;
        }
        float _1332 = _1325.w * _1581;
        vec4 _1562 = _1325;
        _1562.w = _1332;
        vec4 _1585;
        if (_77.gTime.w > 0.5)
        {
            vec3 _1416 = clamp(_1562.xyz, vec3(0.0), vec3(1.0));
            vec3 _1422 = pow((_1416 + vec3(0.054999999701976776123046875)) * vec3(0.947867333889007568359375), vec3(2.400000095367431640625));
            vec3 _1425 = _1416 * vec3(0.077399380505084991455078125);
            bvec3 _1427 = lessThanEqual(_1416, vec3(0.040449999272823333740234375));
            _1585 = vec4(vec3(_1427.x ? _1425.x : _1422.x, _1427.y ? _1425.y : _1422.y, _1427.z ? _1425.z : _1422.z), _1332);
        }
        else
        {
            _1585 = _1562;
        }
        _1599 = _1585;
        break;
    } while(false);
    _entryPointOutput = _1599;
}

