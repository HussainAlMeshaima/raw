import 'dart:async';

import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/router/router.gr.dart';
import 'package:raw/app/services/AuthService.dart';

class FreelancePanelViewModel extends BaseViewModel {
  FreelancePanelViewModel(context) : super(context);
  Future<void> init() async {}

  final AuthService _authService = locator<AuthService>();

  Future<void> doLogout() async {
    String message = await _authService.signOut();

    if (message.contains('User has sign out successfully')) {
      showSnackBar(message, duration: const Duration(seconds: 3));
      Timer(const Duration(seconds: 4), () {
        pushNamed(const LoginRoute().path);
      });
    }
  }
}
