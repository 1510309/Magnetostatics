/* -----------------------------------------------------------------------
    Creating Eight Permanent Magnets : Dynamic Magnetic Field Calculation (gmsh / getDP)
    Each magnet is created independently.

    --> Abhishek Sharma, 16th Aug, 2012   

    --> Last Updated : 4th Oct, 2012
   ----------------------------------------------------------------------- */

/* Defining Geomtry Parameters */

mag_w = 6e-3;  			// magnet width
mag_l = 6e-3;  			// magnet length
mag_h = 3e-3;  			// magnet height
gap_x = 9e-3;			// gap along X direction
gap_y = 9e-3;			// gap along Y direction
gap_z = 4.5e-3;			// gap along Z direction
air_b = 5e-2;                   // boundary for air 

p = mag_w/10;   		// characterisitcs length for the magnet
q = 4*p;   			// characterisitcs length for air

/* ----------------------------------------------------------------------- */
/* Defining Magnet #1 */

Point(101) = { -mag_l/2., -mag_w/2., -mag_h/2., p };
Point(102) = {  mag_l/2., -mag_w/2., -mag_h/2., p };
Point(103) = {  mag_l/2.,  mag_w/2., -mag_h/2., p };
Point(104) = { -mag_l/2.,  mag_w/2., -mag_h/2., p };
Point(105) = { -mag_l/2., -mag_w/2.,  mag_h/2., p };
Point(106) = {  mag_l/2., -mag_w/2.,  mag_h/2., p };
Point(107) = {  mag_l/2.,  mag_w/2.,  mag_h/2., p };
Point(108) = { -mag_l/2.,  mag_w/2.,  mag_h/2., p };

Line(1) = {101,102};
Line(2) = {102,103};
Line(3) = {103,104};
Line(4) = {104,101};
Line(5) = {105,106};
Line(6) = {106,107};
Line(7) = {107,108};
Line(8) = {108,105};
Line(9) = {101,105};
Line(10) = {102,106};
Line(11) = {103,107};
Line(12) = {104,108};

Line Loop(13) = {1, 2, 3, 4};
Plane Surface(14) = {13};
Line Loop(15) = {5, 6, 7, 8};
Plane Surface(16) = {15};
Line Loop(17) = {1, 10, -5, -9};
Plane Surface(18) = {17};
Line Loop(19) = {10, 6, -11, -2};
Plane Surface(20) = {19};
Line Loop(21) = {-3, 11, 7, -12};
Plane Surface(22) = {21};
Line Loop(23) = {4, 9, -8, -12};
Plane Surface(24) = {23};

Surface Loop(25) = {14, 20, 16, 18, 24, 22};

Volume(26) = {25};

/* -------------------------------------------------------------------- */
/* Defining Magnet #2 */

Point(109) = { -mag_l/2. + gap_x, -mag_w/2., -mag_h/2., p};
Point(110) = {  mag_l/2. + gap_x, -mag_w/2., -mag_h/2., p};
Point(111) = {  mag_l/2. + gap_x,  mag_w/2., -mag_h/2., p};
Point(112) = { -mag_l/2. + gap_x,  mag_w/2., -mag_h/2., p};
Point(113) = { -mag_l/2. + gap_x, -mag_w/2.,  mag_h/2., p};
Point(114) = {  mag_l/2. + gap_x, -mag_w/2.,  mag_h/2., p};
Point(115) = {  mag_l/2. + gap_x,  mag_w/2.,  mag_h/2., p};
Point(116) = { -mag_l/2. + gap_x,  mag_w/2.,  mag_h/2., p};

Line(27) = {109, 110};
Line(28) = {110, 111};
Line(29) = {111, 112};
Line(30) = {112, 109};
Line(31) = {113, 114};
Line(32) = {114, 115};
Line(33) = {115, 116};
Line(34) = {116, 113};
Line(35) = {109, 113};
Line(36) = {110, 114};
Line(37) = {111, 115};
Line(38) = {112, 116};

