import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:raw/app/models/Freelancer.dart';
import 'package:raw/app/models/user.dart';
import 'package:raw/app/router/router.gr.dart';
import 'package:stacked/stacked.dart';

import './photographer_view_model.dart';
import '../../../app/utils/constants.dart';

class PhotographerView extends StatelessWidget {
  const PhotographerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhotographerViewModel>.reactive(
      viewModelBuilder: () => PhotographerViewModel(context),
      onModelReady: (PhotographerViewModel model) async => await model.init(),
      builder:
          (BuildContext context, PhotographerViewModel model, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Photographers",
              style: TextStyle(
                color: AppColors().primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
                onPressed: () => model.goBack(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors().primary,
                )),
            actions: [
              IconButton(
                onPressed: () => model.pushNamed(SearchRoute().path),
                icon: Icon(
                  Icons.search,
                  color: AppColors().primary,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: SizedBox(
                      height: 30,
                      child: Center(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          children: [
                            filterItem('All', model, 0),
                            filterItem('Indoor', model, 1),
                            filterItem('Outdoor', model, 2),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                  child: SizedBox(
                    height: 900,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        freelancerCard(
                          model,
                          Freelancer(
                            rating: 3,
                            freelancerTypes: [
                              FreelancerTypes.STUDIO,
                              FreelancerTypes.VIDEOGRAPHER
                            ],
                            user: User(
                                name: 'Hussain Ali',
                                image:
                                    'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget freelancerCard(PhotographerViewModel model, Freelancer freelancer) {
  return InkWell(
    onTap: () {
      //TODO FREELANCER INFO
      model.pushNamed('/booking-view');
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xffD9D9D9).withOpacity(0.5),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: freelancer.user?.image == null
                    ? null
                    : Image.network(freelancer.user!.image!),
              ),
              const SizedBox(width: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    freelancer.user?.name ?? '-',
                    style: TextStyle(
                        color: AppColors().primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Container(
                      height: 2,
                      width: 170,
                      color: const Color(0xffCACACA),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: (freelancer.freelancerTypes?.length != null) &&
                            (freelancer.freelancerTypes!.length > 1)
                        ? Row(
                            children: [
                              Text(
                                freelancer.freelancerTypes?[0].name
                                        .toString() ??
                                    '-',
                                style: const TextStyle(
                                  color: Color(0xff717171),
                                ),
                              ),
                              const SizedBox(width: 3),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                  height: 15,
                                  width: 1,
                                  color: const Color(0xffCACACA),
                                ),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                freelancer.freelancerTypes?[1].name
                                        .toString() ??
                                    '-',
                                style:
                                    const TextStyle(color: Color(0xff717171)),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Text(
                                freelancer.freelancerTypes?[0].name
                                        .toString() ??
                                    '-',
                                style:
                                    const TextStyle(color: Color(0xff717171)),
                              ),
                            ],
                          ),
                  ),
                  RatingBarIndicator(
                    rating: freelancer.rating ?? 0.0,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                    ),
                    itemCount: 5,
                    itemSize: 16.0,
                    direction: Axis.horizontal,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget filterItem(String title, PhotographerViewModel model, int index) {
  int _index = 0;
  bool isSelected = model.isSelected;
  return InkWell(
    onTap: () {
      _index = index;
      model.toggleIsSelected();
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 10,
        width: 80,
        decoration: BoxDecoration(
            color: isSelected == true && _index == index
                ? AppColors().primary
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors().primary)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected == true && _index == index
                  ? Colors.white
                  : AppColors().primary,
              fontSize: 12,
            ),
          ),
        ),
      ),
    ),
  );
}
