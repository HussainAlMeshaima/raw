import 'dart:async';

import 'package:flutter/material.dart';
import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/router/router.gr.dart';
import 'package:raw/app/services/AuthService.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel(context) : super(context);
  Future<void> init() async {}

  void toggleIsHidden({bool? value}) {
    if (value != null)
      _isHidden = value;
    else
      _isHidden = !_isHidden;

    notifyListeners();
  }

  bool _isHidden = false;
  bool get isHidden => _isHidden;

  final AuthService _authService = locator<AuthService>();
  Future<void> doLogin() async {
    if (emailTextEditingController.text.trim().isEmpty) {
      showSnackBar('Email felid required');
    } else if (passwordTextEditingController.text.trim().isEmpty) {
      showSnackBar('Password felid required');
    } else if (emailTextEditingController.text.trim().isNotEmpty && passwordTextEditingController.text.trim().isNotEmpty) {
      String message = await _authService.signInWithEmailAndPassword(emailTextEditingController.text.trim(), passwordTextEditingController.text.trim());

      showSnackBar(message);
      if (message.contains('User Has Logged In')) {
        Timer(const Duration(seconds: 4), () => replaceNamed(const HomeRoute().path));
      } else {}
    }
  }

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
}