Line Loop(39) = {27, 28, 29, 30};
Plane Surface(40) = {39};
Line Loop(41) = {31, 32, 33, 34};
Plane Surface(42) = {41};
Line Loop(43) = {27, 36, -31, -35};
Plane Surface(44) = {43};
Line Loop(45) = {36, 32, -37, -28};
Plane Surface(46) = {45};
Line Loop(47) = {-29, 37, 33, -38};
Plane Surface(48) = {47};
Line Loop(49) = {30, 35, -34, -38};
Plane Surface(50) = {49};

Surface Loop(51) = {40, 46, 42, 44, 50, 48};
Volume(52) = {51};

/* ------------------------------------------------------------------ */
/* Defining Magnet #3 */

Point(117) = { -mag_l/2., -mag_w/2. + gap_y, -mag_h/2., p };
Point(118) = {  mag_l/2., -mag_w/2. + gap_y, -mag_h/2., p };
Point(119) = {  mag_l/2.,  mag_w/2. + gap_y, -mag_h/2., p };
Point(120) = { -mag_l/2.,  mag_w/2. + gap_y, -mag_h/2., p };
Point(121) = { -mag_l/2., -mag_w/2. + gap_y,  mag_h/2., p };
Point(122) = {  mag_l/2., -mag_w/2. + gap_y,  mag_h/2., p };
Point(123) = {  mag_l/2.,  mag_w/2. + gap_y,  mag_h/2., p };
Point(124) = { -mag_l/2.,  mag_w/2. + gap_y,  mag_h/2., p };

Line(53) = {117, 118};
Line(54) = {118, 119};
Line(55) = {119, 120};
Line(56) = {120, 117};
Line(57) = {121, 122};
Line(58) = {122, 123};
Line(59) = {123, 124};
Line(60) = {124, 121};
Line(61) = {117, 121};
Line(62) = {118, 122};
Line(63) = {119, 123};
Line(64) = {120, 124};

Line Loop(65) = {53, 54, 55, 56};
Plane Surface(66) = {65};
Line Loop(67) = {57, 58, 59, 60};
Plane Surface(68) = {67};
Line Loop(69) = {53, 62, -57, -61};
Plane Surface(70) = {69};
Line Loop(71) = {62, 58, -63, -54};
Plane Surface(72) = {71};
Line Loop(73) = {-55, 63, 59, -64};
Plane Surface(74) = {73};
Line Loop(75) = {56, 61, -60, -64};
Plane Surface(76) = {75};

Surface Loop(77) = {66, 72, 68, 70, 76, 74};
Volume(78) = {77};

/* ---------------------------------------------------------------  */
/* Defining Magnet #4 */

Point(125) = { -mag_l/2. + gap_x, -mag_w/2. + gap_y, -mag_h/2., p };
Point(126) = {  mag_l/2. + gap_x, -mag_w/2. + gap_y, -mag_h/2., p };
Point(127) = {  mag_l/2. + gap_x,  mag_w/2. + gap_y, -mag_h/2., p };
Point(128) = { -mag_l/2. + gap_x,  mag_w/2. + gap_y, -mag_h/2., p };
Point(129) = { -mag_l/2. + gap_x, -mag_w/2. + gap_y,  mag_h/2., p };
Point(130) = {  mag_l/2. + gap_x, -mag_w/2. + gap_y,  mag_h/2., p };
Point(131) = {  mag_l/2. + gap_x,  mag_w/2. + gap_y,  mag_h/2., p };
Point(132) = { -mag_l/2. + gap_x,  mag_w/2. + gap_y,  mag_h/2., p };

Line(79) = {125, 126};
Line(80) = {126, 127};
Line(81) = {127, 128};
Line(82) = {128, 125};  
Line(83) = {129, 130};
Line(84) = {130, 131};
Line(85) = {131, 132};
Line(86) = {132, 129};
Line(87) = {125, 129};
Line(88) = {126, 130};
Line(89) = {127, 131};
Line(90) = {128, 132};

