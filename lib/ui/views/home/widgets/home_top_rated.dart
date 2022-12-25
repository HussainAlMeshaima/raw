import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:raw/app/models/Freelancer.dart';
import 'package:raw/app/router/router.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:raw/ui/views/home/home_view_model.dart';

class HomeTopRatedWidget extends StatelessWidget {
  const HomeTopRatedWidget(
    this.model, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Top Rated',
                  style: TextStyle(
                    color: AppColors().primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          model.isLoading
              ? Container(
                  padding: const EdgeInsets.all(20),
                  child: CircularProgressIndicator(
                    color: AppColors().primary,
                  ),
                )
              : model.freelancers.isEmpty
                  ? Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text('No freelancers.'),
                    )
                  : Column(
                      children:
                          List.generate(model.freelancers.length, (int index) {
                        Freelancer freelancer = model.freelancers[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              throw UnimplementedError();

                              ///TODO WTF IS HERE ?
                            },
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width - 20,
                                height: 100,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffECECEC)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          shape: BoxShape.circle,
                                          image: freelancer.user?.image != null
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                      freelancer.user!.image!),
                                                  fit: BoxFit.cover)
                                              : null),
                                    ),
                                    const SizedBox(width: 15),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          freelancer.user?.name ?? '-',
                                          style: TextStyle(
                                            color: AppColors().primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: RatingBarIndicator(
                                            rating: freelancer.rating ?? 0,
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 19.0,
                                            direction: Axis.horizontal,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    )
        ],
      ),
    );
  }
}
