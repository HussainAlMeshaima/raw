import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './rent_view_model.dart';

class RentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RentViewModel>.reactive(
      viewModelBuilder: () => RentViewModel(context),
      onModelReady: (RentViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        RentViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'RentView',
            ),
          ),
        );
      },
    );
  }
}
