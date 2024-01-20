import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

class Questions {
  final String question;
  final String answer;
  final List<String> options;
  final String? selection;
  final bool? isCorrect;

  Questions({
    required this.question,
    required this.answer,
    required this.options,
    this.selection,
    this.isCorrect,
  });

  Questions copyWith(String? selection) {
    return Questions(
      question: question,
      answer: answer,
      options: options,
      selection: selection ?? this.selection,
      isCorrect: selection == answer,
    );
  }
}

final questionsProvider =
    StateNotifierProvider<QuestionNotifier, List<Questions>>((ref) {
  final questions = List.generate(
    23,
    (index) => Questions(
      question:
          "Edufox has hosted an annual convention of users of its famous e-learning software platform, and over time, it has become a grand event. It fills one of the large downtown conference hotels and overflows into the others, with several thousand attendees enjoying three days of presentations, panel discussions and networking. The convention is the centerpiece of the company's product rollout schedule and a great training opportunity for current users. The sales force also encourages prospective clients to attend to get a better sense of the ways in which the system can be customized to meet diverse needs and understand that when they buy into this system, they are joining a community that feels like family.This year's conference is only three weeks away, and you have just heard news of a new initiative supporting it: a smartphone app for attendees. The app will support late registration, highlight the featured presentations and provide a mobile version of the conference program. It also links to a restaurant reservation system with the best cuisine in the areas featured. \"It's going to be great,\" the developer, Deidre Hoffman, tells you, \"if, that is, we actually get it working!\" She laughs nervously but explains that because of the tight time frame she\'d been given to build the app, she outsourced the job to a local firm. \"It\'s just three young people,\" she says, \"but they do great work.\" She describes some of the other apps they have built. When asked how they were selected for this job, Deidre shrugs. \"They do good work, so I chose them.\"Deidre is a terrific employee with a strong track record. That\'s why she\'s been charged to deliver this rushed project. You\'re sure she has the best interests of the company at heart, and you don\'t doubt that she\'s under pressure to meet a deadline that cannot be pushed back. However, you have concerns about the app\'s handling of personal data and its security safeguards. Over lunch in the break room, you start to talk to her about it, but she quickly tries to reassure you, \"I\'m sure with your help we can fix any security issues if we have to, but I doubt there\'ll be any. These people build apps for a living, and they know what they\'re doing. You worry too much, but that\'s why you\'re so good at your job!\"You want to point out that normal protocols have NOT been followed in this matter.Which process in particular has been neglected?",
      answer: 'Vendor due diligence or vetting.',
      options: <String>[
        "Forensic inquiry.",
        "Data mapping.",
        "Privacy breach prevention.",
        "Vendor due diligence or vetting.",
      ],
    ),
  );
  return QuestionNotifier(ref, questions);
});

class QuestionNotifier extends StateNotifier<List<Questions>> {
  QuestionNotifier(this.ref, this.questions) : super(questions);
  final Ref ref;
  final List<Questions> questions;

  void select(int index, String selection) {
    state = [
      ...state.sublist(0, index),
      state[index].copyWith(selection),
      ...state.sublist(index + 1),
    ];
  }
}

final quizTimerProvider1 =
    StateNotifierProvider.family<QuizTimerNotifier, QuizTimer, QuizTimer>(
        (ref, quizTimer) {
  return QuizTimerNotifier(ref, quizTimer);
});

class QuizTimerNotifier extends StateNotifier<QuizTimer> {
  QuizTimerNotifier(this.ref, this.quizTimer) : super(quizTimer) {
    final timer = _QuizTimer(
      duration: quizTimer.duration,
      onProgress: _onProgress,
      onTimeout: quizTimer.onTimeout,
    );
    timer.start();
  }
  final Ref ref;
  final QuizTimer quizTimer;

  void _onProgress(Duration duration) {
    state = state.copyWith(progress: duration);
  }
}

class QuizTimer {
  final Duration duration;
  final Duration progress;
  final bool inProgress;
  final VoidCallback? onTimeout;

  QuizTimer({
    required this.duration,
    required this.progress,
    this.inProgress = false,
    this.onTimeout,
  });

  QuizTimer copyWith({
    Duration? duration,
    Duration? progress,
    bool? inProgress,
  }) {
    return QuizTimer(
      duration: duration ?? this.duration,
      progress: progress ?? this.progress,
      inProgress: inProgress ?? this.inProgress,
    );
  }

  void pause() {
    // if (_isRunning) {
    //   _timer.cancel();
    //   _isRunning = false;
    // }
  }
  void resume() {}
}

class _QuizTimer {
  late Timer _timer;
  late Duration _duration;
  final VoidCallback? onTimeout;
  final ValueChanged<Duration>? onProgress;

  bool _isRunning = false;
  bool get isRunning => _isRunning;

  _QuizTimer({
    required Duration duration,
    this.onProgress,
    this.onTimeout,
  }) {
    _duration = duration;
  }

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
    onProgress?.call(_duration);
  }

  void restart(Duration newDuration) {
    reset();
    _duration = newDuration;
    start();
  }

  void dispose() {
    _timer.cancel();
    onProgress?.call(_duration);
  }

  Timer get _getTimer =>
      Timer.periodic(const Duration(seconds: 1), _timerCallback);

  void _timerCallback(Timer timer) {
    _duration -= const Duration(seconds: 1);
    if (_duration <= Duration.zero) {
      stop();
      onTimeout?.call();
    }
    onProgress?.call(_duration);
  }
}
