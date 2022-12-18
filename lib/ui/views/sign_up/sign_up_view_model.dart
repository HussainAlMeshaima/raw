import 'package:raw/app/core/base_view_model.dart';

class SignUpViewModel extends BaseViewModel {
  SignUpViewModel(context) : super(context);

  Future<void> init() async {}

  void toggleIsNext({bool? value}) {
    if (value != null)
      _isNext = value;
    else
      _isNext = !_isNext;

    notifyListeners();
  }

  bool _isNext = false;
  bool get isNext => _isNext;
}
