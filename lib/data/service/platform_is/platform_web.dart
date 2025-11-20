import 'package:flutter/foundation.dart';

bool get isMobile => false;
bool get isAndroid => false;
bool get isIOS => false;
bool get isDesktop => false;
bool get isAnyWeb => kIsWeb || kIsWasm;
bool get isNotWeb => !kIsWeb && !kIsWasm;