Line Loop(91) = {79, 80, 81, 82};
Plane Surface(92) = {91};
Line Loop(93) = {83, 84, 85, 86};
Plane Surface(94) = {93};
Line Loop(95) = {79, 88, -83, -87};
Plane Surface(96) = {95};
Line Loop(97) = {88, 84, -89, -80};
Plane Surface(98) = {97};
Line Loop(99) = {-81, 89, 85, -90};
Plane Surface(100) = {99};
Line Loop(101) = {82, 87, -86, -90};
Plane Surface(102) = {101};

Surface Loop(103) = {92, 98, 94, 96, 102, 100};
Volume(104) = {103};

/* ----------------------------------------------------------------------------- */
/* Defining Magnet #5 */

Point(133) = { -mag_l/2., -mag_w/2., -mag_h/2. + gap_z, p };
Point(134) = {  mag_l/2., -mag_w/2., -mag_h/2. + gap_z, p };
Point(135) = {  mag_l/2.,  mag_w/2., -mag_h/2. + gap_z, p };
Point(136) = { -mag_l/2.,  mag_w/2., -mag_h/2. + gap_z, p };
Point(137) = { -mag_l/2., -mag_w/2.,  mag_h/2. + gap_z, p };
Point(138) = {  mag_l/2., -mag_w/2.,  mag_h/2. + gap_z, p };
Point(139) = {  mag_l/2.,  mag_w/2.,  mag_h/2. + gap_z, p };
Point(140) = { -mag_l/2.,  mag_w/2.,  mag_h/2. + gap_z, p };

Line(105) = {133, 134};
Line(106) = {134, 135};
Line(107) = {135, 136};
Line(108) = {136, 133};
Line(109) = {137, 138};
Line(110) = {138, 139};
Line(111) = {139, 140};
Line(112) = {140, 137};
Line(113) = {133, 137};
Line(114) = {134, 138};
Line(115) = {135, 139};
Line(116) = {136, 140};

Line Loop(117) = {105, 106, 107, 108};
Plane Surface(118) = {117};
Line Loop(119) = {109, 110, 111, 112};
Plane Surface(120) = {119};
Line Loop(121) = {105, 114, -109, -113};
Plane Surface(122) = {121};
Line Loop(123) = {106, 115, -110, -114 };
Plane Surface(124) = {123};
Line Loop(125) = {-107, 115, 111, -116};
Plane Surface(126) = {125};
Line Loop(127) = {-108, 116, 112, -113};
Plane Surface(128) = {127};

Surface Loop(129) = {118, 126, 120, 124, 122, 128};
Volume(130) = {129};

/* ----------------------------------------------------------------------------- */
/* Defining Magnet #6 */

Point(141) = { -mag_l/2. + gap_x, -mag_w/2., -mag_h/2. + gap_z, p};
Point(142) = {  mag_l/2. + gap_x, -mag_w/2., -mag_h/2. + gap_z, p};
Point(143) = {  mag_l/2. + gap_x,  mag_w/2., -mag_h/2. + gap_z, p};
Point(144) = { -mag_l/2. + gap_x,  mag_w/2., -mag_h/2. + gap_z, p};
Point(145) = { -mag_l/2. + gap_x, -mag_w/2.,  mag_h/2. + gap_z, p};
Point(146) = {  mag_l/2. + gap_x, -mag_w/2.,  mag_h/2. + gap_z, p};
Point(147) = {  mag_l/2. + gap_x,  mag_w/2.,  mag_h/2. + gap_z, p};
Point(148) = { -mag_l/2. + gap_x,  mag_w/2.,  mag_h/2. + gap_z, p};

Line(131) = {141, 142};
Line(132) = {142, 143};
Line(133) = {143, 144};
Line(134) = {144, 141};
Line(135) = {145, 146};
Line(136) = {146, 147};
Line(137) = {147, 148};
Line(138) = {148, 145};
Line(139) = {141, 145};
Line(140) = {142, 146};
Line(141) = {143, 147};
Line(142) = {144, 148};

