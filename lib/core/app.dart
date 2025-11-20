import 'package:adaptive_formula/adaptive_formula.dart';
import 'package:balmoranews/core/di.dart';
import 'package:flutter/cupertino.dart';

var _adaptiveFormulaIsNotInitialized = true;

class BalmoraNews extends StatelessWidget {
  const BalmoraNews({super.key});

  @override
  Widget build(BuildContext context) {
    if (_adaptiveFormulaIsNotInitialized) {
      adaptiveFormulaInitFromBuildContext(context: context);
      _adaptiveFormulaIsNotInitialized = false;
    }

    return CupertinoApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
