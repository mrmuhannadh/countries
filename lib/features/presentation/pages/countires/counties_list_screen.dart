import 'package:countries/core/utils/AppStrings.dart';
import 'package:countries/core/utils/CommonFunctions.dart';
import 'package:countries/core/utils/check_connection.dart';
import 'package:countries/features/domain/entities/response/countries/countries_response_entity.dart';
import 'package:countries/features/presentation/common/common_app_bar.dart';
import 'package:countries/features/presentation/pages/countires/countries_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/countries/countries_bloc.dart';
import '../../bloc/countries/countries_state.dart';

class CountiesListScreen extends StatefulWidget {
  const CountiesListScreen({super.key});

  @override
  State<CountiesListScreen> createState() => _CountiesListScreenState();
}

class _CountiesListScreenState extends State<CountiesListScreen> {
  List<CountriesResponseEntity>? data;
  List<CountriesResponseEntity>? clonedData;

  @override
  void initState() {
    super.initState();
    CheckConnection().internetConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.appTitle,
        sortAction: (value) {
          if (value == AppStrings.resetSort) {
            setState(() {
              data = List<CountriesResponseEntity>.from(clonedData!);
            });
          }
          CommonFunctions().sortCountries(data!, value);
          setState(() {});
        },
      ),
      body: BlocListener<CountriesBloc, CountriesState>(
        listener: (context, state) {
          if (state is CountriesLoadingState) {
            CommonFunctions.showLoading(context);
          } else if (state is GetAllCountriesSuccessState) {
            CommonFunctions.hideLoading(context);
            setState(() {
              data = List<CountriesResponseEntity>.from(
                state.countriesResponseEntity,
              );
              clonedData = List<CountriesResponseEntity>.from(
                state.countriesResponseEntity,
              );
            });
          } else if (state is CountriesFailureState) {
            CommonFunctions.hideLoading(context);
            CommonFunctions.showErrorMessages(context, state.message);
          }
        },
        child: Column(
          children: [
            Container(
              height: 750.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: data != null
                  ? SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          final countryData = data?[index];

                          return CountriesListTile(
                            country: countryData!,
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
