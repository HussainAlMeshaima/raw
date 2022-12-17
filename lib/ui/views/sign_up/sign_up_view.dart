import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './sign_up_view_model.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(context),
      onModelReady: (SignUpViewModel model) async => await model.init(),
      builder: (BuildContext context, SignUpViewModel model, Widget? child) {
        return Scaffold(
          body: Center(
            child: Text(
              'SignUpView',
            ),
          ),
        );
      },
    );
  }
}
