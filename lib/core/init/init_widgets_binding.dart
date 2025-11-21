import 'package:balmoranews/data/service/di.dart';
import 'package:balmoranews/logic/use_case/preload_asset_images.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<WidgetsBinding> initWidgetsBinding() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await const PreloadImages().execute();
  widgetsBinding.preserveSplashScreen();

  return widgetsBinding;
}

class SplashScreenStopped {
  /// file-private field + extension,
  /// a variation of Open-Closed principle to expand functionality
  /// without changing a class
  var _splashScreenStopped = false;
}

extension NativeSplashPreservation on WidgetsBinding {
  void preserveSplashScreen() {
    FlutterNativeSplash.preserve(widgetsBinding: this);
  }

  void removeSplashScreen() {
    /// native splash can be removed only once
    if (di.get<SplashScreenStopped>()._splashScreenStopped) {
      return;
    }
    FlutterNativeSplash.remove();
    di.get<SplashScreenStopped>()._splashScreenStopped = true;
  }
}
