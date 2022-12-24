import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './profile_view_model.dart';
import '../../../app/utils/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(context),
      onModelReady: (ProfileViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        ProfileViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Profile",
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
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        await showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return ListView(
                                shrinkWrap: true,
                                children: [
                                  ListTile(
                                    onTap: () {
                                      model.goBack();
                                      model.openGallery();
                                    },
                                    leading: const Icon(Icons.photo),
                                    title: const Text('Gallery'),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      model.goBack();
                                      model.openCamera();
                                    },
                                    leading: const Icon(Icons.camera),
                                    title: const Text('Camera'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        height: 125,
                        width: 125,
                        decoration: BoxDecoration(
                          image: model.userImage != null
                              ? DecorationImage(
                                  image: FileImage(File(model.userImage!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Change Photo',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: 43,
                      child: Center(
                        child: TextField(
                          readOnly: model.isNotChangable,
                          controller: model.nameTextEditingController,
                          cursorColor: AppColors().primary,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  model.toggleIsNotChangable();
                                },
                                icon: Icon(
                                  model.isNotChangable == true ? Icons.edit : Icons.edit_off,
                                  color: AppColors().primary,
                                  size: 18,
                                ),
                              ),
                              focusColor: AppColors().primary,
                              filled: true,
                              fillColor: const Color(0xffF6F6F6),
                              hintText: "UserName",
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
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: 43,
                      child: Center(
                        child: TextField(
                          readOnly: model.isNotChangable,
                          controller: model.phoneNumberTextEditingController,
                          cursorColor: AppColors().primary,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                model.toggleIsNotChangable();
                              },
                              icon: Icon(
                                model.isNotChangable == true ? Icons.edit : Icons.edit_off,
                                color: AppColors().primary,
                                size: 18,
                              ),
                            ),
                            focusColor: AppColors().primary,
                            filled: true,
                            fillColor: const Color(0xffF6F6F6),
                            hintText: "UserPhoneNumber",
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: 43,
                      child: Center(
                        child: TextField(
                          readOnly: model.isNotChangable,
                          controller: model.emailTextEditingController,
                          cursorColor: AppColors().primary,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                model.toggleIsNotChangable();
                              },
                              icon: Icon(
                                model.isNotChangable == true ? Icons.edit : Icons.edit_off,
                                color: AppColors().primary,
                                size: 18,
                              ),
                            ),
                            focusColor: AppColors().primary,
                            filled: true,
                            fillColor: const Color(0xffF6F6F6),
                            hintText: "UserEmail",
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
                  const SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            //Todo
                            model.goBack();
                          },
                          //model.doLogin(),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors().primary),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
