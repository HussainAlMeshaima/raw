import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './rent_orders_view_model.dart';
import '../../../app/utils/constants.dart';

class RentOrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RentOrdersViewModel>.reactive(
      viewModelBuilder: () => RentOrdersViewModel(context),
      onModelReady: (RentOrdersViewModel model) async => await model.init(),
      builder: (BuildContext context, RentOrdersViewModel model, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Rent orders",
              style: TextStyle(
                color: AppColors().primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  model.goBack();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors().primary,
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                searchRentOrderTextFeild(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF0F4F9),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                    ),
                    child: ListView(
                      children: [
                        rentOrderRequest(),
                        rentOrderAccepted(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget rentOrderRequest() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
    child: Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    'product image',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors().primary,
                  ),
                ),
                Text(
                  'period',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors().primary,
                  ),
                ),
                Text(
                  'Phone number',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors().primary,
                  ),
                ),
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors().primary,
                  ),
                ),
                Text(
                  'Product',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors().primary,
                  ),
                ),
                Text(
                  'Reference ID',
                  style: TextStyle(
                    fontSize: 8,
                    color: AppColors().primary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.check_circle, color: Colors.green[700]),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.cancel, color: Colors.red[400]),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget rentOrderAccepted() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
    child: Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xff62BA75),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
                    child: const Center(
                        child: Text(
                      'product image',
                      style: TextStyle(fontSize: 10),
                    )),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Approved',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'period',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Phone number',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Product',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Reference ID',
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.whatsapp_rounded,
                    color: Colors.white,
                    size: 40,
                  )),
            )
          ],
        ),
      ),
    ),
  );
}

Widget searchRentOrderTextFeild() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SizedBox(
          height: 43,
          child: Center(
            child: TextField(
              cursorColor: AppColors().primary,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Transform.rotate(
                  angle: 90 * pi / 180,
                  child: Icon(
                    Icons.search,
                    color: AppColors().primary,
                  ),
                ),
                prefixIconColor: AppColors().primary,
                focusColor: AppColors().primary,
                filled: true,
                fillColor: const Color(0xffF6F6F6),
                hintText: "Search",
                hintStyle: const TextStyle(color: Color(0xff908E8E)),
                contentPadding: const EdgeInsets.only(
                  bottom: 43 / 2,
                  left: 7, // HERE THE IMPORTANT PART
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
    ],
  );
}
