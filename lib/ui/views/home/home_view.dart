import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (HomeViewModel model) async => await model.init(),
      builder: (BuildContext context, HomeViewModel model, Widget? child) => Scaffold(
          body: Center(
            child: Text(
              'HomeView',
            ),
          ),
        ),
    );
  }
}
