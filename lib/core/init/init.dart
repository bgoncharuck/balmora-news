import 'package:balmoranews/core/routing/go_router.dart';
import 'package:balmoranews/core/routing/observers.dart';
import 'package:balmoranews/data/entity/connection/addresses_to_ping.dart';
import 'package:balmoranews/data/service/adaptive/is_init.dart';
import 'package:balmoranews/data/service/di.dart';
import 'package:balmoranews/data/service/dio/dio_factory.dart';
import 'package:balmoranews/data/service/environment/env.dart';
import 'package:balmoranews/data/service/environment/plugins/flutter_dotenv.dart';
import 'package:balmoranews/data/service/environment/plugins/native_build_injection.dart';
import 'package:balmoranews/data/service/local_pref/local_pref.dart';
import 'package:balmoranews/data/service/logger/logger.dart';
import 'package:balmoranews/data/service/logger/plugins/multiple_libs_logging.dart';
import 'package:balmoranews/data/service/news_api/config/config_storage.dart';
import 'package:balmoranews/data/service/news_api/news_api.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'encrypt_hives.dart';
import 'init_widgets_binding.dart';

Future<void> initialize({required void Function() startTheApp}) async {
  /// initial di
  ConnectivityWrapper.instance.addresses = addressesToPing;
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
    ..registerSingleton<GoRouter>(declarativeRouter())
    ..registerSingleton<SplashScreenStopped>(SplashScreenStopped())
    ..registerSingleton<AdaptiveFormulaIsInitialized>(
      AdaptiveFormulaIsInitialized(),
    )
    ..registerSingleton<NewsConfigStorage>(NewsConfigStorage());

  /// infrastructure
  /// some service initializations may depend on env or log
  await Future.wait([
    di.get<EnvironmentStrategy>().validate(),
    di.get<LoggingLibrary>().init(),
    Hive.initFlutter(),
  ]);
  await encryptHives();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  /// domain
  di.registerSingleton<NewsApi>(
    NewsApi(
      dio: dioFactory(di.get<EnvironmentStrategy>().newsApiUrl),
      apiKey: di.get<EnvironmentStrategy>().newsApiKey,
    ),
  );

  // await Future.wait([]);

  startTheApp();
}
