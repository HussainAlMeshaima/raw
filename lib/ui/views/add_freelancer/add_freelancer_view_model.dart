import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raw/app/core/base_view_model.dart';

class AddFreelancerViewModel extends BaseViewModel {
  AddFreelancerViewModel(context) : super(context);
  Future<void> init() async {}

  void toggleIsPhotographer({bool? value}) {
    if (value != null) {
      _photographers = value;
    } else {
      _photographers = !_photographers;
    }

    notifyListeners();
  }

  void toggleIsVideographer({bool? value}) {
    if (value != null) {
      _videographer = value;
    } else {
      _videographer = !_videographer;
    }

    notifyListeners();
  }

  void toggleIsStudio({bool? value}) {
    if (value != null) {
      _studio = value;
    } else {
      _studio = !_studio;
    }

    notifyListeners();
  }

  void openCamera() async {
    _userImage = await _picker.pickImage(source: ImageSource.camera);
    notifyListeners();
  }

  void openGallery() async {
    _userImage = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  bool _studio = false;
  bool get studio => _studio;

  bool _videographer = false;
  bool get videographer => _videographer;

  bool _photographers = false;
  bool get photographers => _photographers;

  final ImagePicker _picker = ImagePicker();
  ImagePicker get picker => _picker;

  XFile? _userImage;
  XFile? get userImage => _userImage;

  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();
}
