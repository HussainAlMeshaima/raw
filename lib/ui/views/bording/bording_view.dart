import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './bording_view_model.dart';

class BordingView extends StatelessWidget {
  const BordingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BordingViewModel>.reactive(
      viewModelBuilder: () => BordingViewModel(context),
      onModelReady: (BordingViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        BordingViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'BordingView',
            ),
          ),
        );
      },
    );
  }
}
