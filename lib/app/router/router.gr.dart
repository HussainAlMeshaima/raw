// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;
import 'package:raw/ui/views/add_freelancer/add_freelancer_view.dart' as _i19;
import 'package:raw/ui/views/address/address_view.dart' as _i7;
import 'package:raw/ui/views/admin/admin_view.dart' as _i14;
import 'package:raw/ui/views/appointments/appointments_view.dart' as _i15;
import 'package:raw/ui/views/booking/booking_view.dart' as _i13;
import 'package:raw/ui/views/bording/bording_view.dart' as _i2;
import 'package:raw/ui/views/cart/cart_view.dart' as _i17;
import 'package:raw/ui/views/check_out/check_out_view.dart' as _i18;
import 'package:raw/ui/views/freelance_panel/freelance_panel_view.dart' as _i21;
import 'package:raw/ui/views/home/home_view.dart' as _i5;
import 'package:raw/ui/views/login/login_view.dart' as _i3;
import 'package:raw/ui/views/otp/otp_view.dart' as _i6;
import 'package:raw/ui/views/photographer/photographer_view.dart' as _i9;
import 'package:raw/ui/views/profile/profile_view.dart' as _i8;
import 'package:raw/ui/views/rent/rent_view.dart' as _i12;
import 'package:raw/ui/views/rent_orders/rent_orders_view.dart' as _i20;
import 'package:raw/ui/views/settings/settings_view.dart' as _i16;
import 'package:raw/ui/views/sign_up/sign_up_view.dart' as _i4;
import 'package:raw/ui/views/startup/startup_view.dart' as _i1;
import 'package:raw/ui/views/studio/studio_view.dart' as _i11;
import 'package:raw/ui/views/videographer/videographer_view.dart' as _i10;

