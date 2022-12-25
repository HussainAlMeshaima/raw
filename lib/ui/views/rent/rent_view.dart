import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:stacked/stacked.dart';

import './rent_view_model.dart';

class RentView extends StatelessWidget {
  const RentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RentViewModel>.reactive(
      viewModelBuilder: () => RentViewModel(context),
      onModelReady: (RentViewModel model) async => await model.init(),
      builder: (BuildContext context, RentViewModel model, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Rent', style: TextStyle(color: AppColors().primary)),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  model.pushNamed('/search-view');
                },
                icon: Icon(Icons.search),
                color: AppColors().primary,
              ),
            ],
            leading: IconButton(
              onPressed: () {
                model.goBack();
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: AppColors().primary,
            ),
          ),
          body: ListView(shrinkWrap: true, physics: const BouncingScrollPhysics(), children: [
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.items.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => model.changeChip(index),
                    child: Chip(
                      backgroundColor: model.items[index]['selected'] ? AppColors().primary : Colors.white,
                      label: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          model.items[index]['name'],
                          style: TextStyle(color: model.items[index]['selected'] ? Colors.white : AppColors().primary),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(color: const Color(0xffD9D9D9), borderRadius: BorderRadius.circular(20)),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 110,
                              height: 110,
                              child: Container(
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            height: 40,
                            child: Container(
                              decoration: const BoxDecoration(color: Color(0xffFCA311), borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                Text('25 BD', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                Text('Per Day', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Sony A7iii",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                              "mirror less camera by sony",
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              ],
            )
          ]),
        );
      },
    );
  }
}
