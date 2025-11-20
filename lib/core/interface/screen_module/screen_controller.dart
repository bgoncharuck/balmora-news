abstract class ScreenControllerParams {}

class ScreenController<T extends ScreenControllerParams> {
  ScreenController(this.params);
  final T params;

  bool _initOnce = false;
  bool get initOnce {
    if (_initOnce) {
      return true;
    }
    _initOnce = true;
    return false;
  }

  bool _disposeOnce = false;
  bool get disposeOnce {
    if (_disposeOnce) {
      return true;
    }
    _disposeOnce = true;
    return false;
  }
}
