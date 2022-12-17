import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(context),
      onModelReady: (LoginViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'LoginView',
            ),
          ),
        );
      },
    );
  }
}
