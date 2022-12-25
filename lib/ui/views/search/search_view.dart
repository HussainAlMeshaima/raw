import 'package:flutter/material.dart';
import 'package:raw/app/utils/constants.dart';
import 'package:stacked/stacked.dart';

import './search_view_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    this.value,
    Key? key,
  }) : super(key: key);

  final String? value;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(context),
      onModelReady: (SearchViewModel model) async => await model.init(),
      builder: (BuildContext context, SearchViewModel model, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Search",
              style: TextStyle(
                color: AppColors().primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              onPressed: () => model.goBack(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors().primary,
              ),
            ),
          ),
          body: const Center(
            child: Text(
              'SearchView',
            ),
          ),
        );
      },
    );
  }
}
