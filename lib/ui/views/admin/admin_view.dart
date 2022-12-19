import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './admin_view_model.dart';

class AdminView extends StatelessWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminViewModel>.reactive(
      viewModelBuilder: () => AdminViewModel(context),
      onModelReady: (AdminViewModel model) async {
        await model.init();
      },
      builder: (BuildContext context, AdminViewModel model, Widget? child) {
        return Scaffold(
          body: Center(
            child: Text(
              'AdminView',
            ),
          ),
        );
      },
    );
  }
}
