import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AppColors.dart';

class AppTextStyles {
  static TextStyle CountriesListTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? fontColor,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: fontColor ?? AppColors.appLightFontColor,
      overflow: TextOverflow.ellipsis,
    );
  }
}
