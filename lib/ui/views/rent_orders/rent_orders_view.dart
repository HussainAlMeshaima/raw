import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './rent_orders_view_model.dart';

class RentOrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RentOrdersViewModel>.reactive(
      viewModelBuilder: () => RentOrdersViewModel(context),
      onModelReady: (RentOrdersViewModel model) async => await model.init(),
      builder:
          (BuildContext context, RentOrdersViewModel model, Widget? child) {
        return Scaffold(
          body: Center(
            child: Text(
              'RentOrdersView',
            ),
          ),
        );
      },
    );
  }
}
