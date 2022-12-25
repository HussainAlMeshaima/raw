import 'package:flutter/material.dart';
import 'package:raw/app/router/router.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:raw/ui/views/home/home_view_model.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget(this.model, {Key? key}) : super(key: key);

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              model.isLoading
                  ? Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors().primary,
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: model.user?.image != null
                              ? GestureDetector(
                                  onTap: () => model
                                      .pushNamed(const ProfileRoute().path),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(model.user!.image!),
                                          fit: BoxFit.fill),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.5),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 3.0),
                                      child: Text(
                                        'WELCOME',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Image.asset(
                                      AppImages.helloEmoji,
                                      height: 15,
                                      width: 15,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                model.user?.name ?? '-',
                                style: TextStyle(
                                  color: AppColors().primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => model.pushNamed('/cart-view'),
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors().primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () => model.pushNamed('/settings-view'),
                    icon: Icon(
                      Icons.settings,
                      color: AppColors().primary,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      );
}
