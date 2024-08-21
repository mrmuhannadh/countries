import 'package:countries/core/utils/AppStrings.dart';
import 'package:countries/core/utils/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedViewTile extends StatelessWidget {
  final String? label;
  final String value;
  final bool? isLabelAvailable;
  const DetailedViewTile({
    super.key,
    this.label,
    required this.value,
    this.isLabelAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        children: [
          isLabelAvailable == true
              ? SizedBox(
                  width: 150.w,
                  child: Text(
                    label ?? AppStrings.emptyString,
                    style: AppStyles.CountriesListTextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : const SizedBox(),
          Text(
            value,
            style: AppStyles.CountriesListTextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
