import 'package:flutter/material.dart';
import 'package:raw/app/core/custom_base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/router/router.dart';
import 'package:raw/app/services/router_service.dart';

class StartupViewModel extends CustomBaseViewModel {
  final RouterService _routerService = locator<RouterService>();

  Future<void> init() async {
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) async {
      await navigateToHomeView();
    });
  }

  Future navigateToHomeView() async => await _routerService.router.push(const HomeRoute());
}