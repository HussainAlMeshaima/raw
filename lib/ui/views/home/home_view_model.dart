import 'package:raw/app/core/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(context) : super(context);
  Future<void> init() async {}

  void updateIndex({required int value}) {
    _current = value;

    notifyListeners();
  }

  int _current = 0;
  int get current => _current;
}
