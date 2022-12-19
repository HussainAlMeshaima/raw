import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:raw/ui/views/home/widgets/home_ad_clickable_widget.dart';
import 'package:raw/ui/views/home/widgets/home_header.dart';
import 'package:raw/ui/views/home/widgets/home_search_text_field.dart';
import 'package:raw/ui/views/home/widgets/home_services.dart';
import 'package:raw/ui/views/home/widgets/home_slider_widget.dart';
import 'package:stacked/stacked.dart';

import './home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      onModelReady: (HomeViewModel model) async => await model.init(),
      builder: (BuildContext context, HomeViewModel model, Widget? child) =>
          Scaffold(
              body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const HomeHeaderWidget(),
              HomeSearchTextFieldWidget(controller: model.searchController),
              HomeSliderWidget(model),
              HomeServicesWidget(model)
            ],
          ),
        ),
      )),
    );
  }
}
