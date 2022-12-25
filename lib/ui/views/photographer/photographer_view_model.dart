import 'package:raw/app/core/base_view_model.dart';

class PhotographerViewModel extends BaseViewModel {
  PhotographerViewModel(context) : super(context);
  Future<void> init() async {}

  void toggleIsSelected({bool? value}) {
    if (value != null)
      _isSelected = value;
    else
      _isSelected = !_isSelected;

    notifyListeners();
  }

  bool _isSelected = false;
  bool get isSelected => _isSelected;

  // List<Fre>
}
