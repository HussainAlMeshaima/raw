import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './check_out_view_model.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckOutViewModel>.reactive(
      viewModelBuilder: () => CheckOutViewModel(context),
      onModelReady: (CheckOutViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        CheckOutViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'CheckOutView',
            ),
          ),
        );
      },
    );
  }
}
