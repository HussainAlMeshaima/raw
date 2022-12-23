import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';

class HomeAdClickableWidget extends StatelessWidget {
  const HomeAdClickableWidget({
    required this.title,
    required this.desc,
    required this.adImage,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final String desc;
  final String adImage;
  final Function? onTap;

  @override
  Widget build(BuildContext context) => Container(
        height: 160,
        width: 400,
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: adImage.isNotEmpty ? DecorationImage(image: AssetImage(adImage)) : null,
          color: adImage.isEmpty ? AppColors().primary : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: Text(
                desc,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 30,
              width: 120,
              child: TextButton(
                onPressed: () => {
                  if (onTap != null) {onTap!()}
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    color: AppColors().primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
