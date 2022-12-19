import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:stacked/stacked.dart';

import './settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(context),
      onModelReady: (SettingsViewModel model) async => await model.init(),
      builder: (BuildContext context, SettingsViewModel model, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title:
                Text("Settings", style: TextStyle(color: AppColors().primary)),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset('assets/images/logo_colored.png')),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    decoration: BoxDecoration(
                        color: AppColors().primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    decoration: BoxDecoration(
                        color: AppColors().primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text(
                      'Edit Address',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
