import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './cart_view_model.dart';
import '../../../app/utils/constants.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(context),
      onModelReady: (CartViewModel model) async => await model.init(),
      builder: (BuildContext context, CartViewModel model, Widget? child) {
        return Scaffold(
            backgroundColor: Colors.white,
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {},
            //   backgroundColor: AppColors().primary,
            // ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            bottomSheet: Container(
              height: 50,
              width: double.infinity,
              child: model.isCheckout == true
                  ? Container(
                      color: AppColors().primary,
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Done',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 220,
                          child: Center(
                              child: Text(
                            '65 BD',
                            style: TextStyle(
                              color: AppColors().primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            model.pushNamed('/check-out-view');
                          },
                          child: Container(
                            color: AppColors().primary,
                            height: 50,
                            width: 150,
                            child: Center(
                                child: Text(
                              'Checkout',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            )),
                          ),
                        )
                      ],
                    ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Cart",
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
              actions: [
                IconButton(
                  onPressed: () {
                    //TODO
                  },
                  icon: Icon(
                    Icons.delete_rounded,
                    color: AppColors().primary,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF0F4F9),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                          child: Column(children: [
                            cartProductWidget('Product', 20, 1),
                            cartProductWidget('Product', 20, 1),
                            cartProductWidget('Product', 20, 1),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

Widget cartProductWidget(String productName, double price, int qty) {
  //TODO SWIPE TO DELETE ITEM
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7.0),
    child: Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            //TODO CHANGE TO NETWORK IMAGE
            child: Image.asset(AppImages.rentLogo),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                productName,
                style: TextStyle(
                  color: AppColors().primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${price}BD Per day',
                style: TextStyle(
                  color: AppColors().primary,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: FloatingActionButton(
                  backgroundColor: AppColors().primary,
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    size: 10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  qty.toString(),
                  style: TextStyle(color: AppColors().primary, fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 25,
                width: 25,
                child: FloatingActionButton(
                  backgroundColor: Color(0xffF4F4F4),
                  onPressed: () {},
                  child: Icon(
                    Icons.remove,
                    size: 10,
                    color: AppColors().primary,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
