import 'package:raw/app/core/base_view_model.dart';

class AddressViewModel extends BaseViewModel {
  AddressViewModel(context) : super(context);

  Future<void> init() async {}

  void toggleIsFlat({bool? value}) {
    if (value != null)
      _isFlat = value;
    else
      _isFlat = !_isFlat;

    notifyListeners();
  }

  bool _isFlat = false;
  bool get isFlat => _isFlat;
}
