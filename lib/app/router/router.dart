import 'package:auto_route/auto_route.dart';
import 'package:raw/ui/views/home/home_view.dart';
import 'package:raw/ui/views/otp/otp_view.dart';
import 'package:raw/ui/views/settings/settings_view.dart';
import 'package:raw/ui/views/startup/startup_view.dart';

import '../../ui/views/address/address_view.dart';
import '../../ui/views/bording/bording_view.dart';
import '../../ui/views/login/login_view.dart';
import '../../ui/views/photographer/photographer_view.dart';
import '../../ui/views/profile/profile_view.dart';
import '../../ui/views/sign_up/sign_up_view.dart';
import '../../ui/views/videographer/videographer_view.dart';

export './router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    AdaptiveRoute(page: StartupView),
    AdaptiveRoute(page: BordingView),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: SignUpView),
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: OtpView),
    AdaptiveRoute(page: AddressView),
    AdaptiveRoute(page: ProfileView),
    AdaptiveRoute(page: PhotographerView),
    AdaptiveRoute(page: VideographerView),
    AdaptiveRoute(page: SettingsView, initial: true),
  ],
)
class $RawRouter {}
