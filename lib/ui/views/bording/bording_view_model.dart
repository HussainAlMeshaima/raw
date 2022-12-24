import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/router/router.dart';
import 'package:raw/app/services/AuthService.dart';

class BordingViewModel extends BaseViewModel {
  BordingViewModel(context) : super(context);

  final AuthService _authService = locator<AuthService>();

  Future<void> init() async {
    if (_authService.user != null) {
      pushNamed(const HomeRoute().path);
    }
  }
}
