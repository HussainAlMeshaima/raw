// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FireStoreService {
  final FirebaseFirestore instance = FirebaseFirestore.instance;
}
