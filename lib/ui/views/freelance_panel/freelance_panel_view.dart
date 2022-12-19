import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './freelance_panel_view_model.dart';

class FreelancePanelView extends StatelessWidget {
  const FreelancePanelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FreelancePanelViewModel>.reactive(
      viewModelBuilder: () => FreelancePanelViewModel(context),
      onModelReady: (FreelancePanelViewModel model) async => await model.init(),
      builder:
          (BuildContext context, FreelancePanelViewModel model, Widget? child) {
        return Scaffold(
          body: Center(
            child: Text(
              'FreelancePanelView',
            ),
          ),
        );
      },
    );
  }
}
