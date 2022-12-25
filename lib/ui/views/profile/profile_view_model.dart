import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/models/User.dart';
import 'package:raw/app/services/AuthService.dart';
import 'package:raw/app/services/UserService.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel(context) : super(context);
  Future<void> init() async {
    String uuid = await _authService.userId() ?? '';
    _user = await _userService.getUser(uuid);
    emailTextEditingController.text = _user?.email?? '';
    nameTextEditingController.text = _user?.name?? '';
    toggleIsLoading();
  }

  final UserService _userService = locator<UserService>();
  final AuthService _authService = locator<AuthService>();

  bool _isNotChangeable = true;
  bool get isNotChangeable => _isNotChangeable;

  void openCamera() async {
    _userImage = await _picker.pickImage(source: ImageSource.camera);
    notifyListeners();
  }

  void openGallery() async {
    _userImage = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  void toggleIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  final ImagePicker _picker = ImagePicker();
  ImagePicker get picker => _picker;

  XFile? _userImage;
  XFile? get userImage => _userImage;

  late User? _user;
  User? get user => _user;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
}
