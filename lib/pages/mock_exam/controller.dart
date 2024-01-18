import 'package:course_view/pages/mock_exam/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin MockExamController on Widget {
  void onNavigate(WidgetRef ref, PageController controller, bool forward) {
    final currentIndex = ref.watch(currentIndexProvider);
    final newIndex = currentIndex + (forward ? 1 : -1);
    controller.jumpToPage(newIndex);
  }
}
