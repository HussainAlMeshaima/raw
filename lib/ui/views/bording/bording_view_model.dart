import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/models/User.dart' as model;
import 'package:raw/app/router/router.dart';
import 'package:raw/app/services/AuthService.dart' as auth;
import 'package:raw/app/services/UserService.dart';

class BordingViewModel extends BaseViewModel {
  BordingViewModel(context) : super(context);

  final auth.AuthService _authService = locator<auth.AuthService>();
  final UserService _userService = locator<UserService>();

  Future<void> init() async {
    if (_authService.user != null) {
      String uuid = _authService.user!.uid;
      _user = await _userService.getUser(uuid);

      if (_user?.isAdmin == false) {
        pushNamed(const AdminRoute().path);
      } else {
        pushNamed(const HomeRoute().path);
      }
    }
  }

  late model.User? _user;
  model.User? get user => _user;
}
