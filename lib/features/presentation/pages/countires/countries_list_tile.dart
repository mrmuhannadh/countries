import 'package:countries/core/utils/AppStrings.dart';
import 'package:countries/core/utils/AppStyles.dart';
import 'package:countries/features/domain/entities/response/countries/countries_response_entity.dart';
import 'package:countries/features/presentation/pages/countires/arguments/countries_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountriesListTile extends StatefulWidget {
  final CountriesResponseEntity country;
  const CountriesListTile({super.key, required this.country});

  @override
  State<CountriesListTile> createState() => _CountriesListTileState();
}

class _CountriesListTileState extends State<CountriesListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Switch to detailed screen with only the selected country data
        Navigator.pushNamed(
          context,
          AppStrings.countriesDetailedView,
          arguments: CountriesArguments(
            countriesResponseEntity: widget.country,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 5.h,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(
              widget.country.flags.png ?? AppStrings.emptyString,
            ),
            fit: BoxFit.fitHeight,
            repeat: ImageRepeat.noRepeat,
            alignment: Alignment.centerRight,
            opacity: 0.09,
          ),
        ),
        height: 80.h,
        child: Row(
          children: [
            Container(
              width: 80.w,
              padding: EdgeInsets.only(left: 10.w),
              alignment: Alignment.centerLeft,
              child: SvgPicture.network(
                widget.country.flags.svg ?? AppStrings.emptyString,
                width: 80.w,
                height: 50.h,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            SizedBox(
              width: 210.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.country.name.common ?? AppStrings.emptyString,
                    style: AppTextStyles.CountriesListTextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    AppStrings.capital + widget.country.capital[0],
                    style: AppTextStyles.CountriesListTextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
            )
          ],
        ),
      ),
    );
  }
}
