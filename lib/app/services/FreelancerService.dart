// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/models/Freelancer.dart';
import 'package:raw/app/models/Package.dart';
import 'package:raw/app/services/AuthService.dart';

import '../models/user.dart';

@lazySingleton
class FreelancerService {
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection('freelancers');

  final AuthService _authService = locator<AuthService>();

  Future<List<Freelancer>> getFreelancers() async {
    List<Freelancer> _freelancers = [];

    await _collection
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> values) async {
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in values.docs) {
        var data = doc.data();

        DocumentSnapshot _userDoc =
            await ((data['user']) as DocumentReference).get();

        User? _user;
        if (_userDoc.data() != null) {
          _user = User.fromMap(_userDoc.data() as Map<String, dynamic>);
        }

        List<Package> _packages = [];
        for (DocumentReference package in (data['packages']) as List<dynamic>) {
          DocumentSnapshot pp = await package.get();
          _packages.add(Package.fromMap(pp.data() as Map<String, dynamic>));
        }

        Map<String, dynamic> _data = {};
        _data.addAll(data);
        _data['user'] = _user;
        _data['packages'] = _packages;

        Freelancer freelancer = Freelancer.fromMap(_data);
        _freelancers.add(freelancer);
      }
    });

    return _freelancers;
  }
}
