/* Copyright (C) Continuum Graphics - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Joseph Conover <support@continuum.graphics>, March 2018
 */

const mat3 sRGB_2_XYZ_MAT = mat3( // Linear sRGB to XYZ color space
	vec3(0.4124564, 0.3575761, 0.1804375),
	vec3(0.2126729, 0.7151522, 0.0721750),
	vec3(0.0193339, 0.1191920, 0.9503041)
);

const mat3 XYZ_2_sRGB_MAT = mat3( //XYZ to linear sRGB Color Space
	vec3(3.2409699419, -1.5373831776, -0.4986107603),
	vec3(-0.9692436363,  1.8759675015,  0.0415550574),
	vec3(0.0556300797, -0.2039769589,  1.0569715142)
);

const mat3 D65_2_D60_CAT = mat3( // D65 to D60 White Point
	vec3(1.01303, 0.00610531, -0.014971),
	vec3(0.00769823, 0.998165, -0.00503203),
	vec3(-0.00284131, 0.00468516, 0.924507)
);

const mat3 D60_2_D65_CAT = mat3( //D60 to D65 White Point
	vec3(0.987224,   -0.00611327, 0.0159533),
	vec3(-0.00759836,  1.00186,    0.00533002),
	vec3(0.00307257, -0.00509595, 1.08168)
);

const mat3 XYZ_2_AP0_MAT = mat3( // XYZ to ACEScg Color Space
	vec3(1.0498110175, 0.0000000000,-0.0000974845),
	vec3(-0.4959030231, 1.3733130458, 0.0982400361),
	vec3(0.0000000000, 0.0000000000, 0.9912520182)
);

const mat3 AP0_2_XYZ_MAT = mat3( // ACEScg to XYZ Color Space
	vec3(0.9525523959, 0.0000000000, 0.0000936786),
	vec3(0.3439664498, 0.7281660966,-0.0721325464),
	vec3(0.0000000000, 0.0000000000, 1.0088251844)
);

const mat3 XYZ_2_AP1_MAT = mat3( // XYZ to ACEStoning Color Space
	vec3(1.6410233797, -0.3248032942, -0.2364246952),
	vec3(-0.6636628587,  1.6153315917,  0.0167563477),
	vec3(0.0117218943, -0.0082844420,  0.9883948585)
);

const mat3 AP1_2_XYZ_MAT = mat3( // ACEStoning to XYZ Color Space
	vec3(0.6624541811, 0.1340042065, 0.1561876870),
	vec3(0.2722287168, 0.6740817658, 0.0536895174),
	vec3(-0.0055746495, 0.0040607335, 1.0103391003)
);

const mat3 AP0_2_AP1_MAT = mat3( // ACEScg to ACEStoneing Color Space
	vec3(1.4514393161, -0.2365107469, -0.2149285693),
	vec3(-0.0765537734,  1.1762296998, -0.0996759264),
	vec3(0.0083161484, -0.0060324498,  0.9977163014)
);

const mat3 AP1_2_AP0_MAT = mat3( // ACEStoning to ACEScg Color Space
	vec3(0.6954522414,  0.1406786965,  0.1638690622),
	vec3(0.0447945634,  0.8596711185,  0.0955343182),
	vec3(-0.0055258826,  0.0040252103,  1.0015006723)
);

const vec3 AP1_RGB2Y = vec3(0.2722287168, 0.6740817658, 0.0536895174); // Desaturation Coeff
const mat3 sRGB_2_AP0 = (sRGB_2_XYZ_MAT * D65_2_D60_CAT) * XYZ_2_AP0_MAT;