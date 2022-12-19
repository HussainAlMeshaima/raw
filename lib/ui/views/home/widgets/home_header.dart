import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey[300], shape: BoxShape.circle),
                  child: const Center(
                      child: Text(
                    'User image',
                    style: TextStyle(fontSize: 10),
                  )),
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
                          SizedBox(width: 6),
                          Image.asset(
                            AppImages.helloEmoji,
                            height: 15,
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Murtadha Alaali',
                      style: TextStyle(
                        color: AppColors().primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 60),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors().primary,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: AppColors().primary,
                ),
              )
            ],
          ),
        ],
      );
}
