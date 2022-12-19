import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
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
            child: Column(
              children: [
                Center(child: Container(height: 100, width: 100, child: AppSvgs().svgColoredLogo)),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {
                        model.pushNamed('/profile-view');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors().primary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Edit profile',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
