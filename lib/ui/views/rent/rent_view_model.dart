import 'package:raw/app/core/base_view_model.dart';

class RentViewModel extends BaseViewModel {
  RentViewModel(context) : super(context);
  Future<void> init() async {}

  List<Map<String, dynamic>> _items = [
    {
      'name': 'All',
      'selected': true,
    },
    {
      'name': 'General',
      'selected': false,
    },
    {
      'name': 'Lens',
      'selected': false,
    },
    {
      'name': 'Camera',
      'selected': false,
    },
  ];

  List<Map<String, dynamic>> get items => _items;

  changeChip(int index) {
    for (var element in _items) {
      element['selected'] = false;
    }

    _items[index]['selected'] = true;
    notifyListeners();
  }
}
