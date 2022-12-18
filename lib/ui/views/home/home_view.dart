import 'dart:math';

import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:stacked/stacked.dart';

import './home_view_model.dart';
import '../../../app/utils/images.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      onModelReady: (HomeViewModel model) async => await model.init(),
      builder: (BuildContext context, HomeViewModel model, Widget? child) => Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
                          child: Center(child: Text('User image')),
                        ),
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Text('WELCOME'),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Image.asset(
                                    Images.helloEmoji,
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Murtadha Alaali',
                              style: TextStyle(
                                color: AppColors().primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors().primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: AppColors().primary,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
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
                        fillColor: Color(0xffF6F6F6),
                        hintText: "Search",
                        hintStyle: TextStyle(color: Color(0xff908E8E)),
                        contentPadding: EdgeInsets.only(
                          bottom: 43 / 2,
                          left: 7, // HERE THE IMPORTANT PART
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