Line Loop(143) = {131, 132, 133, 134};
Plane Surface(144) = {143};
Line Loop(145) = {135, 136, 137, 138};
Plane Surface(146) = {145};
Line Loop(147) = {131, 140, -135, -139};
Plane Surface(148) = {147};
Line Loop(149) = {132, 141, -136, -140};
Plane Surface(150) = {149};
Line Loop(151) = {-133, 141, 137, -142};
Plane Surface(152) = {151};
Line Loop(153) = {-134, 142, 138, -139};
Plane Surface(154) = {153}; 

Surface Loop(155) = {144, 152, 146, 150, 148, 154};
Volume(156) = {155}; 

/* ----------------------------------------------------------------------------- */
/* Defining Magnet #7 */

Point(149) = { -mag_l/2., -mag_w/2. + gap_y, -mag_h/2. + gap_z, p };
Point(150) = {  mag_l/2., -mag_w/2. + gap_y, -mag_h/2. + gap_z, p };
Point(151) = {  mag_l/2.,  mag_w/2. + gap_y, -mag_h/2. + gap_z, p };
Point(152) = { -mag_l/2.,  mag_w/2. + gap_y, -mag_h/2. + gap_z, p };
Point(153) = { -mag_l/2., -mag_w/2. + gap_y,  mag_h/2. + gap_z, p };
Point(154) = {  mag_l/2., -mag_w/2. + gap_y,  mag_h/2. + gap_z, p };
Point(155) = {  mag_l/2.,  mag_w/2. + gap_y,  mag_h/2. + gap_z, p };
Point(156) = { -mag_l/2.,  mag_w/2. + gap_y,  mag_h/2. + gap_z, p };

Line(157) = {149, 150};
Line(158) = {150, 151};
Line(159) = {151, 152};
Line(160) = {152, 149};
Line(161) = {153, 154};
Line(162) = {154, 155};
Line(163) = {155, 156};
Line(164) = {156, 153};
Line(165) = {149, 153};
Line(166) = {150, 154};
Line(167) = {151, 155};
Line(168) = {152, 156};

Line Loop(169) = {157, 158, 159, 160};
Plane Surface(170) = {169};
Line Loop(171) = {161, 162, 163, 164};
Plane Surface(172) = {171};
Line Loop(173) = {157, 166, -161, -165};
Plane Surface(174) = {173};
Line Loop(175) = {158, 167, -162, -166};
Plane Surface(176) = {175};
Line Loop(177) = {-159, 167, 163, -168};
Plane Surface(178) = {177};
Line Loop(179) = {-160, 168, 164, -165};
Plane Surface(180) = {179};

Surface Loop(181) = {170, 178, 172, 176, 174, 180};
Volume(182) = {181};

/* ----------------------------------------------------------------------------- */
/* Defining Magnet #8 */

Point(157) = { -mag_l/2. + gap_x, -mag_w/2. + gap_y, -mag_h/2. + gap_z, p };
Point(158) = {  mag_l/2. + gap_x, -mag_w/2. + gap_y, -mag_h/2. + gap_z, p };
Point(159) = {  mag_l/2. + gap_x,  mag_w/2. + gap_y, -mag_h/2. + gap_z, p };
Point(160) = { -mag_l/2. + gap_x,  mag_w/2. + gap_y, -mag_h/2. + gap_z, p };
Point(161) = { -mag_l/2. + gap_x, -mag_w/2. + gap_y,  mag_h/2. + gap_z, p };
Point(162) = {  mag_l/2. + gap_x, -mag_w/2. + gap_y,  mag_h/2. + gap_z, p };
Point(163) = {  mag_l/2. + gap_x,  mag_w/2. + gap_y,  mag_h/2. + gap_z, p };
Point(164) = { -mag_l/2. + gap_x,  mag_w/2. + gap_y,  mag_h/2. + gap_z, p };

Line(183) = {157, 158};
Line(184) = {158, 159};
Line(185) = {159, 160};
Line(186) = {160, 157};
Line(187) = {161, 162};
Line(188) = {162, 163};
Line(189) = {163, 164};
Line(190) = {164, 161};
Line(191) = {157, 161};
Line(192) = {158, 162};
Line(193) = {159, 163};
Line(194) = {160, 164};

