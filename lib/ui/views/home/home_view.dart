import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:stacked/stacked.dart';

import './home_view_model.dart';
import '../../../app/utils/images.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    int _current = 0;
    List<Widget> adsWidgetList = [
      //Ad Widget
      Container(
        height: 160,
        width: 400,
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors().primary,
        ),
      ),
      //Photography Ad
      adClickableAdWidget(title: 'Photography', desc: 'some description here', adImage: '', action: () {}),
      //Videography Ad
      adClickableAdWidget(title: 'Videography', desc: 'some description here', adImage: '', action: () {}),
      //Studio Ad
      adClickableAdWidget(title: 'Studio', desc: 'some description here', adImage: '', action: () {}),
      //Rent Ad
      adClickableAdWidget(title: 'Rent', desc: 'some description here', adImage: '', action: () {}),
    ];

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      onModelReady: (HomeViewModel model) async => await model.init(),
      builder: (BuildContext context, HomeViewModel model, Widget? child) => Scaffold(
          body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
                              child: Center(child: Text('User image')),
                            ),
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          'WELCOME',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Image.asset(
                                        Images.helloEmoji,
                                        height: 15,
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Murtadha Alaali',
                                  style: TextStyle(
                                    color: AppColors().primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
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
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    SizedBox(
                      height: 30,
                    ),
                    CarouselSlider(
                      items: adsWidgetList,
                      options: CarouselOptions(
                          height: 160,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            model.updateIndex(value: index);
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: adsWidgetList.asMap().entries.map((entry) {
                        return GestureDetector(
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: model.current == entry.key ? AppColors().secondary : Colors.grey),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Services',
                        style: TextStyle(
                          color: AppColors().primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        serviceCard(Images.photographyLogo, 'Photography', () {
                          model.pushNamed('/photographer-view');
                        }),
                        serviceCard(Images.videographyLogo, 'Videography', () {
                          model.pushNamed('/videographer-view');
                        }),
                        serviceCard(Images.studioLogo, 'Studio', () {
                          model.pushNamed('/studio-view');
                        }),
                        serviceCard(Images.rentLogo, 'Rent', () {
                          model.pushNamed('/rent-view');
                        }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

Widget adClickableAdWidget({required String title, required String desc, required String adImage, action}) {
  return Container(
    height: 160,
    width: 400,
    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: adImage.isNotEmpty ? DecorationImage(image: AssetImage(adImage)) : null,
      color: adImage.isEmpty ? AppColors().primary : null,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            width: 200,
            child: Text(
              desc,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            )),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 40,
          width: 120,
          child: TextButton(
            onPressed: action,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            child: Text(
              'Book Now',
              style: TextStyle(
                color: AppColors().primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget serviceCard(String image, String title, action) {
  return InkWell(
    onTap: action,
    child: Container(
      height: 115,
      width: 93,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                image,
                height: 40,
                width: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          )
        ],
      ),
    ),
  );
}
