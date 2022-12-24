import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raw/ui/views/sign_up/sign_up_view_model.dart';

import '../../../../app/utils/constants.dart';

class SignupPt2 extends StatefulWidget {
  const SignupPt2(this.model, {Key? key}) : super(key: key);

  final SignUpViewModel model;

  @override
  State<SignupPt2> createState() => _SignupPt2();
}

class _SignupPt2 extends State<SignupPt2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 43,
            child: Center(
              child: TextField(
                cursorColor: AppColors().primary,
                textAlignVertical: TextAlignVertical.center,
                controller: widget.model.passwordTextEditingController,
                obscureText: true,
                decoration: InputDecoration(
                  focusColor: AppColors().primary,
                  filled: true,
                  fillColor: const Color(0xffF6F6F6),
                  hintText: "Password",
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
                controller: widget.model.confirmPasswordTextEditingController,
                cursorColor: AppColors().primary,
                textAlignVertical: TextAlignVertical.center,
                obscureText: true,
                decoration: InputDecoration(
                  focusColor: AppColors().primary,
                  filled: true,
                  fillColor: const Color(0xffF6F6F6),
                  hintText: "Confirm Password",
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
