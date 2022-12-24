import 'package:flutter/material.dart';
import 'package:raw/ui/views/sign_up/sign_up_view_model.dart';

import '../../../../app/utils/constants.dart';

class SignupPt1 extends StatefulWidget {
  const SignupPt1(this.model, {Key? key}) : super(key: key);

  final SignUpViewModel model;

  @override
  State<SignupPt1> createState() => _SignupPt1();
}

class _SignupPt1 extends State<SignupPt1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Text(
          'Create Account',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 43,
            child: Center(
              child: TextField(
                controller: widget.model.nameTextEditingController,
                cursorColor: AppColors().primary,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    focusColor: AppColors().primary,
                    filled: true,
                    fillColor: const Color(0xffF6F6F6),
                    hintText: "Name",
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
                    )),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 43,
            child: Center(
              child: TextField(
                controller: widget.model.phoneNumberTextEditingController,
                cursorColor: AppColors().primary,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  focusColor: AppColors().primary,
                  filled: true,
                  fillColor: const Color(0xffF6F6F6),
                  hintText: "Phone Number",
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
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 43,
            child: Center(
              child: TextField(
                controller: widget.model.emailTextEditingController,
                cursorColor: AppColors().primary,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  focusColor: AppColors().primary,
                  filled: true,
                  fillColor: const Color(0xffF6F6F6),
                  hintText: "Email",
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
      ],
    );
  }
}
