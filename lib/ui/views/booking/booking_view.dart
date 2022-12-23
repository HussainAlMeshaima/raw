import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

import './booking_view_model.dart';
import '../../../app/utils/constants.dart';

class BookingView extends StatelessWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookingViewModel>.reactive(
      viewModelBuilder: () => BookingViewModel(context),
      onModelReady: (BookingViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        BookingViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Freelancer_name",
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
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    freelancerCard("Murtadah Ala'ali", AppImages.videographyLogo, ["Fucking", "Sucking"], 4.5),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          freelancerInfoCard(AppImages.experienceLogo, 'Experience', '3 Years'),
                          freelancerInfoCard(AppImages.customersLogo, 'Customers', '10'),
                          freelancerInfoCard(AppImages.ratingLogo, 'Rating', '4.6'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    freelancerPackagesCard([
                      {"title": 'Package 1', "desc": "1 Hour | 5 Edited Photos", "price": "70 BD"}
                    ]),
                    SizedBox(
                      height: 17,
                    ),
                    aboutFreelancerCard('Blah blah blah blah blah blagh blah blah blag h blah blah blag h blah blah blag h blah blah blagh blag h blah blah blag h blag h blah blah blag h blag h blah blah blag '),
                    SizedBox(
                      height: 15,
                    ),
                    freelancerPortfolioCard([
                      "https://upload.wikimedia.org/wikipedia/commons/e/ea/Model_in_Field_during_Sunset.jpg",
                      "https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2012/08/model-fashion-photography-1.jpg?resize=600%2C398&ssl=1",
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzLzWwT_jwKO0dl3eWzKP06xRJod56746PaRynknwU9PYGFPVE08HruwObDu3ePy0G6YU&usqp=CAU",
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 15),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              //TODO
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppColors().primary),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            child: Text(
                              'Book Appointment',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

Widget freelancerCard(String name, String image, List<String> skills, double rating) {
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
                  style: TextStyle(color: AppColors().primary, fontSize: 20, fontWeight: FontWeight.bold),
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
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
Widget filterItem(String title, BookingViewModel model, int index) {
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
        decoration: BoxDecoration(color: isSelected == true && _index == index ? AppColors().primary : Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors().primary)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected == true && _index == index ? Colors.white : AppColors().primary,
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
    height: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(image),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
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
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors().primary),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget freelancerPackagesCard(List<Map<String, String>> packages) {
  return Container(
    height: 140,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: packages.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, String> package = packages[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 170,
              width: 140,
              decoration: BoxDecoration(border: Border.all(color: Color(0xffC9C9C9), width: 1.5), borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(package['title']!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(package['desc']!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(package['price']!),
                  )
                ],
              ),
            ),
          );
        }),
  );
}

Widget aboutFreelancerCard(String desc) {
  return Container(
    height: 100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About me',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors().primary,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(width: 400, child: Text(desc)),
      ],
    ),
  );
}

Widget freelancerPortfolioCard(List<String> portfolioImages) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Portfolio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors().primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: portfolioImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(portfolioImages[index]), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  );
                }),
          ),
        )
      ],
    ),
  );
}
