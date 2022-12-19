import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './booking_view_model.dart';

class BookingView extends StatelessWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookingViewModel>.reactive(
      viewModelBuilder: () => BookingViewModel(context),
      onModelReady: (BookingViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        BookingViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'BookingView',
            ),
          ),
        );
      },
    );
  }
}
