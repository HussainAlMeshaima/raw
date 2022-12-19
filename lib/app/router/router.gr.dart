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
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:raw/ui/views/address/address_view.dart' as _i7;
import 'package:raw/ui/views/admin/admin_view.dart' as _i12;
import 'package:raw/ui/views/bording/bording_view.dart' as _i2;
import 'package:raw/ui/views/home/home_view.dart' as _i5;
import 'package:raw/ui/views/login/login_view.dart' as _i3;
import 'package:raw/ui/views/otp/otp_view.dart' as _i6;
import 'package:raw/ui/views/photographer/photographer_view.dart' as _i9;
import 'package:raw/ui/views/profile/profile_view.dart' as _i8;
import 'package:raw/ui/views/settings/settings_view.dart' as _i11;
import 'package:raw/ui/views/sign_up/sign_up_view.dart' as _i4;
import 'package:raw/ui/views/startup/startup_view.dart' as _i1;
import 'package:raw/ui/views/videographer/videographer_view.dart' as _i10;

class RawRouter extends _i13.RootStackRouter {
  RawRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
      );
    },
    BordingRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.BordingView(),
        opaque: true,
      );
    },
    LoginRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginView(),
        opaque: true,
      );
    },
    SignUpRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpView(),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
        opaque: true,
      );
    },
    OtpRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.OtpView(),
        opaque: true,
      );
    },
    AddressRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.AddressView(),
        opaque: true,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileView(),
        opaque: true,
      );
    },
    PhotographerRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.PhotographerView(),
        opaque: true,
      );
    },
    VideographerRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.VideographerView(),
        opaque: true,
      );
    },
    SettingsRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.SettingsView(),
        opaque: true,
      );
    },
    AdminRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.AdminView(),
        opaque: true,
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          StartupRoute.name,
          path: '/startup-view',
        ),
        _i13.RouteConfig(
          BordingRoute.name,
          path: '/bording-view',
        ),
        _i13.RouteConfig(
          LoginRoute.name,
          path: '/login-view',
        ),
        _i13.RouteConfig(
          SignUpRoute.name,
          path: '/sign-up-view',
        ),
        _i13.RouteConfig(
          HomeRoute.name,
          path: '/home-view',
        ),
        _i13.RouteConfig(
          OtpRoute.name,
          path: '/otp-view',
        ),
        _i13.RouteConfig(
          AddressRoute.name,
          path: '/address-view',
        ),
        _i13.RouteConfig(
          ProfileRoute.name,
          path: '/profile-view',
        ),
        _i13.RouteConfig(
          PhotographerRoute.name,
          path: '/photographer-view',
        ),
        _i13.RouteConfig(
          VideographerRoute.name,
          path: '/videographer-view',
        ),
        _i13.RouteConfig(
          SettingsRoute.name,
          path: '/settings-view',
        ),
        _i13.RouteConfig(
          AdminRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupRoute extends _i13.PageRouteInfo<void> {
  const StartupRoute()
      : super(
          StartupRoute.name,
          path: '/startup-view',
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.BordingView]
class BordingRoute extends _i13.PageRouteInfo<void> {
  const BordingRoute()
      : super(
          BordingRoute.name,
          path: '/bording-view',
        );

  static const String name = 'BordingRoute';
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.SignUpView]
class SignUpRoute extends _i13.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/sign-up-view',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.OtpView]
class OtpRoute extends _i13.PageRouteInfo<void> {
  const OtpRoute()
      : super(
          OtpRoute.name,
          path: '/otp-view',
        );

  static const String name = 'OtpRoute';
}

/// generated route for
/// [_i7.AddressView]
class AddressRoute extends _i13.PageRouteInfo<void> {
  const AddressRoute()
      : super(
          AddressRoute.name,
          path: '/address-view',
        );

  static const String name = 'AddressRoute';
}

/// generated route for
/// [_i8.ProfileView]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-view',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.PhotographerView]
class PhotographerRoute extends _i13.PageRouteInfo<void> {
  const PhotographerRoute()
      : super(
          PhotographerRoute.name,
          path: '/photographer-view',
        );

  static const String name = 'PhotographerRoute';
}

/// generated route for
/// [_i10.VideographerView]
class VideographerRoute extends _i13.PageRouteInfo<void> {
  const VideographerRoute()
      : super(
          VideographerRoute.name,
          path: '/videographer-view',
        );

  static const String name = 'VideographerRoute';
}

/// generated route for
/// [_i11.SettingsView]
class SettingsRoute extends _i13.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings-view',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i12.AdminView]
class AdminRoute extends _i13.PageRouteInfo<void> {
  const AdminRoute()
      : super(
          AdminRoute.name,
          path: '/',
        );

  static const String name = 'AdminRoute';
}
