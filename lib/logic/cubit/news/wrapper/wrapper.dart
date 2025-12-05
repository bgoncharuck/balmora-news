import 'package:balmoranews/data/service/news_api/config/config.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../cubit.dart';

class NewsCubitWrapper extends StatelessWidget {
  const NewsCubitWrapper({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final initialConfig = NewsRequestConfig.initial();
    final configNotifier = NewsConfigNotifier(initialConfig);

    return ChangeNotifierProvider<NewsConfigNotifier>(
      create: (_) => configNotifier,
      child: BlocProvider<NewsCubit>(
        create: (blocContext) {
          final cubit = NewsCubit(configNotifier);
          return cubit;
        },
        child: child,
      ),
    );
  }
}
