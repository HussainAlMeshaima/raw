import 'package:flutter/material.dart';
import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/models/Freelancer.dart';
import 'package:raw/app/models/Package.dart';

class BookingViewModel extends BaseViewModel {
  BookingViewModel(BuildContext context, Freelancer freelancer)
      : super(context) {
    _freelancer = freelancer;
  }
  Future<void> init() async {}

  int? _selectedPackageIndex;
  int? get selectedPackageIndex => _selectedPackageIndex;

  Package? _selectedPackage;
  Package? get selectedPackage => _selectedPackage;



  late Freelancer _freelancer;
  Freelancer get freelancer => _freelancer;

  void toggleSelectedPackage(int index) {
    _selectedPackage = _freelancer.packages?[index];
    _selectedPackageIndex = index;

    notifyListeners();

  }
}
