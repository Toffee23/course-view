import 'package:course_view/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/themes.dart';
import 'pages/navigation/page.dart';

void main() => runApp(const ProviderScope(child: ExcelAcademy()));

class ExcelAcademy extends ConsumerWidget {
  const ExcelAcademy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Excel Academy',
      theme: AppThemeData.light(),
      darkTheme: AppThemeData.dark(),
      themeMode: ref.watch(themeModeProvider),
      home: const NavigationPage(),
    );
  }
}
