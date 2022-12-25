import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:stacked/stacked.dart';

import './admin_view_model.dart';

class AdminView extends StatelessWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminViewModel>.reactive(
      viewModelBuilder: () => AdminViewModel(context),
      onModelReady: (AdminViewModel model) async {
        await model.init();
      },
      builder: (BuildContext context, AdminViewModel model, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              'Freelancer Panel',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors().primary),
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
              Center(child: Image.asset('assets/images/logo_colored.png')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                child: Text(
                  'Welcome to the Admin panel! From Here you can Add Freelancers or manage the rent orders',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  onTap: () {
                    model.pushNamed('/add-freelancer-view');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    decoration: BoxDecoration(color: AppColors().primary, borderRadius: BorderRadius.circular(12)),
                    child: const Text(
                      'Add Freelancer',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: () {
                    model.pushNamed('/rent-orders-view');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 111, vertical: 15),
                    decoration: BoxDecoration(color: AppColors().primary, borderRadius: BorderRadius.circular(12)),
                    child: const Text(
                      'Rent Orders',
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
