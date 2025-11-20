import 'package:flutter/widgets.dart';

class RouteHistoryObserver extends NavigatorObserver {
  final List<Route<dynamic>> _history = [];

  List<Route<dynamic>> get history => List.unmodifiable(_history);

  Route<dynamic>? get top => _history.isNotEmpty ? _history.last : null;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.remove(route);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.remove(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final index = _history.indexOf(oldRoute!);
    if (index != -1 && newRoute != null) {
      _history[index] = newRoute;
    }
  }
}
