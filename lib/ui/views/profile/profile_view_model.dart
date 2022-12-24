import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raw/app/core/base_view_model.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel(context) : super(context);
  Future<void> init() async {}

  void toggleIsNotChangable({bool? value}) {
    _isNotChangable = !_isNotChangable;
    notifyListeners();
  }

  bool _isNotChangable = true;
  bool get isNotChangable => _isNotChangable;

  void openCamera() async {
    _userImage = await _picker.pickImage(source: ImageSource.camera);
    notifyListeners();
  }

  void openGallery() async {
    _userImage = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  final ImagePicker _picker = ImagePicker();
  ImagePicker get picker => _picker;

  XFile? _userImage;
  XFile? get userImage => _userImage;

  final TextEditingController nameTextEditingController = TextEditingController();
  final TextEditingController phoneNumberTextEditingController = TextEditingController();
  final TextEditingController emailTextEditingController = TextEditingController();
}
