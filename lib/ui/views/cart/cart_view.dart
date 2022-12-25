import 'package:flutter/material.dart';
import 'package:raw/app/models/Package.dart';
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
                onPressed: () => model.goBack(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors().primary,
                )),
            actions: [
              IconButton(
                onPressed: () => model.removeAllPackages(),
                icon: Icon(
                  Icons.delete_rounded,
                  color: AppColors().primary,
                ),
              ),
            ],
          ),
          bottomSheet: SizedBox(
            height: 50,
            width: double.infinity,
            child: model.isCheckout == true
                ? Container(
                    color: AppColors().primary,
                    height: 50,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 220,
                        child: Center(
                            child: Text(
                          '${model.totalPrice()} BD',
                          style: TextStyle(
                            color: AppColors().primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => model.pushNamed('/check-out-view'),
                        child: Container(
                          color: AppColors().primary,
                          height: 50,
                          width: 150,
                          child: const Center(
                              child: Text(
                            'Checkout',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                        ),
                      )
                    ],
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
                child: model.packages.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Color(0xffFCA311),
                              size: 80,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'No items added!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                        child: SingleChildScrollView(
                          child: Container(
                            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - 160),
                            child: Column(
                              children: List.generate(model.packages.length, (int index) {
                                return cartProductWidget(
                                  model,
                                  model.packages[index],
                                );
                              }),
                            ),
                          ),
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

Widget cartProductWidget(CartViewModel model, Package package) {
  return GestureDetector(
    child: Padding(
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
              child: package.image != null ? Image.asset(package.image!) : null,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  package.name ?? '-',
                  style: TextStyle(
                    color: AppColors().primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${package.price} BD Per day',
                  style: TextStyle(
                    color: AppColors().primary,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => model.increment(package),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(200),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors().primary,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    package.count.toString(),
                    style: TextStyle(color: AppColors().primary, fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
                GestureDetector(
                  onTap: () => model.decrement(package),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(200),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF4F4F4),
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 10,
                          color: AppColors().primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
