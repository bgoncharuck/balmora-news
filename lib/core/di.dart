import 'package:balmoranews/data/service/di.dart';
import 'package:balmoranews/data/service/environment/env.dart';
import 'package:balmoranews/data/service/local_pref/local_pref.dart';
import 'package:balmoranews/data/service/logger/logger.dart';
import 'package:balmoranews/data/service/news_api/config/config_storage.dart';
import 'package:balmoranews/data/service/news_api/news_api.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// infra
WidgetsBinding get widgetsBinding => di.get<WidgetsBinding>();
LoggingLibrary get logger => di.get<LoggingLibrary>();
EnvironmentStrategy get env => di.get<EnvironmentStrategy>();
LocalPref get localPref => di.get<LocalPref>();
GoRouter get router => di.get<GoRouter>();

/// domain
NewsApi get newsApi => di.get<NewsApi>();
NewsConfigStorage get newsConfigStorage => di.get<NewsConfigStorage>();
