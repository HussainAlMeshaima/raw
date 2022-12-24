import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './freelance_panel_view_model.dart';
import '../../../app/utils/constants.dart';

class FreelancePanelView extends StatelessWidget {
  const FreelancePanelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FreelancePanelViewModel>.reactive(
      viewModelBuilder: () => FreelancePanelViewModel(context),
      onModelReady: (FreelancePanelViewModel model) async => await model.init(),
      builder: (BuildContext context, FreelancePanelViewModel model, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'WELCOME!',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors().primary),
                    ),
                    SizedBox(width: 6),
                    Image.asset(
                      AppImages.helloEmoji,
                      height: 15,
                      width: 15,
                    ),
                  ],
                ),
                Text(
                  'Freelancer_name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors().primary),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.logout_rounded,
                    color: AppColors().primary,
                  ))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(child: Image.asset('assets/images/logo_colored.png')),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Freelancer Panel',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  'Welcome to the Freelancer panel! From Here you can manage your booking appointments',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: InkWell(
                  onTap: () {
                    model.pushNamed('/appointments-view');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    decoration: BoxDecoration(color: AppColors().primary, borderRadius: BorderRadius.circular(12)),
                    child: const Text(
                      'Appointments',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
