import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './otp_view_model.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpViewModel>.reactive(
      viewModelBuilder: () => OtpViewModel(context),
      onModelReady: (OtpViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        OtpViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'OtpView',
            ),
          ),
        );
      },
    );
  }
}
