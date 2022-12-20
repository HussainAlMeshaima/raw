import 'package:raw/app/core/base_view_model.dart';

class CartViewModel extends BaseViewModel {
  CartViewModel(context) : super(context);
  Future<void> init() async {}

  void toggleIsCheckout({required bool value}) {
    _isCheckout = value;
    notifyListeners();
  }

  bool _isCheckout = false;
  bool get isCheckout => _isCheckout;
}
