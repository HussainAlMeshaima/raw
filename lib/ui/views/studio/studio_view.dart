import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './studio_view_model.dart';

class StudioView extends StatelessWidget {
  const StudioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudioViewModel>.reactive(
      viewModelBuilder: () => StudioViewModel(context),
      onModelReady: (StudioViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        StudioViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'StudioView',
            ),
          ),
        );
      },
    );
  }
}
