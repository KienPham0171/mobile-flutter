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


final f = Container(
height: 300,
width: 300,
decoration: BoxDecoration(
gradient: linearGradient(150, [ '#1f005c', '#6c0060', '#a40059', '#cf2b4c', '#ea623b', '#f7972e', '#f4cb36', '#e2ff61']),
),
);