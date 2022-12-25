// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:raw/app/services/AuthService.dart' as _i3;
import 'package:raw/app/services/CartService.dart' as _i4;
import 'package:raw/app/services/CloudStorageService.dart' as _i5;
import 'package:raw/app/services/FireStoreService.dart' as _i6;
import 'package:raw/app/services/FreelancerService.dart' as _i7;
import 'package:raw/app/services/router_service.dart' as _i8;
import 'package:raw/app/services/UserService.dart' as _i9;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthService>(() => _i3.AuthService());
    gh.lazySingleton<_i4.CartService>(() => _i4.CartService());
    gh.lazySingleton<_i5.CloudStorageService>(() => _i5.CloudStorageService());
    gh.lazySingleton<_i6.FireStoreService>(() => _i6.FireStoreService());
    gh.lazySingleton<_i7.FreelancerService>(() => _i7.FreelancerService());
    gh.lazySingleton<_i8.RouterService>(() => _i8.RouterService());
    gh.lazySingleton<_i9.UserService>(() => _i9.UserService());
    return this;
  }
}
