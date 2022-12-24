import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:raw/app/models/User.dart';

@lazySingleton
class UserService {
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection('users');

  Future<User?> getUser(String id) async {
    User? user;
    await _collection.doc(id).get().then((value) {
      user = User.fromMap(value.data());
    });
    return user;
  }

  Future<User> create(String id, User user) async {
    Map<String, dynamic> _data = user.toMap();
    try {
      await _collection.doc(id).set(_data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return User.fromMap(_data);
  }
}
