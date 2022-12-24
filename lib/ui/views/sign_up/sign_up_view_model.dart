// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/services/AuthService.dart';
import 'package:raw/app/services/CloudStorageService.dart';
import 'package:raw/app/services/UserService.dart';

import '../../../app/models/user.dart';
import '../../../app/router/router.gr.dart';

class SignUpViewModel extends BaseViewModel {
  SignUpViewModel(context) : super(context);

  Future<void> init() async {}

  final AuthService _authService = locator<AuthService>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final UserService _userService = locator<UserService>();

  void openCamera() async {
    _userImage = await _picker.pickImage(source: ImageSource.camera);
    notifyListeners();
  }

  void openGallery() async {
    _userImage = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  bool _isNext = false;
  bool get isNext => _isNext;

  void goBackToPart1() {
    _isNext = false;
    notifyListeners();
  }

  final ImagePicker _picker = ImagePicker();
  ImagePicker get picker => _picker;

  XFile? _userImage;
  XFile? get userImage => _userImage;

  void toggleIsNext() {
    if (nameTextEditingController.text.trim().isEmpty) {
      showSnackBar('Please add name');
    } else if (phoneNumberTextEditingController.text.trim().isEmpty) {
      showSnackBar('Please add phone number');
    } else if (emailTextEditingController.text.trim().isEmpty) {
      showSnackBar('Please add email');
    } else if (_userImage == null) {
      showSnackBar('Please add profile image');
    } else if (nameTextEditingController.text.trim().isNotEmpty &&
        phoneNumberTextEditingController.text.trim().isNotEmpty &&
        emailTextEditingController.text.trim().isNotEmpty) {
      _isNext = true;
    }
    notifyListeners();
  }

  Future<void> createAccountOnPress() async {
    if (passwordTextEditingController.text.trim().isEmpty) {
      showSnackBar('Please add password');
    } else if (confirmPasswordTextEditingController.text.trim().isEmpty) {
      showSnackBar('Please add confirm password');
    } else if (confirmPasswordTextEditingController.text.trim() !=
        passwordTextEditingController.text.trim()) {
      showSnackBar('Password mismatch');
    } else if (confirmPasswordTextEditingController.text.trim() ==
        passwordTextEditingController.text.trim()) {
      toggleIsLoading();

      String message = await _authService.createUserWithEmailAndPassword(
          emailTextEditingController.text.trim(),
          passwordTextEditingController.text.trim());

      showSnackBar(message);

      if (message.contains('User has been created successfully')) {
        String userId = await _authService.userId() ?? '';
        String email = emailTextEditingController.text.trim();
        String name = nameTextEditingController.text.trim();
        String imageLink = await uploadFile(userId) ?? '';

        User? user = await _userService.create(
            userId, User(email: email, name: name, image: imageLink));

        if (user != null) {
          showSnackBar('User created.');
          Timer(const Duration(seconds: 4),
              () => replaceNamed(const HomeRoute().path));
        }
      }

      toggleIsLoading();
    }
  }

  Future<String?> uploadFile(String userId) async {
    if (_userImage != null) {
      return await _cloudStorageService.uploadAnImage(
          File(_userImage!.path), userId,
          path: 'users/$userId/user_image.png');
    }
    return null;
  }

  void toggleIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController nameTextEditingController = TextEditingController();
  final TextEditingController phoneNumberTextEditingController = TextEditingController();
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  final TextEditingController confirmPasswordTextEditingController = TextEditingController();
}
