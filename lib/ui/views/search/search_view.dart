import 'dart:math';

import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:stacked/stacked.dart';

import './search_view_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    this.value,
    Key? key,
  }) : super(key: key);

  final String? value;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(context),
      onModelReady: (SearchViewModel model) async => await model.init(),
      builder: (BuildContext context, SearchViewModel model, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Search",
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Center(
                  child: searchFeild(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget searchFeild() {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: SizedBox(
      height: 43,
      child: Center(
        child: TextField(
          //TODO SEARCH FUNCTION
          onSubmitted: (String value) => print(value),
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
  );
}
