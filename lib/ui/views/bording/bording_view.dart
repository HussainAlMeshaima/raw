import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:stacked/stacked.dart';

import './bording_view_model.dart';

class BordingView extends StatelessWidget {
  const BordingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BordingViewModel>.reactive(
      viewModelBuilder: () => BordingViewModel(context),
      onModelReady: (BordingViewModel model) async => await model.init(),
      builder: (BuildContext context, BordingViewModel model, Widget? child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: 500,
                  decoration: const BoxDecoration(color: Color(0xff14213D)),
                  child: Center(
                    child: Image.asset(AppImages.whiteLogo),
                    // SvgPicture.asset(
                    //   Images.whiteLogoSvg,
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Text(
                            'Lets Explore RAW!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors().primary,
                              fontSize: AppTextSize().large,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Explore your gateway to satisfy all your multimedia needs, book professionals, rent equipments and more.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors().primary,
                              fontSize: AppTextSize().small,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: InkWell(
                            onTap: () {
                              model.pushNamed('/login-view');
                            },
                            child: Container(
                              height: 40,
                              width: 170,
                              decoration: BoxDecoration(
                                color: AppColors().primary,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Text(
                                    "Let's Start",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppTextSize().medium),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
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
