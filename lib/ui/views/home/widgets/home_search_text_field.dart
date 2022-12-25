import 'dart:math';

import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:raw/ui/views/home/home_view_model.dart';

class HomeSearchTextFieldWidget extends StatelessWidget {
  const HomeSearchTextFieldWidget(
    this.model, {
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeViewModel model;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              height: 43,
              child: Center(
                child: TextField(
                  onSubmitted: (String? value) => model.searchOnSubmitted(value),
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
