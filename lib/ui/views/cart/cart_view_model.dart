import 'dart:ffi';

import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/models/Package.dart';
import 'package:raw/app/services/CartService.dart';

class CartViewModel extends BaseViewModel {
  CartViewModel(context) : super(context);
  Future<void> init() async {
    _packages = cartService.getPackages();
  }

  final CartService cartService = locator<CartService>();

  void removeAllPackages() {
    cartService.removeAllPackages();
    notifyListeners();
  }

  void toggleIsCheckout({required bool value}) {
    _isCheckout = value;
    notifyListeners();
  }

  void increment(Package package) {
    cartService.increment(package);
    notifyListeners();
  }

  void decrement(Package package) {
    cartService.decrement(package);
    notifyListeners();
  }

  String totalPrice() {
    double total = 0;
    _packages.forEach((Package package) {
      total += package.price;
    });

    return total.toStringAsFixed(2);
  }

  bool _isCheckout = false;
  bool get isCheckout => _isCheckout;

  late List<Package> _packages;
  List<Package> get packages => _packages;
}
