import 'dart:async';

class Debounce {
  final Duration delay;
  Timer _timer;

  Debounce({required this.delay}) : _timer = Timer(delay, () {});

  call(Function() action) {
    _timer.cancel();
    _timer = Timer(delay, action);
  }

  dispose() => _timer.cancel();
}
