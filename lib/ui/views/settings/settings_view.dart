import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './settings_view_model.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(context),
      onModelReady: (SettingsViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        SettingsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'SettingsView',
            ),
          ),
        );
      },
    );
  }
}
