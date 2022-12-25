import 'package:raw/app/core/base_view_model.dart';

class BookingCheckoutViewModel extends BaseViewModel {
  BookingCheckoutViewModel(context) : super(context);
  Future<void> init() async {}

  DateTime? _selectedDate;

  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  DateTime? get selectedDate => _selectedDate;
}
