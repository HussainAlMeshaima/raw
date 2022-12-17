import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './videographer_view_model.dart';

class VideographerView extends StatelessWidget {
  const VideographerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VideographerViewModel>.reactive(
      viewModelBuilder: () => VideographerViewModel(context),
      onModelReady: (VideographerViewModel model) async => await model.init(),
      builder:
          (BuildContext context, VideographerViewModel model, Widget? child) {
        return Scaffold(
          body: Center(
            child: Text(
              'VideographerView',
            ),
          ),
        );
      },
    );
  }
}
