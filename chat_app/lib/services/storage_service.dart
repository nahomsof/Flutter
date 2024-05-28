import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _fibaseStorage = FirebaseStorage.instance;
  StorageService() {}
  Future<String?> uploaduserPfp({
    required File file,
    required String uid,
  }) async {}
}
