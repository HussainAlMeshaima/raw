import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './address_view_model.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressViewModel>.reactive(
      viewModelBuilder: () => AddressViewModel(context),
      onModelReady: (AddressViewModel model) async => await model.init(),
      builder: (BuildContext context, AddressViewModel model, Widget? child) =>
          Scaffold(
        body: Center(
          child: Text(
            'AddressView',
          ),
        ),
      ),
    );
  }
}
