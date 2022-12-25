import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/models/Freelancer.dart';
import 'package:raw/app/services/FreelancerService.dart';

class PhotographerViewModel extends BaseViewModel {
  PhotographerViewModel(context) : super(context);
  Future<void> init() async {
    _freelancers = await _freelancerService.getFreelancers(allowedTypes: [FreelancerTypes.PHOTOGRAPHER]);

    List<Freelancer>? temp = [];
    temp = _freelancers
        .where((Freelancer freelancer) =>
            freelancer.freelancerTypes
                ?.contains(FreelancerTypes.PHOTOGRAPHER) ??
            false)
        .toList();

    _freelancers = temp;

    toggleIsLoading();
  }

  final FreelancerService _freelancerService = locator<FreelancerService>();

  void toggleIsSelected({bool? value}) {
    if (value != null) {
      _isSelected = value;
    } else {
      _isSelected = !_isSelected;
    }

    notifyListeners();
  }

  void toggleIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void changeFilterIndex(int index) {
    _filterIndex = index;
    notifyListeners();
  }

  bool _isSelected = false;
  bool get isSelected => _isSelected;

  List<Freelancer> _freelancers = [];
  List<Freelancer> get freelancers => _freelancers;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  int _filterIndex = 0;
  int get filterIndex => _filterIndex;

  final List<String> _filters = ['All', 'Indoor', 'Outdoor'];
  List<String> get filters => _filters;
}
