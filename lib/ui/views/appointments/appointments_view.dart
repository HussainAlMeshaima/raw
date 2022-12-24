import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './appointments_view_model.dart';
import '../../../app/utils/constants.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentsViewModel>.reactive(
      viewModelBuilder: () => AppointmentsViewModel(context),
      onModelReady: (AppointmentsViewModel model) async => await model.init(),
      builder: (BuildContext context, AppointmentsViewModel model, Widget? child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
            child: Column(
              children: [
                header(model),
                SizedBox(
                  height: 10,
                ),
                searchAppointmentTextFeild(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF0F4F9),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                    ),
                    child: ListView(
                      children: [
                        appointmentRequest(),
                        appointmentAccepted(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget header(AppointmentsViewModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 40),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                model.goBack();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors().primary,
              )),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
              child: const Center(
                  child: Text(
                'User image',
                style: TextStyle(fontSize: 10),
              )),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: Text(
                          'WELCOME',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Image.asset(
                        AppImages.helloEmoji,
                        height: 15,
                        width: 15,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Freelanser_name',
                  style: TextStyle(
                    color: AppColors().primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget searchAppointmentTextFeild() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SizedBox(
          height: 43,
          child: Center(
            child: TextField(
              cursorColor: AppColors().primary,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Transform.rotate(
                  angle: 90 * pi / 180,
                  child: Icon(
                    Icons.search,
                    color: AppColors().primary,
                  ),
                ),
                prefixIconColor: AppColors().primary,
                focusColor: AppColors().primary,
                filled: true,
                fillColor: const Color(0xffF6F6F6),
                hintText: "Search",
                hintStyle: const TextStyle(color: Color(0xff908E8E)),
                contentPadding: const EdgeInsets.only(
                  bottom: 43 / 2,
                  left: 7, // HERE THE IMPORTANT PART
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
    ],
  );
}

Widget appointmentRequest() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
    child: Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    'User image',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors().primary,
                  ),
                ),
                Text(
                  'Package',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors().primary,
                  ),
                ),
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors().primary,
                  ),
                ),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors().primary,
                  ),
                ),
                Text(
                  'Reference ID',
                  style: TextStyle(
                    fontSize: 8,
                    color: AppColors().primary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.check_circle, color: Colors.green[700]),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.cancel, color: Colors.red[400]),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget appointmentAccepted() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
    child: Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xff62BA75),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
                    child: const Center(
                        child: Text(
                      'User image',
                      style: TextStyle(fontSize: 10),
                    )),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Approved',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Package',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Reference ID',
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.whatsapp_rounded,
                    color: Colors.white,
                    size: 40,
                  )),
            )
          ],
        ),
      ),
    ),
  );
}

// Widget appointmentRejected() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 5.0),
//     child: Container(
//       height: 100,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.white,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 25.0),
//               child: Container(
//                 height: 60,
//                 width: 60,
//                 decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Center(
//                         child: Text(
//                       'User image',
//                       style: TextStyle(fontSize: 10),
//                     )),
//                   ],
//                 ),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   'Name',
//                   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors().primary),
//                 ),
//                 Text(
//                   'Package',
//                   style: TextStyle(fontSize: 12, color: AppColors().primary),
//                 ),
//                 Text(
//                   'Price',
//                   style: TextStyle(fontSize: 12, color: AppColors().primary),
//                 ),
//                 Text(
//                   'Phone Number',
//                   style: TextStyle(fontSize: 12, color: AppColors().primary),
//                 ),
//               ],
//             ),
//             Spacer(),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.check_circle, color: Colors.green[700]),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.cancel, color: Colors.red[400]),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
