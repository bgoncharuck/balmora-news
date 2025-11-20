import 'package:balmoranews/core/routing/go_router.dart';
import 'package:balmoranews/core/routing/observers.dart';
import 'package:balmoranews/data/service/di.dart';
import 'package:balmoranews/data/service/environment/env.dart';
import 'package:balmoranews/data/service/environment/plugins/flutter_dotenv.dart';
import 'package:balmoranews/data/service/environment/plugins/native_build_injection.dart';
import 'package:balmoranews/data/service/local_pref/local_pref.dart';
import 'package:balmoranews/data/service/logger/logger.dart';
import 'package:balmoranews/data/service/logger/plugins/multiple_libs_logging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'encrypt_hives.dart';
import 'init_widgets_binding.dart';

Future<void> initialize({required void Function() startTheApp}) async {
  di
    ..registerSingleton<WidgetsBinding>(await initWidgetsBinding())
    ..registerSingleton<LoggingLibrary>(MultipleLibrariesLogging())
    ..registerSingleton<EnvironmentStrategy>(
      kDebugMode || kProfileMode
          ? PluginFlutterDotEnv()
          : NativeBuildInjectionEnvironment(),
    )
    ..registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage())
    ..registerSingleton<LocalPref>(LocalPref())
    ..registerSingleton<RouteHistoryObserver>(RouteHistoryObserver())
    ..registerSingleton<GoRouter>(declarativeRouter());

  /// some service initializations may depend on env or log
  await Future.wait([
    di.get<EnvironmentStrategy>().validate(),
    di.get<LoggingLibrary>().init(),
    Hive.initFlutter(),
  ]);
  await encryptHives();

  // await Future.wait([]);

  startTheApp();
}
