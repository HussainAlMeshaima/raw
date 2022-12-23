import 'package:flutter/material.dart';

class HomeServiceWidget extends StatelessWidget {
  const HomeServiceWidget(
    this.image,
    this.label,
    this.callBack, {
    Key? key,
  }) : super(key: key);

  final String image;
  final String label;
  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        if (callBack != null) {callBack()}
      },
      child: Container(
        height: 115,
        width: 93,
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: const Color(0xffECECEC),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