Line Loop(195) = {183, 184, 185, 186};
Plane Surface(196) = {195};
Line Loop(197) = {187, 188, 189, 190};
Plane Surface(198) = {197};
Line Loop(199) = {183, 192, -187, -191};
Plane Surface(200) = {199};
Line Loop(201) = {184, 193, -188, -192};
Plane Surface(202) = {201};
Line Loop(203) = {-185, 193, 189, -194};
Plane Surface(204) = {203};
Line Loop(205) = {-186, 194, 190, -191};
Plane Surface(206) = {205};

Surface Loop(207) = {196, 204, 198, 202, 200, 206};
Volume(208) = {207};


/* ----------------------------------------------------------------------------- */
/* define the points for the air domain */

Point(501) = {/*(mag_l/2. + gap_x/2.)*/ - air_b/2., /* (mag_w/2. + gap_y/2.) */ - air_b/2., -air_b/2., q };
Point(502) = {(mag_l/2. + gap_x/2.) + air_b/2., /* (mag_w/2. + gap_y/2.) */ - air_b/2., -air_b/2., q };
Point(503) = {(mag_l/2. + gap_x/2.) + air_b/2.,  (mag_w/2. + gap_y/2.)  + air_b/2., -air_b/2., q };
Point(504) = {/*(mag_l/2. + gap_x/2.)*/ - air_b/2.,  (mag_w/2. + gap_y/2.)  + air_b/2., -air_b/2., q };
Point(505) = {/*(mag_l/2. + gap_x/2.)*/ - air_b/2., /* (mag_w/2. + gap_y/2.) */ - air_b/2.,  air_b/2., q };
Point(506) = {(mag_l/2. + gap_x/2.) + air_b/2., /* (mag_w/2. + gap_y/2.) */ - air_b/2.,  air_b/2., q };
Point(507) = {(mag_l/2. + gap_x/2.) + air_b/2.,  (mag_w/2. + gap_y/2.)  + air_b/2.,  air_b/2., q };
Point(508) = {/*(mag_l/2. + gap_x/2.)*/ - air_b/2.,  (mag_w/2. + gap_y/2.)  + air_b/2.,  air_b/2., q};

Line(305) = {501, 502};
Line(306) = {502, 503};
Line(307) = {503, 504};
Line(308) = {504, 501};
Line(309) = {505, 506};
Line(310) = {506, 507};
Line(311) = {507, 508};
Line(312) = {508, 505};
Line(313) = {501, 505};
Line(314) = {502, 506};
Line(315) = {503, 507};
Line(316) = {504, 508};

Line Loop(317) = {305, 306, 307, 308};
Plane Surface(318) = {317};
Line Loop(319) = {309, 310, 311, 312};
Plane Surface(320) = {319};
Line Loop(321) = {305, 314, -309, -313};
Plane Surface(322) = {321};
Line Loop(323) = {314, 310, -315, -306};
Plane Surface(324) = {323};
Line Loop(325) = {-307, 315, 311, -316};
Plane Surface(326) = {325};
Line Loop(327) = {308, 313, -312, -316};
Plane Surface(328) = {327};

Surface Loop(329) = {318, 324, 320, 322, 328, 326};
Volume(330) = {329, 25, 103, 77, 51, 129, 155, 181, 207};

Physical Volume(600) = {26}; // magnet1
Physical Volume(601) = {52}; // magnet2
Physical Volume(602) = {78}; // magnet3 
Physical Volume(603) = {104}; // magnet4
Physical Volume(604) = {130}; // magnet5
Physical Volume(605) = {156}; // magnet6
Physical Volume(606) = {182}; // magnet7
Physical Volume(607) = {208}; // magnet8
Physical Volume(608) = {330}; // air
Physical Surface(1000) = {318, 324, 320, 322, 328, 326}; //system boundary

/* --------------------------------------------end-of-file-------------------------------- */
