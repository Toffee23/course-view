import 'dart:io';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart';

class Crypto {
  final String _keyStorageKey = 'encryption_key';
  final String _ivStorageKey = 'encryption_iv';
  late IV _iv;
  late Encrypter _encrypter;

  Future<void> generateAndStoreKeyAndIv() async {
    const storage = FlutterSecureStorage();
    final key = Key.fromLength(32).base64;
    final iv = IV.fromLength(16).base64;
    await storage.write(key: _keyStorageKey, value: key);
    await storage.write(key: _ivStorageKey, value: iv);
  }

  Future<void> getStoredKeyAndIv() async {
    const storage = FlutterSecureStorage();
    final key = await storage.read(key: _keyStorageKey);
    final iv = await storage.read(key: _ivStorageKey);
    _iv = IV.fromBase64(iv!);
    _encrypter = Encrypter(AES(Key.fromBase64(key!)));
  }

  Encrypted encryptPlainText(String input) {
    return _encrypter.encrypt(input, iv: _iv);
  }

  String decryptPlainText(Encrypted encrypted) {
    return _encrypter.decrypt(encrypted, iv: _iv);
  }

  Future<Encrypted> encryptBytes(
    File file, [
    bool shouldSave = true,
    String? outputPath,
    String? outputName,
  ]) async {
    final Uint8List input = await file.readAsBytes();
    final Encrypted encrypted = _encrypter.encryptBytes(input, iv: _iv);

    if (shouldSave) {
      final filePath = outputPath ?? Directory(file.path).parent.path;
      final filename = outputName ?? basename(file.path).split('.').first;
      final outputFilePath = '$filePath/$filename.aes';
      await File(outputFilePath).writeAsBytes(encrypted.bytes);
    }
    return encrypted;
  }

  List<int> decryptBytes(Encrypted encrypted) {
    return _encrypter.decryptBytes(encrypted, iv: _iv);
  }
}
