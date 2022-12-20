import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:raw/app/utils/constants.dart';

class HomeTopRatedWidget extends StatelessWidget {
  const HomeTopRatedWidget({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
                        child: const Center(
                            child: Text(
                          'User image',
                          style: TextStyle(fontSize: 10),
                        )),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Freelancer Name',
                            style: TextStyle(
                              color: AppColors().primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: RatingBarIndicator(
                              rating: 4.5,
                              itemBuilder: (context, index) => Icon(
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xffECECEC)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
