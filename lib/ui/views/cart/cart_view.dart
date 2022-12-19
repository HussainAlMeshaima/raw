import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './cart_view_model.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(context),
      onModelReady: (CartViewModel model) async => await model.init(),
      builder: (BuildContext context, CartViewModel model, Widget? child) {
        return Scaffold(
          body: Center(
            child: Text(
              'CartView',
            ),
          ),
        );
      },
    );
  }
}
