import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './add_freelancer_view_model.dart';

class AddFreelancerView extends StatelessWidget {
  const AddFreelancerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddFreelancerViewModel>.reactive(
      viewModelBuilder: () => AddFreelancerViewModel(context),
      onModelReady: (AddFreelancerViewModel model) async => await model.init(),
      builder:
          (BuildContext context, AddFreelancerViewModel model, Widget? child) {
        return Scaffold(
          body: Center(
            child: Text(
              'AddFreelancerView',
            ),
          ),
        );
      },
    );
  }
}
