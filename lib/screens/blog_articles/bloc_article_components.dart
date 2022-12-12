import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';


class BlogArticleComponents {
  Widget myDivider() {
    return Divider(
        height: getHeight() * 0.04,
        thickness: getHeight() * 0.001,
        color: AppColors.dividerColor);
  }

  Widget myBox({Widget? child}) {
    return Container(
      height: getHeight() * 0.34,
      width: getWidth(),
      padding: EdgeInsets.symmetric(
          horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.pureWhiteColor,
        border:
            Border.all(color: AppColors.borderColor, width: getWidth() * 0.005),
        boxShadow: const [
          BoxShadow(
              color: AppColors.shadow, blurRadius: 2, offset: Offset(1, 3))
        ],
        borderRadius: BorderRadius.all(Radius.circular(getHeight() * .014)),
      ),
      child: child,
    );
  }

  Widget dropDown( {
    @required String? selectedCategory,
    @required Function? updateSelectedCategory,
    @required List<String>? categories,
    @required String? hint,
  }) {
    return Container(
      // height: sizes!.height * 0.07,

      child: ButtonTheme(
        child: DropdownButton<String>(
            hint: Text(
              hint ?? '',
              style: TextStyle(
                color: AppColors.hintTextGreyColor,
                fontSize: sizes!.fontSize14,
                fontFamily: Assets.raleWayRegular,
              ),
            ),
            value: selectedCategory,
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.hintTextGreyColor,
              size: getHeight() * .035,
            ),
            underline: const SizedBox(),
            onChanged: (newValue) {
              if (updateSelectedCategory != null) {
                updateSelectedCategory(newValue);
              }
            },
            items: categories?.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontFamily: Assets.raleWayRegular,
                    fontSize: sizes!.fontSize14,
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}
