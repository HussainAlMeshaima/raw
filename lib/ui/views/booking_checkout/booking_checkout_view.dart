import 'package:flutter/material.dart';
import 'package:raw/app/models/Package.dart';
import 'package:stacked/stacked.dart';

import './booking_checkout_view_model.dart';
import '../../../app/utils/constants.dart';

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
      onModelReady: (BookingCheckoutViewModel model) async => await model.init(),
      builder: (BuildContext context, BookingCheckoutViewModel model, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Booking Checkout',
              style: TextStyle(
                color: AppColors().primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              onPressed: () => model.goBack(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors().primary,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF0F4F9),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Center(
                        child: Text(
                          'Please confirm your booking!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text('Select date'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () async {
                            model.selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(
                                DateTime.now().year,
                                DateTime.now().month + 6,
                                DateTime.now().day,
                              ),
                            );
                            model.notifyListeners();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 0.7),
                            ),
                            child: Text(model.selectedDate == null ? 'Select a date' : '${DateTime.parse(model.selectedDate.toString())}'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 0.7),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Text(
                                'Booking Description',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(package?.name ?? ''),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(package?.description ?? ''),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.7),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Text(
                                'Order summery',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Text('Subtotal'),
                                const Spacer(),
                                Text('${package?.price} BHD' ?? ''),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                Text('Service'),
                                Spacer(),
                                Text('0.5 BHD'),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Text('${package?.price ?? 0 + 0.5} BHD' ?? ''),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
