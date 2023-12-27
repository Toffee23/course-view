import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:course_view/utils/crypto.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Download {
  late Directory _thumbnailDir;
  late Directory _videosDir;
  final Dio _dio = Dio();
  final Crypto _crypto = Crypto();

  Future<void> initialize() async {
    final root = await getApplicationDocumentsDirectory();
    _thumbnailDir = Directory(join(root.path, 'thumbnail'));
    _videosDir = Directory(join(root.path, 'videos'));

    if (!await _thumbnailDir.exists()) {
      await _thumbnailDir.create();
    }

    if (!await _videosDir.exists()) {
      await _videosDir.create();
    }
  }

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

      log('Video downloaded successfully to: $videoPath');
      return true;
    } catch (error) {
      log('Error downloading video: $error');
      return false;
    }
  }

  Future<File?> getThumbnail(String url, String id, String ext) async {
    final file = File(join(_thumbnailDir.path, '$id.$ext'));

    if (await file.exists()) {
      // File already download into file_path.
      return file;
    } else {
      // Download file into file_path.
      final data = await _downloadFile(url);

      if (data != null) {
        final bytes = _crypto.decryptBytes(data.toString());
        file.writeAsBytes(bytes);
        return file;
      }
      return null;
    }
  }

  Future<File?> getVideo(String url, String id, String ext) async {
    final file = File(join(_videosDir.path, '$id.$ext'));

    print('Anterer');

    // if (await file.exists()) {
    if (false) {
      // File already download into file_path.
      return file;
    } else {
      // Download file into file_path.
      url =
          'https://firebasestorage.googleapis.com/v0/b/video-application-c259e.appspot.com/o/97d8dd31760c8a9b3af0faa949f05c6c.mp4?alt=media&token=752c1119-34b8-4529-8bd4-a228230d9813';
      final data = await _downloadFile(url);

      if (data != null) {
        final root = await getDownloadsDirectory();
        await File('${root!.path}/azag.mp4').writeAsBytes(data);
        File downloadedFile = File('${_videosDir.parent.path}/az.mp4');
        await downloadedFile.writeAsBytes(data);
        List<int> encryptedBytes = await downloadedFile.readAsBytes();

        // Decrypt the file using your Crypto class
        List<int> decryptedBytes =
            _crypto.decryptBytes(base64.encode(encryptedBytes));

        print('Got here $url');
        print(data);
        final bytes = _crypto.decryptBytes(base64.encode(encryptedBytes));
        await file.writeAsBytes(bytes);

        await File('${root.path}/azag.mp4').writeAsBytes(bytes);
        print('Done ${root.path}/azag.mp4}');

        return file;
      }
      return null;
    }
  }

  Future<List<int>?> _downloadFile(String url) async {
    try {
      final Response<List<int>> response = await _dio.get<List<int>>(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        ),
      );

      return response.data!;
    } catch (error) {
      log('Error downloading video: $error');
      return null;
    }
  }

  Future<void> downloadFile(String fileUrl, String savePath) async {
    try {
      final Dio dio = Dio();
      final Response<List<int>> response = await dio.get<List<int>>(
        fileUrl,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );

      if (response.statusCode == 200) {
        File file = File(savePath);
        await file.writeAsBytes(response.data!);
        print('File downloaded successfully');
      } else {
        print('Failed to download file. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }
}

void main() async {
  // Specify the URL of the encrypted file to download
  final String fileUrl =
      'https://firebasestorage.googleapis.com/v0/b/video-application-c259e.appspot.com/o/23d6b1b7d5a102075415f02d84082794.mp4?alt=media&token=b525b9a1-b07d-44c4-9c86-fefd59062727';

  // Specify the path where you want to save the downloaded file
  final String downloadedFilePath = '/path/to/downloaded/file.aes';

  // Specify the path where you want to save the decrypted file
  final String decryptedFilePath = '/path/to/save/decrypted/file.mp4';

  // Create an instance of your Crypto class
  final Crypto crypto = Crypto();

  try {
    // Download the encrypted file using Dio
    await downloadFile(fileUrl, downloadedFilePath);

    // Read the downloaded encrypted file
    File downloadedFile = File(downloadedFilePath);
    List<int> encryptedBytes = await downloadedFile.readAsBytes();

    // Decrypt the file using your Crypto class
    List<int> decryptedBytes =
        crypto.decryptBytes(base64.encode(encryptedBytes));

    // Write the decrypted file
    File decryptedFile = File(decryptedFilePath);
    await decryptedFile.writeAsBytes(decryptedBytes);

    print('File decrypted successfully');
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> downloadFile(String fileUrl, String savePath) async {
  try {
    final Dio dio = Dio();
    final Response<List<int>> response = await dio.get<List<int>>(
      fileUrl,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );

    if (response.statusCode == 200) {
      File file = File(savePath);
      await file.writeAsBytes(response.data!);
      print('File downloaded successfully');
    } else {
      print('Failed to download file. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error downloading file: $e');
  }
}
