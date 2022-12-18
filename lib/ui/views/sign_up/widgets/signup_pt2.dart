import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/utils/constants.dart';

class SignupPt2 extends StatefulWidget {
  const SignupPt2({Key? key}) : super(key: key);

  @override
  State<SignupPt2> createState() => _SignupPt2();
}

class _SignupPt2 extends State<SignupPt2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            height: 43,
            child: Center(
              child: TextField(
                cursorColor: AppColors().primary,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    focusColor: AppColors().primary,
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    hintText: "Password",
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
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            height: 43,
            child: Center(
              child: TextField(
                cursorColor: AppColors().primary,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    focusColor: AppColors().primary,
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    hintText: "Confirm Password",
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
        ),
      ],
    );
  }
}
