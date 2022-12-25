import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:raw/ui/views/home/home_view_model.dart';
import 'package:raw/ui/views/home/widgets/home_service.dart';

class HomeServicesWidget extends StatelessWidget {
  const HomeServicesWidget(this.model, {Key? key}) : super(key: key);

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                Text(
                  'Services',
                  style: TextStyle(
                    color: AppColors().primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeServiceWidget(AppImages.photographyLogo, 'Photography',
                  () => model.pushNamed('/photographer-view')),
              HomeServiceWidget(AppImages.videographyLogo, 'Videography', () {
                model.pushNamed('/videographer-view');
              }),
              HomeServiceWidget(AppImages.studioLogo, 'Studio',
                  () => model.pushNamed('/studio-view')),
              HomeServiceWidget(AppImages.rentLogo, 'Rent', () => model.pushNamed('/rent-view')),
            ],
          ),
        ],
      );
}
