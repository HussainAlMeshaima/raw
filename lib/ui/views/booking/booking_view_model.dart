import 'package:flutter/material.dart';
import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/models/Freelancer.dart';

class BookingViewModel extends BaseViewModel {
  BookingViewModel(BuildContext context, Freelancer freelancer)
      : super(context) {
    _freelancer = freelancer;
  }
  Future<void> init() async {}
  void toggleIsSelected({bool? value}) {
    if (value != null)
      _isSelected = value;
    else
      _isSelected = !_isSelected;

    notifyListeners();
  }

  bool _isSelected = false;
  bool get isSelected => _isSelected;

  late Freelancer _freelancer;
  Freelancer get freelancer => _freelancer;
}
