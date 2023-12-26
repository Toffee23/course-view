import 'package:course_view/core/api_handler/api_handler_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api_handler/api_services.dart';
import 'model.dart';

final coursesProvider =
    StateNotifierProvider<CoursesNotifier, List<CoursesModel>?>(
        (ref) => CoursesNotifier(ref));

class CoursesNotifier extends StateNotifier<List<CoursesModel>?> {
  CoursesNotifier(this.ref, {this.courses}) : super(courses) {
    initialize();
  }
  final Ref ref;
  final List<CoursesModel>? courses;
  final ClientApi _clientApi = ClientApi();

  Future<void> initialize() async {
    final result = await _clientApi.getAllCourses();

    switch (result.status) {
      case ResponseStatus.pending:
      // TODO: Handle this case.
      case ResponseStatus.successful:
        return _getAllCoursesSuccessful(result.data);
      case ResponseStatus.failed:
      // TODO: Handle this case.
      case ResponseStatus.socketExceptionError:
      // TODO: Handle this case.
      case ResponseStatus.unknownError:
      // TODO: Handle this case.
    }
  }

  void _getAllCoursesSuccessful(data) {
    state =
        data.map<CoursesModel>((json) => CoursesModel.fromJson(json)).toList();
  }
}
