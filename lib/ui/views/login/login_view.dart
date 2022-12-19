import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './login_view_model.dart';
import '../../../app/utils/constants.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(context),
      onModelReady: (LoginViewModel model) async => await model.init(),
      builder: (BuildContext context, LoginViewModel model, Widget? child) {
        return Scaffold(
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(AppImages.coloredLogo),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55.0),
                      child: Center(
                        child: Text(
                          'Login to start achieving!',
                          style: TextStyle(
                            color: AppColors().primary,
                            fontSize: AppTextSize().medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      showCursor: true,
                      controller: textEditingController,
                      cursorColor: AppColors().primary,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors().primary),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      showCursor: true,
                      controller: textEditingController,
                      cursorColor: AppColors().primary,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors().primary),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              model.pushNamed('/home-view');
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors().primary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            height: 1,
                            width: 100,
                            color: Colors.grey,
                          ),
                        ),
                        Text('Or login with'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 1,
                            width: 100,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Google logo here'),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Google',
                          style: TextStyle(color: AppColors().textColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('You Don’t have an account ?'),
                        TextButton(
                            onPressed: () {
                              model.pushNamed('/sign-up-view');
                            },
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                color: AppColors().primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
