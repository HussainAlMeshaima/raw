import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:raw/ui/views/home/home_view_model.dart';
import 'package:raw/ui/views/home/widgets/home_ad_clickable_widget.dart';

class HomeSliderWidget extends StatelessWidget {
  HomeSliderWidget(
    this.model, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel model;
  final List<Widget> list = [
    Container(
      height: 160,
      width: 400,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors().primary,
      ),
    ),
    const HomeAdClickableWidget(title: 'Photography', desc: 'some description here', adImage: ''),
    const HomeAdClickableWidget(title: 'Videography', desc: 'some description here', adImage: ''),
    const HomeAdClickableWidget(title: 'Studio', desc: 'some description here', adImage: ''),
    const HomeAdClickableWidget(title: 'Rent', desc: 'some description here', adImage: ''),
  ];

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CarouselSlider(
              items: list,
              options: CarouselOptions(
                height: 160,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) => model.updateIndex(value: index),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.asMap().entries.map((entry) {
              return GestureDetector(
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: model.current == entry.key ? AppColors().secondary : Colors.grey),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
        ],
      );
}
