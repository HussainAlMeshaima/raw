import 'package:raw/app/core/base_view_model.dart';

class AddFreelancerViewModel extends BaseViewModel {
  AddFreelancerViewModel(context) : super(context);
  Future<void> init() async {}

  bool _photographers = false;
  bool _videographers = false;
  bool _studio = false;

  void toggleIsPhotographer({bool? value}) {
    if (value != null)
      _photographers = value;
    else
      _photographers = !_photographers;

    notifyListeners();
  }

  void toggleIsVideographer({bool? value}) {
    if (value != null)
      _videographers = value;
    else
      _videographers = !_videographers;

    notifyListeners();
  }

  void toggleIsStudio({bool? value}) {
    if (value != null)
      _studio = value;
    else
      _studio = !_studio;

    notifyListeners();
  }

  bool get studio => _studio;

  bool get videographers => _videographers;

  bool get photographers => _photographers;
}
