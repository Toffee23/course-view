import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api_handler/api_services.dart';
import 'model.dart';

final courseProvider =
    FutureProvider.family<CourseModel, String>((ref, id) async {
  final ClientApi clientApi = ClientApi();

  final result = await clientApi.getAllCourseById(id);
  log('AZAG IS HERE ${result.data}');
  return CourseModel.fromJson(result.data);
});
