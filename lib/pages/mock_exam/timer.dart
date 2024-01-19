import 'dart:async';

class QuizTimer {
  late Timer _timer;
  late Duration _duration;
  late Function() _onTimeout;

  bool _isRunning = false;
  bool get isRunning => _isRunning;

  late StreamController<int> _remainingTimeController;

  QuizTimer(Duration duration, Function() onTimeout) {
    _duration = duration;
    _onTimeout = onTimeout;
    _remainingTimeController = StreamController<int>();
  }

  Stream<int> get remainingTimeStream => _remainingTimeController.stream;

  void start() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = _getTimer;
    }
  }

  void pause() {
    if (_isRunning) {
      _timer.cancel();
      _isRunning = false;
    }
  }

  void resume() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = _getTimer;
    }
  }

  void cancel() => _timer.cancel();

  void stop() {
    _isRunning = false;
    _timer.cancel();
  }

  void reset() {
    stop();
    // _duration = Duration.zero;
    _remainingTimeController.add(_duration.inSeconds);
  }

  void restart(Duration newDuration) {
    reset();
    _duration = newDuration;
    start();
  }

  void dispose() {
    _remainingTimeController.close();
  }

  Timer get _getTimer =>
      Timer.periodic(const Duration(seconds: 1), _timerCallback);

  void _timerCallback(Timer timer) {
    _duration -= const Duration(seconds: 1);
    if (_duration <= Duration.zero) {
      stop();
      _onTimeout;
    }
    _remainingTimeController.add(_duration.inSeconds);
  }
}
