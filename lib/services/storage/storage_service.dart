import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:uuid/uuid.dart';

class StorageService {
  final _uuid = const Uuid();

  Future<String> uploadFile(File file) async {
    try {
      final uniqueId = _uuid.v4();

      final tmpDir = await path_provider.getTemporaryDirectory();
      final targetName = DateTime.now().millisecondsSinceEpoch;
      final XFile? compressFile = await FlutterImageCompress.compressAndGetFile(
        file.path,
        '${tmpDir.absolute.path}/$targetName.jpg',
        quality: 70,
        // minWidth: 500,
        // minHeight: 500,
      );

      final fstorage = FirebaseStorage.instance;
      final XFile image = compressFile!;
      final Reference storageRef =
          fstorage.ref().child('Users_files/$uniqueId');
      final UploadTask uploadTask = storageRef.putFile(File(image.path));
      return (await uploadTask).ref.getDownloadURL();
    } catch (e) {
      log('Error: $e');
      return '';
    }
  }

  Future<bool> deleteImage({required path}) async {
    try {
      await FirebaseStorage.instance.refFromURL(path).delete();
      log('Successfully deleted $path storage item');
      return true;
    } on Exception catch (e) {
      log('Error: $e');
      return false;
    }
  }
}

final StorageService storageService = StorageService();
