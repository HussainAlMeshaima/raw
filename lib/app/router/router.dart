import 'package:auto_route/auto_route.dart';
import 'package:raw/ui/views/add_freelancer/add_freelancer_view.dart';
import 'package:raw/ui/views/booking_checkout/booking_checkout_view.dart';
import 'package:raw/ui/views/check_out/check_out_view.dart';
import 'package:raw/ui/views/freelance_panel/freelance_panel_view.dart';
import 'package:raw/ui/views/home/home_view.dart';
import 'package:raw/ui/views/otp/otp_view.dart';
import 'package:raw/ui/views/rent_orders/rent_orders_view.dart';
import 'package:raw/ui/views/search/search_view.dart';
import 'package:raw/ui/views/startup/startup_view.dart';
import 'package:raw/ui/views/studio/studio_view.dart';

import '../../ui/views/address/address_view.dart';
import '../../ui/views/admin/admin_view.dart';
import '../../ui/views/appointments/appointments_view.dart';
import '../../ui/views/booking/booking_view.dart';
import '../../ui/views/bording/bording_view.dart';
import '../../ui/views/cart/cart_view.dart';
import '../../ui/views/login/login_view.dart';
import '../../ui/views/photographer/photographer_view.dart';
import '../../ui/views/profile/profile_view.dart';
import '../../ui/views/rent/rent_view.dart';
import '../../ui/views/settings/settings_view.dart';
import '../../ui/views/sign_up/sign_up_view.dart';
import '../../ui/views/videographer/videographer_view.dart';

export './router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    AdaptiveRoute(page: StartupView),
    AdaptiveRoute(page: BordingView, initial: true),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: SignUpView),
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: OtpView),
    AdaptiveRoute(page: AddressView),
    AdaptiveRoute(page: ProfileView),
    AdaptiveRoute(page: PhotographerView),
    AdaptiveRoute(page: VideographerView),
    AdaptiveRoute(page: StudioView),
    AdaptiveRoute(page: RentView),
    AdaptiveRoute(page: BookingView),
    AdaptiveRoute(page: AdminView),
    AdaptiveRoute(page: AppointmentsView),
    AdaptiveRoute(page: SettingsView),
    AdaptiveRoute(page: CartView),
    AdaptiveRoute(page: CheckOutView),
    AdaptiveRoute(page: AddFreelancerView),
    AdaptiveRoute(page: RentOrdersView),
    AdaptiveRoute(page: FreelancePanelView),
    AdaptiveRoute(page: SearchView),
    AdaptiveRoute(page: BookingCheckoutView),
  ],
)
class $RawRouter {}
