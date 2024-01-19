import 'package:course_view/pages/mock_exam/providers.dart';
import 'package:course_view/pages/mock_exam/submit_page.dart';
import 'package:course_view/router/route.dart';
import 'package:course_view/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin MockExamController on Widget {
  void onNavigate(WidgetRef ref, PageController controller, bool forward) {
    final currentIndex = ref.watch(currentIndexProvider);
    final newIndex = currentIndex + (forward ? 1 : -1);
    controller.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  void onSelect(BuildContext context, WidgetRef ref, int index, String option) {
    if (ref.read(questionsProvider)[index].selection == null) {
      ref.read(questionsProvider.notifier).select(index, option);
    } else {
      showSnackbar(
        context: context,
        title: 'Question already attempted',
        subtitle: 'Press Next to move to the next question',
        type: SnackbarType.warning,
      );
    }
  }

  void onStop() {}
  void onPause() {}
  void onSubmit(BuildContext context, List<Questions> questions) {
    pushTo(context, SubmitPage(questions: questions));
  }
}
