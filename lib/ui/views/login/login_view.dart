import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './login_view_model.dart';
import '../../../app/utils/constants.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(context),
      onModelReady: (LoginViewModel model) async => await model.init(),
      builder: (BuildContext context, LoginViewModel model, Widget? child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset(AppImages.coloredLogo)),
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
                      const SizedBox(height: 30),
                      TextField(
                        showCursor: true,
                        controller: model.emailTextEditingController,
                        cursorColor: AppColors().primary,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: AppColors().primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        showCursor: true,
                        controller: model.passwordTextEditingController,
                        cursorColor: AppColors().primary,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: AppColors().primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextButton(
                              onPressed: () => model.doLogin(),
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
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      const SizedBox(height: 35),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(right: 8.0),
                      //       child: Container(
                      //         height: 1,
                      //         width: 100,
                      //         color: Colors.grey,
                      //       ),
                      //     ),
                      //     const Text('Or login with'),
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 8.0),
                      //       child: Container(
                      //         height: 1,
                      //         width: 100,
                      //         color: Colors.grey,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 30),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const Text('Google logo here'),
                      //     const SizedBox(width: 15),
                      //     Text(
                      //       'Google',
                      //       style: TextStyle(color: AppColors().textColor),
                      //     )
                      //   ],
                      // ),
                      // const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('You Don’t have an account ?'),
                          TextButton(
                            onPressed: () => model.pushNamed('/sign-up-view'),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: AppColors().primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
