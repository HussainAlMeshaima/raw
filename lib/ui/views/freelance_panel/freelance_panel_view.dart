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
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              Center(child: Image.asset('assets/images/logo_colored.png')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                child: Text(
                  'Welcome to the Freelancer panel! From Here you can manage your booking appointments',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
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
