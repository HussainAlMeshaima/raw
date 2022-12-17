import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './photographer_view_model.dart';

class PhotographerView extends StatelessWidget {
  const PhotographerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhotographerViewModel>.reactive(
      viewModelBuilder: () => PhotographerViewModel(context),
      onModelReady: (PhotographerViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        PhotographerViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'PhotographerView',
            ),
          ),
        );
      },
    );
  }
}
