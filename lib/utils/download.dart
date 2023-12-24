import 'dart:developer';
import 'dart:io';

import 'package:course_view/utils/crypto.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class Download {
  static Future<Directory> get downloadDirectory async {
    return await getApplicationDocumentsDirectory();
  }

  static Future<bool> downloadForOffline(String url, String id) async {
    final Dio dio = Dio();

    try {
      final Response<List<int>> response = await dio.get<List<int>>(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        ),
      );

      final Directory dir = await downloadDirectory;
      final videoPath = '${dir.path}/$id.mp4';

      await File(videoPath).writeAsBytes(response.data!);

      decryptFile();

      log('Video downloaded successfully to: $videoPath');
      return true;
    } catch (error) {
      log('Error downloading video: $error');
      return false;
    }
  }

  static void decryptFile() {
    final crypto = Crypto();
    crypto;
  }
}
