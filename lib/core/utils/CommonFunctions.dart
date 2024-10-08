import 'package:countries/core/utils/AppStrings.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../features/domain/entities/response/countries/countries_response_entity.dart';

import 'AppColors.dart';

class CommonFunctions {
  //Sort the counties
  List<CountriesResponseEntity> sortCountries(
      List<CountriesResponseEntity> countries, String type) {
    switch (type) {
      case AppStrings.sortByPopulation:
        countries.sort((a, b) => a.population.compareTo(b.population));
        break;
      case AppStrings.sortByName:
        countries.sort((a, b) => a.name.common!.compareTo(b.name.common!));
        break;
      case AppStrings.sortByCapital:
        countries.sort((a, b) => a.capital[0].compareTo(b.capital[0]));
        break;
    }

    return countries;
  }

  //SnackBar to show the error messages
  static void showErrorMessages(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.appRedColor,
      ),
    );
  }

  //Show an overlay while loading
  static void showLoading(BuildContext context) {
    context.loaderOverlay.show();
  }

  //Hide the overlay
  static void hideLoading(BuildContext context) {
    context.loaderOverlay.hide();
  }
}
