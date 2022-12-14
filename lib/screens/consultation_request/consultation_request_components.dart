import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/res.dart';
import '../../widgets/text_views.dart';

class ConsultationRequestComponents {
  Widget dropDown({
    @required String ?selectedCategory,
    @required Function ?updateSelectedCategory,
    @required List<String> ?categories,
    @required String ?hint,
  }){
    return Container(
      // height: sizes!.height * 0.07,

      child: ButtonTheme(
        child: DropdownButton <String>(
            hint: Text(hint ?? '',
              style: TextStyle(
                color: AppColors.hintTextGreyColor,
                fontSize: sizes!.fontSize14,
                fontFamily:Assets.raleWayRegular,
              ),
            ),
            value: selectedCategory,
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down,color: AppColors.hintTextGreyColor,size: getHeight()*.035,),
            underline: const SizedBox() ,
            onChanged: (newValue) {
              if(updateSelectedCategory != null){
                updateSelectedCategory(newValue);
              }
            },
            items: categories?.map<DropdownMenuItem<String>> ((String value) {
              return DropdownMenuItem<String> (
                value: value,
                child: Text(value,style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontFamily: Assets.raleWayRegular,
                  fontSize: sizes!.fontSize14,
                ),
                ),
              );
            }).toList()
        ),
      ),
    );
  }
  Widget getDateField({@required String? date,timeselct, @required Function? onPressDate, Color? bgColor}) {
    return GestureDetector(
      onTap: () {
        if (onPressDate != null) {
          onPressDate.call();
        }
      },
      child: Container(
        // height: sizes!.height * 0.05,
        // width: sizes!.width * 0.4,
        // margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.03),
        // padding: EdgeInsets.symmetric(horizontal: sizes!.width * 0.05),
        // decoration: BoxDecoration(
        //     color: bgColor ?? AppColors.pureWhiteColor,
        //     border: Border.all(color: AppColors.grey2colrtext),
        //     borderRadius: BorderRadius.all(Radius.circular(getHeight() * .01))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView.size14Text(
                date, color: date == "Select Date" ? AppColors.grey2colrtext: AppColors.blackTextColor,
                fontFamily: Assets.raleWayRegular),
                Padding(
                  padding:  EdgeInsets.only(right: getWidth()*0.2),
                  child: TextView.size14Text(timeselct, color: AppColors.grey2colrtext,fontWeight: FontWeight.w500,fontFamily: Assets.raleWayMedium),
                ),
                Image.asset(Assets.calendericon,height:  getHeight()*0.021),
         

          ],
        ),
      ),
    );
  }
}