import 'package:flutter/cupertino.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

const bg1 = LinearGradient(
  colors: [Color(0x8a00bcd4), Color(0xffba3afc)],
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
);

// background-image: LinearGradient(
// 45deg,
// hsl(240deg 100% 20%) 0%,
// hsl(289deg 100% 21%) 11%,
// hsl(315deg 100% 27%) 22%,
// hsl(329deg 100% 36%) 33%,
// hsl(337deg 100% 43%) 44%,
// hsl(357deg 91% 59%) 56%,
// hsl(17deg 100% 59%) 67%,
// hsl(34deg 100% 53%) 78%,
// hsl(45deg 100% 50%) 89%,
// hsl(55deg 100% 50%) 100%
// );

 final els = Container(
height: 300,
width: 300,
decoration: BoxDecoration(
gradient: linearGradient(315,
[
  'HSLColor.fromAHSL(1, 240, 1, 0.2)',
'HSLColor.fromAHSL(0.11, 259, 1, 0.23)',
'HSLColor.fromAHSL(0.22, 279, 1, 0.27)',
'HSLColor.fromAHSL(0.33, 298, 1, 0.3)',
'HSLColor.fromAHSL(0.44, 318, 1, 0.33)',
'HSLColor.fromAHSL(0.56, 337, 1, 0.37)',
'HSLColor.fromAHSL(0.74, 357, 1, 0.40)',
// 'hsl(240 100% 20%) 0%',
// 'hsl(259deg 100% 23%) 11%',
// 'hsl(279deg 100% 27%) 22%',
// 'hsl(298deg 100% 30%) 33%',
// 'hsl(318deg 100% 33%) 44%',
// 'hsl(337deg 100% 37%) 56%',
// 'hsl(357deg 100% 40%) 67%',
// 'hsl(16deg 100% 43%) 78%',
// 'hsl(36deg 100% 47%) 89%',
// 'hsl(55deg 100% 50%) 100%)',
]
),
);

final f = Container(
height: 300,
width: 300,
decoration: BoxDecoration(
gradient: linearGradient(150, [ '#1f005c', '#6c0060', '#a40059', '#cf2b4c', '#ea623b', '#f7972e', '#f4cb36', '#e2ff61']),
),
);