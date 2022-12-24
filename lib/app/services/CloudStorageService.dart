import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CloudStorageService {
  firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref('/users');

  Future<String?> uploadAnImage(File file, String userId,
      {String path = 'users/userId/imageName.png'}) async {
    firebase_storage.Reference reference =
        firebase_storage.FirebaseStorage.instance.ref().child(path);

    firebase_storage.UploadTask uploadTask = reference.putFile(file);

    firebase_storage.TaskSnapshot taskSnapshot =
        await uploadTask.whenComplete(() {
      if (kDebugMode) print('Image has been uploaded to firebase Storage');
    });

    String? imageUrl;

    try {
      imageUrl = await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      if (kDebugMode) print(e);
    }

    return imageUrl;
  }
}
