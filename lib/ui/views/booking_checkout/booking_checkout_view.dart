import 'package:flutter/material.dart';
import 'package:raw/app/models/Package.dart';
import 'package:stacked/stacked.dart';

import './booking_checkout_view_model.dart';

class BookingCheckoutView extends StatelessWidget {
  const BookingCheckoutView({
    this.package,
    Key? key,
  }) : super(key: key);

  final Package? package;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookingCheckoutViewModel>.reactive(
      viewModelBuilder: () => BookingCheckoutViewModel(context),
      onModelReady: (BookingCheckoutViewModel model) async =>
          await model.init(),
      builder: (BuildContext context, BookingCheckoutViewModel model,
          Widget? child) {
        return Scaffold(
          body: Center(
            child: Text(
              'BookingCheckoutView',
            ),
          ),
        );
      },
    );
  }
}
