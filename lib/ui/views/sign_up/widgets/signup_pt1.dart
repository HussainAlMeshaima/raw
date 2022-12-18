import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/utils/constants.dart';

class SignupPt1 extends StatefulWidget {
  const SignupPt1({Key? key}) : super(key: key);

  @override
  State<SignupPt1> createState() => _SignupPt1();
}

class _SignupPt1 extends State<SignupPt1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
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
                    hintText: "Name",
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
                  hintText: "Phone Number",
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
                  ),
                ),
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
                  hintText: "Email",
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
