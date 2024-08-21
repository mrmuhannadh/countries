import 'package:countries/features/presentation/pages/countires/arguments/countries_arguments.dart';
import 'package:countries/features/presentation/pages/countires/countries_detailed_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../features/presentation/pages/countires/counties_list_screen.dart';
import 'AppStrings.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    const String countiesListScreenRoute = AppStrings.countriesList;
    const String countiesDetailedScreenRoute = AppStrings.countriesDetailedView;

    switch (settings.name) {
      case countiesListScreenRoute:
        return PageTransition(
          child: const CountiesListScreen(),
          type: PageTransitionType.fade,
        );

      case countiesDetailedScreenRoute:
        return PageTransition(
          child: CountriesDetailedView(
            arguments: settings.arguments as CountriesArguments,
          ),
          type: PageTransitionType.fade,
        );
      default:
        return null;
    }
  }
}
