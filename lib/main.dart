import 'package:balmoranews/core/app.dart';
import 'package:balmoranews/core/init/init.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  await initialize(startTheApp: () => runApp(const BalmoraNews()));
}
