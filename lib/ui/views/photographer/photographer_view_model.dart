import 'package:raw/app/core/base_view_model.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/models/Freelancer.dart';
import 'package:raw/app/services/FreelancerService.dart';

class PhotographerViewModel extends BaseViewModel {
  PhotographerViewModel(context) : super(context);
  Future<void> init() async {
    await fetch();
    toggleIsLoading();
  }

  final FreelancerService _freelancerService = locator<FreelancerService>();

  Future<void> fetch() async {
    _freelancers = await _freelancerService.getFreelancers(allowedTypes: [FreelancerTypes.PHOTOGRAPHER]);
  }

  Future<void> getAllFreelancers() async {
    toggleIsLoading(value: true);
    await fetch();
    toggleIsLoading(value: false);
  }

  Future<void> getAllIndoorFreelancers() async {
    toggleIsLoading(value: true);
    await fetch();
    _freelancers = _freelancers.where((Freelancer freelancer) {
      return freelancer.workAreas?.contains(WorkArea.INDOOR) ?? false;
    }).toList();

    toggleIsLoading(value: false);
  }

  Future<void> getAllOutDoorFreelancers() async {
    toggleIsLoading(value: true);
    await fetch();
    _freelancers = _freelancers.where((Freelancer freelancer) {
      return freelancer.workAreas?.contains(WorkArea.OUTDOOR) ?? false;
    }).toList();

    toggleIsLoading(value: false);
  }

  void toggleIsLoading({bool? value}) {
    if (value != null) {
      _isLoading = value;
    } else {
      _isLoading = !_isLoading;
    }
    notifyListeners();
  }

  void changeFilterIndex(int index) {
    if (_filterIndex == index) return;

    _filterIndex = index;
    if (_filterIndex == 0) {
      getAllFreelancers();
    } else if (_filterIndex == 1) {
      getAllIndoorFreelancers();
    } else if (_filterIndex == 2) {
      getAllOutDoorFreelancers();
    }
  }

  List<Freelancer> _freelancers = [];
  List<Freelancer> get freelancers => _freelancers;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  int _filterIndex = 0;
  int get filterIndex => _filterIndex;

  final List<String> _filters = ['All', 'Indoor', 'Outdoor'];
  List<String> get filters => _filters;
}