class RawRouter extends _i22.RootStackRouter {
  RawRouter([_i23.GlobalKey<_i23.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
      );
    },
    BordingRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.BordingView(),
        opaque: true,
      );
    },
    LoginRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginView(),
        opaque: true,
      );
    },
    SignUpRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpView(),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
        opaque: true,
      );
    },
    OtpRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.OtpView(),
        opaque: true,
      );
    },
    AddressRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.AddressView(),
        opaque: true,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileView(),
        opaque: true,
      );
    },
    PhotographerRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.PhotographerView(),
        opaque: true,
      );
    },
    VideographerRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.VideographerView(),
        opaque: true,
      );
    },
    StudioRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.StudioView(),
        opaque: true,
      );
    },
    RentRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.RentView(),
        opaque: true,
      );
    },
    BookingRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.BookingView(),
        opaque: true,
      );
    },
    AdminRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i14.AdminView(),
        opaque: true,
      );
    },
    AppointmentsRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.AppointmentsView(),
        opaque: true,
      );
    },
    SettingsRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i16.SettingsView(),
        opaque: true,
      );
    },
    CartRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.CartView(),
        opaque: true,
      );
    },
    CheckOutRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.CheckOutView(),
        opaque: true,
      );
    },
    AddFreelancerRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.AddFreelancerView(),
        opaque: true,
      );
    },
    RentOrdersRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i20.RentOrdersView(),
        opaque: true,
      );
    },
    FreelancePanelRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i21.FreelancePanelView(),
        opaque: true,
      );
    },
  };

  @override
  List<_i22.RouteConfig> get routes => [
        _i22.RouteConfig(
          StartupRoute.name,
          path: '/startup-view',
        ),
        _i22.RouteConfig(
          BordingRoute.name,
          path: '/',
        ),
        _i22.RouteConfig(
          LoginRoute.name,
          path: '/login-view',
        ),
        _i22.RouteConfig(
          SignUpRoute.name,
          path: '/sign-up-view',
        ),
        _i22.RouteConfig(
          HomeRoute.name,
          path: '/home-view',
        ),
        _i22.RouteConfig(
          OtpRoute.name,
          path: '/otp-view',
        ),
        _i22.RouteConfig(
          AddressRoute.name,
          path: '/address-view',
        ),
        _i22.RouteConfig(
          ProfileRoute.name,
          path: '/profile-view',
        ),
        _i22.RouteConfig(
          PhotographerRoute.name,
          path: '/photographer-view',
        ),
        _i22.RouteConfig(
          VideographerRoute.name,
          path: '/videographer-view',
        ),
        _i22.RouteConfig(
          StudioRoute.name,
          path: '/studio-view',
        ),
        _i22.RouteConfig(
          RentRoute.name,
          path: '/rent-view',
        ),
        _i22.RouteConfig(
          BookingRoute.name,
          path: '/booking-view',
        ),
        _i22.RouteConfig(
          AdminRoute.name,
          path: '/admin-view',
        ),
        _i22.RouteConfig(
          AppointmentsRoute.name,
          path: '/appointments-view',
        ),
        _i22.RouteConfig(
          SettingsRoute.name,
          path: '/settings-view',
        ),
        _i22.RouteConfig(
          CartRoute.name,
          path: '/cart-view',
        ),
        _i22.RouteConfig(
          CheckOutRoute.name,
          path: '/check-out-view',
        ),
        _i22.RouteConfig(
          AddFreelancerRoute.name,
          path: '/add-freelancer-view',
        ),
        _i22.RouteConfig(
          RentOrdersRoute.name,
          path: '/rent-orders-view',
        ),
        _i22.RouteConfig(
          FreelancePanelRoute.name,
          path: '/freelance-panel-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupRoute extends _i22.PageRouteInfo<void> {
  const StartupRoute()
      : super(
          StartupRoute.name,
          path: '/startup-view',
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.BordingView]
class BordingRoute extends _i22.PageRouteInfo<void> {
  const BordingRoute()
      : super(
          BordingRoute.name,
          path: '/',
        );

  static const String name = 'BordingRoute';
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.SignUpView]
class SignUpRoute extends _i22.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/sign-up-view',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.OtpView]
class OtpRoute extends _i22.PageRouteInfo<void> {
  const OtpRoute()
      : super(
          OtpRoute.name,
          path: '/otp-view',
        );

  static const String name = 'OtpRoute';
}

/// generated route for
/// [_i7.AddressView]
class AddressRoute extends _i22.PageRouteInfo<void> {
  const AddressRoute()
      : super(
          AddressRoute.name,
          path: '/address-view',
        );

  static const String name = 'AddressRoute';
}

/// generated route for
/// [_i8.ProfileView]
class ProfileRoute extends _i22.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-view',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.PhotographerView]
class PhotographerRoute extends _i22.PageRouteInfo<void> {
  const PhotographerRoute()
      : super(
          PhotographerRoute.name,
          path: '/photographer-view',
        );

  static const String name = 'PhotographerRoute';
}

/// generated route for
/// [_i10.VideographerView]
class VideographerRoute extends _i22.PageRouteInfo<void> {
  const VideographerRoute()
      : super(
          VideographerRoute.name,
          path: '/videographer-view',
        );

  static const String name = 'VideographerRoute';
}

/// generated route for
/// [_i11.StudioView]
class StudioRoute extends _i22.PageRouteInfo<void> {
  const StudioRoute()
      : super(
          StudioRoute.name,
          path: '/studio-view',
        );

  static const String name = 'StudioRoute';
}

/// generated route for
/// [_i12.RentView]
class RentRoute extends _i22.PageRouteInfo<void> {
  const RentRoute()
      : super(
          RentRoute.name,
          path: '/rent-view',
        );

  static const String name = 'RentRoute';
}

/// generated route for
/// [_i13.BookingView]
class BookingRoute extends _i22.PageRouteInfo<void> {
  const BookingRoute()
      : super(
          BookingRoute.name,
          path: '/booking-view',
        );

  static const String name = 'BookingRoute';
}

/// generated route for
/// [_i14.AdminView]
class AdminRoute extends _i22.PageRouteInfo<void> {
  const AdminRoute()
      : super(
          AdminRoute.name,
          path: '/admin-view',
        );

  static const String name = 'AdminRoute';
}

/// generated route for
/// [_i15.AppointmentsView]
class AppointmentsRoute extends _i22.PageRouteInfo<void> {
  const AppointmentsRoute()
      : super(
          AppointmentsRoute.name,
          path: '/appointments-view',
        );

  static const String name = 'AppointmentsRoute';
}

/// generated route for
/// [_i16.SettingsView]
class SettingsRoute extends _i22.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings-view',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i17.CartView]
class CartRoute extends _i22.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart-view',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i18.CheckOutView]
class CheckOutRoute extends _i22.PageRouteInfo<void> {
  const CheckOutRoute()
      : super(
          CheckOutRoute.name,
          path: '/check-out-view',
        );

  static const String name = 'CheckOutRoute';
}

/// generated route for
/// [_i19.AddFreelancerView]
class AddFreelancerRoute extends _i22.PageRouteInfo<void> {
  const AddFreelancerRoute()
      : super(
          AddFreelancerRoute.name,
          path: '/add-freelancer-view',
        );

  static const String name = 'AddFreelancerRoute';
}

/// generated route for
/// [_i20.RentOrdersView]
class RentOrdersRoute extends _i22.PageRouteInfo<void> {
  const RentOrdersRoute()
      : super(
          RentOrdersRoute.name,
          path: '/rent-orders-view',
        );

  static const String name = 'RentOrdersRoute';
}

/// generated route for
/// [_i21.FreelancePanelView]
class FreelancePanelRoute extends _i22.PageRouteInfo<void> {
  const FreelancePanelRoute()
      : super(
          FreelancePanelRoute.name,
          path: '/freelance-panel-view',
        );

  static const String name = 'FreelancePanelRoute';
}
