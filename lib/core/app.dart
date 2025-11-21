import 'package:adaptive_formula/adaptive_formula.dart';
import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/data/service/adaptive/is_init.dart';
import 'package:balmoranews/data/service/di.dart';
import 'package:balmoranews/logic/cubit/news/wrapper/wrapper.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';

class BalmoraNews extends StatelessWidget {
  const BalmoraNews({super.key});

  @override
  Widget build(BuildContext context) {
    if (di.get<AdaptiveFormulaIsInitialized>().isNotInit) {
      adaptiveFormulaInitFromBuildContext(context: context);
      di.get<AdaptiveFormulaIsInitialized>().isNotInit = false;
    }

    return NewsCubitWrapper(
      child: ConnectivityAppWrapper(
        app: CupertinoApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
