import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './add_freelancer_view_model.dart';
import '../../../app/utils/constants.dart';

class AddFreelancerView extends StatefulWidget {
  const AddFreelancerView({Key? key}) : super(key: key);

  @override
  State<AddFreelancerView> createState() => _AddFreelancerViewState();
}

class _AddFreelancerViewState extends State<AddFreelancerView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddFreelancerViewModel>.reactive(
      viewModelBuilder: () => AddFreelancerViewModel(context),
      onModelReady: (AddFreelancerViewModel model) async => await model.init(),
      builder: (BuildContext context, AddFreelancerViewModel model, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Freelancer',
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            //TODO Add profile Photo
                          },
                          child: Container(
                            height: 125,
                            width: 125,
                            decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Choose Photo',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
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
                              hintText: "Name",
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
                              hintText: "Email",
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
                              hintText: "Phone number",
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
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines: null,
                          cursorColor: AppColors().primary,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              focusColor: AppColors().primary,
                              filled: true,
                              fillColor: Color(0xffF6F6F6),
                              hintText: "Description",
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
                    height: 17,
                  ),
                  Text(
                    'Freelancer Type',
                    style: TextStyle(
                      color: AppColors().primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  checkBox(model),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget checkBox(AddFreelancerViewModel model) {
  bool _photographers = model.photographers;
  bool _videographers = model.videographers;
  bool _studio = model.studio;
  return Column(
    children: [
      CheckboxListTile(
        title: Text(
          'Photographers',
          style: TextStyle(color: Color(0xFF14213D)),
        ),
        activeColor: AppColors().primary,
        value: _photographers,
        onChanged: (value) {
          model.toggleIsPhotographer();
          _photographers = model.photographers;
        },
      ),
      CheckboxListTile(
        title: Text(
          'Videographers',
          style: TextStyle(color: Color(0xFF14213D)),
        ),
        activeColor: AppColors().primary,
        value: _videographers,
        onChanged: (value) {
          model.toggleIsVideographer();
          _videographers = model.videographers;
        },
      ),
      CheckboxListTile(
        title: Text(
          'Studio',
          style: TextStyle(color: Color(0xFF14213D)),
        ),
        activeColor: AppColors().primary,
        value: _studio,
        onChanged: (value) {
          model.toggleIsStudio();
          _studio = model.studio;
        },
      ),
    ],
  );
}
