import 'package:countries/core/utils/AppStyles.dart';
import 'package:countries/features/presentation/common/common_app_bar.dart';
import 'package:countries/features/presentation/pages/countires/arguments/countries_arguments.dart';
import 'package:countries/features/presentation/pages/countires/detailed_view_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/AppStrings.dart';

class CountriesDetailedView extends StatelessWidget {
  final CountriesArguments arguments;
  const CountriesDetailedView({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: arguments.countriesResponseEntity.name.common!,
        isBackButtonAvailable: true,
        imageLink: arguments.countriesResponseEntity.flags.png,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            DetailedViewTile(
              label: AppStrings.commonName,
              value: arguments.countriesResponseEntity.name.common!,
            ),
            DetailedViewTile(
              label: AppStrings.officialName,
              value: arguments.countriesResponseEntity.name.official!,
            ),
            DetailedViewTile(
              label: AppStrings.population,
              value: arguments.countriesResponseEntity.population.toString(),
            ),
            const Divider(),
            Text(
              AppStrings.languages,
              style: AppTextStyles.CountriesListTextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: arguments.countriesResponseEntity.languages.length * 50.h,
              child: ListView.builder(
                itemCount: arguments.countriesResponseEntity.languages.length,
                itemBuilder: (context, index) {
                  String key = arguments.countriesResponseEntity.languages.keys
                      .elementAt(index);
                  return DetailedViewTile(
                    value: arguments.countriesResponseEntity.languages[key]!,
                    isLabelAvailable: false,
                  );
                },
              ),
            ),
            const Divider(),
            Text(
              AppStrings.flag,
              style: AppTextStyles.CountriesListTextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: SvgPicture.network(
                arguments.countriesResponseEntity.flags.svg ??
                    AppStrings.emptyString,
                width: 250.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
