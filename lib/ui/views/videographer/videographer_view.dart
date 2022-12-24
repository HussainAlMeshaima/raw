import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:raw/app/router/router.dart';
import 'package:stacked/stacked.dart';

import './videographer_view_model.dart';
import '../../../app/utils/constants.dart';

class VideographerView extends StatelessWidget {
  const VideographerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VideographerViewModel>.reactive(
      viewModelBuilder: () => VideographerViewModel(context),
      onModelReady: (VideographerViewModel model) async => await model.init(),
      builder:
          (BuildContext context, VideographerViewModel model, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Videographers",
              style: TextStyle(
                color: AppColors().primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  model.goBack();
                },
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
                    child: Container(
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
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                      height: 900,
                      width: 350,
                      child: ListView(
                        children: [
                          freelancerCard(
                              "Murtadah Ala'ali",
                              AppImages.photographyLogo,
                              ["Fucking", "Sucking"],
                              4.5,
                              model)
                        ],
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget freelancerCard(String name, String image, List<String> skills,
    double rating, VideographerViewModel model) {
  return InkWell(
    onTap: () {},
    child: Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9).withOpacity(0.5),
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
              //TODO CHANGE TO NETWORK IMAGE
              child: Image.asset(image),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
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
                    color: Color(0xffCACACA),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: skills.length > 1
                      ? Row(
                          children: [
                            Text(
                              skills[0],
                              style: TextStyle(color: Color(0xff717171)),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 15,
                                width: 1,
                                color: Color(0xffCACACA),
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              skills[1],
                              style: TextStyle(color: Color(0xff717171)),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Text(
                              skills[0],
                              style: TextStyle(color: Color(0xff717171)),
                            ),
                          ],
                        ),
                ),
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => Icon(
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
  );
}

//TODO FIX SELECTION LOGIC
Widget filterItem(String title, VideographerViewModel model, int index) {
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

Widget freelancerInfoCard(String image, type, data) {
  return Container(
    height: 200,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(image),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                type,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                data,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors().primary),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
