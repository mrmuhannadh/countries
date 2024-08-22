import 'package:countries/core/utils/AppStrings.dart';
import 'package:countries/core/utils/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool? isBackButtonAvailable;
  final String? imageLink;
  final Function(String value)? sortAction;
  const CommonAppBar({
    super.key,
    required this.title,
    this.isBackButtonAvailable,
    this.imageLink,
    this.sortAction,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  //Sorting options
  final List<DropdownMenuItem<String>> dropdownItems = [
    const DropdownMenuItem(
      value: AppStrings.sortByPopulation,
      child: Row(
        children: [
          Icon(Icons.people_alt_outlined),
          SizedBox(width: 8),
          Text(AppStrings.sortByPopulation),
        ],
      ),
    ),
    const DropdownMenuItem(
      value: AppStrings.sortByName,
      child: Row(
        children: [
          Icon(Icons.sort_by_alpha_rounded),
          SizedBox(width: 8),
          Text(AppStrings.sortByName),
        ],
      ),
    ),
    const DropdownMenuItem(
      value: AppStrings.sortByCapital,
      child: Row(
        children: [
          Icon(Icons.home_work_outlined),
          SizedBox(width: 8),
          Text(AppStrings.sortByCapital),
        ],
      ),
    ),
    const DropdownMenuItem(
      value: AppStrings.resetSort,
      child: Row(
        children: [
          Icon(Icons.refresh_rounded),
          SizedBox(width: 8),
          Text(AppStrings.resetSort),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: AppTextStyles.CountriesListTextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: widget.isBackButtonAvailable,
      leading: widget.isBackButtonAvailable == true
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            )
          : null,
      elevation: 1,
      actions: [
        //show the dropdown options in the counties screen and show the flag in detailed screen
        widget.isBackButtonAvailable == true
            ? Container(
                margin: const EdgeInsets.only(right: 10),
                child: Image.network(
                  widget.imageLink!,
                  fit: BoxFit.cover,
                  width: 40,
                ),
              )
            : Container(
                margin: EdgeInsets.only(right: 15.w),
                child: DropdownButton(
                  elevation: 0,
                  isDense: true,
                  underline: const SizedBox(),
                  iconSize: 25.sp,
                  icon: const Icon(Icons.sort),
                  items: dropdownItems,
                  onChanged: (String? newValue) {
                    //Function to return the selected value
                    widget.sortAction!(newValue!) ?? () {};
                  },
                ),
              ),
      ],
    );
  }
}
