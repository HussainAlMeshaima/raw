import 'package:flutter/material.dart';
import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/models/Freelancer.dart';
import 'package:raw/app/models/User.dart';
import 'package:raw/app/router/router.dart';
import 'package:raw/app/services/AuthService.dart';
import 'package:raw/app/services/FreelancerService.dart';
import 'package:raw/app/services/UserService.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(context) : super(context);
  Future<void> init() async {
    String uuid = await _authService.userId() ?? '';
    _user = await _userService.getUser(uuid);
    _freelancers = await _freelancerService.getFreelancers();
    toggleIsLoading();
  }

  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();
  final FreelancerService _freelancerService = locator<FreelancerService>();

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

  List<Freelancer> _freelancers = [];
  List<Freelancer> get freelancers => _freelancers;

  void searchOnSubmitted(String? value) => push(SearchRoute(value: value));
}
