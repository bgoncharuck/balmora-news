import 'package:flutter/rendering.dart';

const nothing = Color(0x00000000);
const primary = Color(0xFF000000);
const linkColor = Color.fromARGB(255, 82, 82, 128);
const secondary = Color(0xFF734C47);
const accent = Color(0xFFAA6C39);

const buttonBorderColor = Color(0xFF000000);

const linearPrimaryGradient = LinearGradient(
  colors: [Color(0xFF734C47), Color(0xFFF2DAB6)],
  stops: [0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const inactiveLinearPrimaryGradient = LinearGradient(
  colors: [Color(0xFF734C47), Color(0x2C326540)],
  stops: [0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
