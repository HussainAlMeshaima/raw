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
              'Add Freelancer',
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
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: InkWell(
                      onTap: () {
                        _showAddPackageDialog(context);
                      },
                      child: Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(color: AppColors().primary, borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: const Text(
                            'Add Freelancer',
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: packageCard(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(color: AppColors().primary, borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
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

void _showAddPackageDialog(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  String _packageName;
  String _price;
  String _packageDescription;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          title: Text('Add Package'),
          actions: [
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Add code here to add the package to your list or database
                  Navigator.of(context).pop();
                }
              },
            ),
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          content: Builder(builder: (context) {
            return Container(
              height: 200,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Package Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a package name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        if (value != null) {
                          _packageName = value;
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Price'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        if (value != null) {
                          _price = value;
                        }
                      },
                    ),
                    TextFormField(
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'Package Description',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a package description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        if (value != null) {
                          _packageDescription = value;
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }));
    },
  );
}

Widget packageCard() {
  return Container(
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Color(0xffDDDDDD), width: 0.8),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Package Title'),
              Text('Package Description'),
              Text('Package Price'),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove_circle,
                color: AppColors().secondary,
              )),
        ],
      ),
    ),
  );
}
