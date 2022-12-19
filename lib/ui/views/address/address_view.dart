import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:stacked/stacked.dart';

import './address_view_model.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? type = false;
    return ViewModelBuilder<AddressViewModel>.reactive(
      viewModelBuilder: () => AddressViewModel(context),
      onModelReady: (AddressViewModel model) async => await model.init(),
      builder: (BuildContext context, AddressViewModel model, Widget? child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Add Address",
            style: TextStyle(
              color: AppColors().primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                model.goBack();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors().primary,
              )),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(AppImages.address),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Choose Address Type',
                  style: TextStyle(
                    color: AppColors().primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith((states) => AppColors().primary),
                                  focusColor: MaterialStateColor.resolveWith((states) => AppColors().primary),
                                  value: false,
                                  groupValue: type,
                                  onChanged: (bool? value) {
                                    type = value;
                                    model.toggleIsFlat(value: value);
                                  },
                                ),
                                Expanded(
                                  child: Text('House'),
                                )
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith((states) => AppColors().primary),
                                  focusColor: MaterialStateColor.resolveWith((states) => AppColors().primary),
                                  value: true,
                                  groupValue: type,
                                  onChanged: (bool? value) {
                                    type = value;
                                    model.toggleIsFlat(value: value);
                                  },
                                ),
                                Expanded(
                                  child: Text('Flat'),
                                )
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: 43,
                    child: Center(
                      child: TextField(
                        cursorColor: AppColors().primary,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            focusColor: AppColors().primary,
                            filled: true,
                            fillColor: Color(0xffF6F6F6),
                            hintText: "Address Name",
                            hintStyle: TextStyle(color: Color(0xff908E8E)),
                            contentPadding: EdgeInsets.only(
                              bottom: 43 / 2,
                              left: 7, // HERE THE IMPORTANT PART
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            )),
                      ),
                    ),
                  ),
                ),
                model.isFlat == true
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 43,
                              child: Center(
                                child: TextField(
                                  cursorColor: AppColors().primary,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      focusColor: AppColors().primary,
                                      filled: true,
                                      fillColor: Color(0xffF6F6F6),
                                      hintText: "Building",
                                      hintStyle: TextStyle(color: Color(0xff908E8E)),
                                      contentPadding: EdgeInsets.only(
                                        bottom: 43 / 2,
                                        left: 7, // HERE THE IMPORTANT PART
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 43,
                              child: Center(
                                child: TextField(
                                  cursorColor: AppColors().primary,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      focusColor: AppColors().primary,
                                      filled: true,
                                      fillColor: Color(0xffF6F6F6),
                                      hintText: "Flat number",
                                      hintStyle: TextStyle(color: Color(0xff908E8E)),
                                      contentPadding: EdgeInsets.only(
                                        bottom: 43 / 2,
                                        left: 7, // HERE THE IMPORTANT PART
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 43,
                              child: Center(
                                child: TextField(
                                  cursorColor: AppColors().primary,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      focusColor: AppColors().primary,
                                      filled: true,
                                      fillColor: Color(0xffF6F6F6),
                                      hintText: "Floor",
                                      hintStyle: TextStyle(color: Color(0xff908E8E)),
                                      contentPadding: EdgeInsets.only(
                                        bottom: 43 / 2,
                                        left: 7, // HERE THE IMPORTANT PART
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          height: 43,
                          child: Center(
                            child: TextField(
                              cursorColor: AppColors().primary,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  focusColor: AppColors().primary,
                                  filled: true,
                                  fillColor: Color(0xffF6F6F6),
                                  hintText: "House",
                                  hintStyle: TextStyle(color: Color(0xff908E8E)),
                                  contentPadding: EdgeInsets.only(
                                    bottom: 43 / 2,
                                    left: 7, // HERE THE IMPORTANT PART
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  )),
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: 43,
                    child: Center(
                      child: TextField(
                        cursorColor: AppColors().primary,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            focusColor: AppColors().primary,
                            filled: true,
                            fillColor: Color(0xffF6F6F6),
                            hintText: "Street",
                            hintStyle: TextStyle(color: Color(0xff908E8E)),
                            contentPadding: EdgeInsets.only(
                              bottom: 43 / 2,
                              left: 7, // HERE THE IMPORTANT PART
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: 43,
                    child: Center(
                      child: TextField(
                        cursorColor: AppColors().primary,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            focusColor: AppColors().primary,
                            filled: true,
                            fillColor: Color(0xffF6F6F6),
                            hintText: "Block",
                            hintStyle: TextStyle(color: Color(0xff908E8E)),
                            contentPadding: EdgeInsets.only(
                              bottom: 43 / 2,
                              left: 7, // HERE THE IMPORTANT PART
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors().primary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      //TODO Save user data
                      model.pushNamed('/home-view');
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
