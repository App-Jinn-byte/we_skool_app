import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class BlocarticleWidgets {

  static Widget mycircleimage({dynamic child, Color? clr,required bool? isDataFetched,required String image,
  }) {
    isDataFetched ??= false;
    return CircleAvatar(
      backgroundImage: isDataFetched
          ? NetworkImage(image)
          : const AssetImage(Assets.imagePlaceHolder)
      as ImageProvider,
      radius: getHeight() * 0.02, // 50.0
      backgroundColor: AppColors.transparentColor,
      child: child,
    );
  }

  static Widget myDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
      child: Divider(
          height: getHeight() * 0.01,
          thickness: getHeight() * 0.001,
          color: AppColors.dividerColor),
    );
  }


  static Widget myBox(
      {String? title,
      subtitle,
      titlefile,
      subtitlefile,
      titleaction,
      subtitleaction}) {
    return Container(
      height: getHeight() * 0.33,
      width: getWidth(),
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: TextView.size14Text(title,
                  color: AppColors.textcolr,
                  fontFamily: Assets.raleWaySemiBold),
              subtitle: Padding(
                padding: EdgeInsets.only(top: getHeight() * 0.02),
                child: TextView.size14Text(subtitle,
                    color: AppColors.greyTextColor,
                    fontFamily: Assets.raleWayMedium),
              ),
            ),
            BlocarticleWidgets.myDivider(),
          
         
            ListTile(
              title: TextView.size14Text(titlefile,
                  color: AppColors.textcolr,
                  fontFamily: Assets.raleWaySemiBold),
              subtitle: Padding(
                padding: EdgeInsets.only(top: getHeight() * 0.02),
                child: TextView.size14Text(subtitlefile,
                    color: AppColors.greyTextColor,
                    fontFamily: Assets.raleWayMedium),
              ),
              
            ),
            BlocarticleWidgets.myDivider(),
            ListTile(
              title: TextView.size14Text(titleaction,
                  color: AppColors.textcolr,
                  fontFamily: Assets.raleWaySemiBold),
              subtitle: Padding(
                padding: EdgeInsets.only(top: getHeight() * 0.02),
                child: TextView.size14Text(subtitleaction,
                    color: AppColors.greyTextColor,
                    fontFamily: Assets.raleWayMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }

 static Widget dropDown({
    @required String ?selectedCategory,
    @required Function ?updateSelectedCategory,
    @required List<String> ?categories,
    @required String ?hint,
  }){
    return Container(
       height: sizes!.height * 0.07,
       

      child: ButtonTheme(
        child: DropdownButton <String>(
            hint: Text(hint ?? '',
              style: TextStyle(
                color: AppColors.hintTextGreyColor,
                fontSize: sizes!.fontSize14,
                fontFamily:Assets.raleWayRegular,
              ),
            ),
            value: '1',
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

}
