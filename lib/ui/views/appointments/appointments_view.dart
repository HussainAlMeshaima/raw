import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './appointments_view_model.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentsViewModel>.reactive(
      viewModelBuilder: () => AppointmentsViewModel(context),
      onModelReady: (AppointmentsViewModel model) async => await model.init(),
      builder:
          (BuildContext context, AppointmentsViewModel model, Widget? child) {
        return Scaffold(
          body: Center(
            child: Text(
              'AppointmentsView',
            ),
          ),
        );
      },
    );
  }
}
