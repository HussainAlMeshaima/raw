import 'package:flutter/material.dart';
import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/models/User.dart';
import 'package:raw/app/services/AuthService.dart';
import 'package:raw/app/services/UserService.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(context) : super(context);
  Future<void> init() async {
    String uuid = await _authService.userId() ?? '';
    _user = await _userService.getUser(uuid);
    toggleIsLoading();
  }

  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();

  void updateIndex({required int value}) {
    _current = value;

    notifyListeners();
  }

  void toggleIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  int _current = 0;
  int get current => _current;

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  late User? _user;
  User? get user => _user;

  bool _isLoading = true;
  bool get isLoading => _isLoading;
}
