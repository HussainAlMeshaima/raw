import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';

class HomeTopRatedWidget extends StatelessWidget {
  const HomeTopRatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        children: [
          const SizedBox(height: 70),
          Row(
            children: [
              Text(
                'Top Rated',
                style: TextStyle(
                  color: AppColors().primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width - 20,
            height: 100,
            child: Row(children: [],),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffECECEC)
            ),
          ),
        ],
      ),
    );
  }
}
