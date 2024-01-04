import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../utils/download.dart';
import 'api_endpoints.dart';
import 'api_handler_models.dart';

class ClientApi {
  late Download _download;
  final _dio = Dio();

  Future<void> init() async {
    _download = Download();
    await _download.initialize();
  }

  Future<ResponseModel> getAllCourses() async {
    try {
      log(ApiUrl.allCourses.toString());
      final response = await _dio.get(
        ApiUrl.allCourses,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      final body = response.data;
      final statusCode = response.statusCode;
      return ResponseModel.fromJson(body).copyWith(
        status: statusCode == 202
            ? ResponseStatus.successful
            : ResponseStatus.failed,
      );
    } on SocketException catch (e) {
      log('[SOCKET_EXCEPTION_ERROR]\n$e');
      return ResponseModel.fromSocketException();
    } catch (e) {
      log('[UNKNOWN_ERROR] (Most likely caused from server)\n$e');
      return ResponseModel.fromUnknownError();
    }
  }

  Future<ResponseModel> getAllCourseById(String id) async {
    try {
      final response = await _dio.get(
        '${ApiUrl.getCourseById}/$id',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      log('${ApiUrl.getCourseById}/$id');
      final body = response.data;
      final statusCode = response.statusCode;
      return ResponseModel.fromJson(body).copyWith(
        data: response.data['courseDetails'],
        status: statusCode == 202
            ? ResponseStatus.successful
            : ResponseStatus.failed,
      );
    } on SocketException catch (e) {
      log('[SOCKET_EXCEPTION_ERROR]\n$e');
      return ResponseModel.fromSocketException();
    } catch (e) {
      log('[UNKNOWN_ERROR] (Most likely caused from server)\n$e');
      return ResponseModel.fromUnknownError();
    }
  }

  Future<ResponseModel> pay(data) async {
    try {
      log(ApiUrl.payment.toString());
      final response = await _dio.post(
        ApiUrl.payment,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: data,
      );
      final body = response.data;
      log(body.toString());
      final statusCode = response.statusCode;
      return ResponseModel.fromJson(body).copyWith(
        data: body['data'],
        status: statusCode == 200
            ? ResponseStatus.successful
            : ResponseStatus.failed,
      );
    } on SocketException catch (e) {
      log('[SOCKET_EXCEPTION_ERROR]\n$e');
      return ResponseModel.fromSocketException();
    } catch (e) {
      log('[UNKNOWN_ERROR] (Most likely caused from server)\n$e');
      return ResponseModel.fromUnknownError();
    }
  }

  Future<ResponseModel> verifyPayment(String ref) async {
    try {
      final response = await _dio.get(
        '${ApiUrl.verify}/$ref',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      final body = response.data;
      log('AZAGY 2222, ${body.toString()}');
      final statusCode = response.statusCode;
      return ResponseModel.fromJson(body).copyWith(
        data: body['data'],
        status: statusCode == 200
            ? ResponseStatus.successful
            : ResponseStatus.failed,
      );
    } on SocketException catch (e) {
      log('[SOCKET_EXCEPTION_ERROR]\n$e');
      return ResponseModel.fromSocketException();
    } catch (e) {
      log('[UNKNOWN_ERROR] (Most likely caused from server)\n$e');
      return ResponseModel.fromUnknownError();
    }
  }

  Future<ResponseModel> getAllCourses1(az) async {
    try {
      log(ApiUrl.allCourses.toString());
      final response = await _dio.get(
        '${ApiUrl.verify}/$az',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      final body = response.data;
      log(body.toString());
      final statusCode = response.statusCode;
      return ResponseModel.fromJson(body).copyWith(
        status: statusCode == 202
            ? ResponseStatus.successful
            : ResponseStatus.failed,
      );
    } on SocketException catch (e) {
      log('[SOCKET_EXCEPTION_ERROR]\n$e');
      return ResponseModel.fromSocketException();
    } catch (e) {
      log('[UNKNOWN_ERROR] (Most likely caused from server)\n$e');
      return ResponseModel.fromUnknownError();
    }
  }
}
