import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:raw/app/models/Freelancer.dart';
import 'package:raw/app/models/Package.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import './booking_view_model.dart';
import '../../../app/utils/constants.dart';

class BookingView extends StatelessWidget {
  const BookingView(
    this.freelancer, {
    Key? key,
  }) : super(key: key);

  final Freelancer freelancer;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookingViewModel>.reactive(
      viewModelBuilder: () => BookingViewModel(context, freelancer),
      onModelReady: (BookingViewModel model) async => await model.init(),
      builder: (BuildContext context, BookingViewModel model, Widget? child) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBarWidget(model),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    freelancerCard(model: model),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          freelancerInfoCard(
                              AppImages.experienceLogo,
                              'Experience',
                              '${model.freelancer.yearsExperience} Years'),
                          freelancerInfoCard(
                              AppImages.customersLogo,
                              'Customers',
                              model.freelancer.numberOfCustomers.toString()),
                          freelancerInfoCard(AppImages.ratingLogo, 'Rating',
                              model.freelancer.rating.toString()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          freelancerPackagesCard(model.freelancer.packages)
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                    aboutFreelancerCard(model),
                    const SizedBox(height: 15),
                    freelancerPortfolioCard(model),
                    BookAppointmentWidget(model)
                  ],
                ),
              ),
            ));
      },
    );
  }
}

Widget BookAppointmentWidget(BookingViewModel model) {
  return Padding(
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
          child: const Text(
            'Book Appointment',
            style: TextStyle(color: Colors.white),
          )),
    ),
  );
}

AppBar AppBarWidget(BookingViewModel model) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    title: Text(
      model.freelancer.user?.name ?? '-',
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
  );
}

Widget freelancerCard({required BookingViewModel model}) {
  return Container(
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
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: model.freelancer.user?.image != null
                ? Image.network(
                    model.freelancer.user!.image!,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    AppImages.videographyLogo,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.freelancer.user?.name ?? '-',
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
                child: model.freelancer.freelancerTypes!.length > 1
                    ? Row(
                        children: [
                          Text(
                            model.freelancer.freelancerTypes?[0].name
                                    .toLowerCase() ??
                                '-',
                            style: const TextStyle(color: Color(0xff717171)),
                          ),
                          const SizedBox(width: 3),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 15,
                              width: 1,
                              color: const Color(0xffCACACA),
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            model.freelancer.freelancerTypes?[1].name
                                    .toLowerCase() ??
                                '-',
                            style: const TextStyle(color: Color(0xff717171)),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Text(
                            model.freelancer.freelancerTypes?[0].name
                                    .toLowerCase() ??
                                '-',
                            style: const TextStyle(color: Color(0xff717171)),
                          ),
                        ],
                      ),
              ),
              RatingBarIndicator(
                rating: model.freelancer.rating ?? 0.0,
                itemBuilder: (BuildContext context, int index) => const Icon(
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
  );
}

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
                style: const TextStyle(
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

Widget freelancerPackagesCard(List<Package>? packages) {
  if (packages == null) return Container();
  return SizedBox(
    height: 140,
    child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: packages.length,
        itemBuilder: (BuildContext context, int index) {
          Package package = packages[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 170,
              width: 140,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffC9C9C9), width: 1.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(package.name ?? '-'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(package.description ?? '-'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(package.price.toString()),
                  )
                ],
              ),
            ),
          );
        }),
  );
}

Widget aboutFreelancerCard(BookingViewModel model) {
  return Column(
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
        width: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Text(
            model.freelancer.description ?? '-',
          ),
        ),
      ),
    ],
  );
}

Widget freelancerPortfolioCard(BookingViewModel model) {
  List<dynamic> images = List<dynamic>.generate(
      model.freelancer.portfolios?.length ?? 0, (int index) {
    if (model.freelancer.portfolios?[index] == '') {
      return null;
    }
    return model.freelancer.portfolios?[index];
  });

  print(images.length);

  return Column(
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
        child: SizedBox(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                dynamic image = images[index];
                if (image == null || image == '') return Container();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: images[index] == null
                          ? null
                          : DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                            ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                );
              }),
        ),
      )
    ],
  );
}
