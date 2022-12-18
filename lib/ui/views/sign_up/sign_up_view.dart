import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:raw/ui/views/sign_up/widgets/signup_pt1.dart';
import 'package:raw/ui/views/sign_up/widgets/signup_pt2.dart';
import 'package:stacked/stacked.dart';

import './sign_up_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(context),
      onModelReady: (SignUpViewModel model) async => await model.init(),
      builder: (BuildContext context, SignUpViewModel model, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'SignUp',
              style: TextStyle(
                color: AppColors().primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  model.isNext == false ? model.goBack() : model.toggleIsNext(value: false);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors().primary,
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Join us to\nget a portrait!',
                  style: TextStyle(color: AppColors().primary, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          //TODO Add profile Photo
                        },
                        child: Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Choose Photo',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                model.isNext == false ? SignupPt1() : SignupPt2(),
                SizedBox(
                  height: 30,
                ),
                model.isNext == false
                    ? SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors().primary),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () => model.toggleIsNext(),
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors().primary),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            //TODO Save user data
                            model.pushNamed('/address-view');
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
