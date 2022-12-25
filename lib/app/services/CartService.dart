// ignore_for_file: file_names

import 'package:injectable/injectable.dart';
import 'package:raw/app/models/Package.dart';

@lazySingleton
class CartService {
  final List<Package> _package = [];
  List<Package> getPackages() => _package;

  void addPackage(dynamic value) => _package.add(value);
  void removeAllPackages() => _package.clear();
  void getPackage(int index) => _package[index];

  void increment(Package package) {
    if (_package.isEmpty) return;

    Package p = _package.firstWhere((Package element) => element == package);
    p.count++;
  }

  void decrement(Package package) {
    if (_package.isEmpty) return;

    Package p = _package.firstWhere((Package element) => element == package);
    if (p.count != 1) {
      p.count--;
    }
  }
}
