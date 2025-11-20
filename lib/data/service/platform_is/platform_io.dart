import 'dart:io';

bool get isMobile => Platform.isAndroid || Platform.isIOS;
bool get isAndroid => Platform.isAndroid;
bool get isIOS => Platform.isIOS;
bool get isDesktop =>
    Platform.isMacOS || Platform.isWindows || Platform.isLinux;
bool get isAnyWeb => false;
bool get isNotWeb => true;
