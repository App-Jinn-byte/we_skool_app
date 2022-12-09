

import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

import '../../res/colors.dart';
import '../../res/res.dart';

class Addcaregiverscomponents{
   Widget myAddCaregiver(
      {
        @required double? height
    }) {
    return Container(
      height: height ?? getHeight() * 0.58,
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
        padding: EdgeInsets.all(getHeight()*0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView.size14Text('First Name', color: AppColors.textColor,fontFamily: Assets.raleWaySemiBold,fontWeight: FontWeight.w600),
            SizedBox(height: getHeight()*0.01,),
            mytextField(
              hint: 'First Name',
            ),
            SizedBox(height: getHeight()*0.03,),

            TextView.size14Text('Last Name', color: AppColors.textColor,fontFamily: Assets.raleWaySemiBold,fontWeight: FontWeight.w600),
            SizedBox(height: getHeight()*0.01,),
            mytextField(
              hint: 'Last Name',
            ),
               SizedBox(height: getHeight()*0.03,),

            TextView.size14Text('Email', color: AppColors.textColor,fontFamily: Assets.raleWaySemiBold,fontWeight: FontWeight.w600),
            SizedBox(height: getHeight()*0.01,),
            mytextField(
              hint: 'Messi10@gmail.com',
            ),
                 SizedBox(height: getHeight()*0.03,),

            TextView.size14Text('Contact Number', color: AppColors.textColor,fontFamily: Assets.raleWaySemiBold,fontWeight: FontWeight.w600),
            SizedBox(height: getHeight()*0.01,),
            mytextField(
              hint: '+123 456 789 00',
            ),
            SizedBox(height: getHeight()*0.02,),

            myDivider(),
            SizedBox(height: getHeight()*0.02,),

            CommonWidgets.getButton(onPress: (){},text: 'Add Now',height: getHeight()*0.06,fontFamily: Assets.raleWaySemiBold,fontWeight: FontWeight.w600,fontSize: sizes!.fontSize14,)
          ],

        ),
      ),
    );
    


}
Widget myDivider() {
    return Divider(
        height: getHeight() * 0.01,
        thickness: getHeight() * 0.001,
        color: AppColors.dividerColor);
  }
  Widget mytextField(
      {TextEditingController? textEditingController,
      bool? obscureText,
      String? hint,
      TextInputType? textInputType,
      double? width,
      Widget? icon,
      Color? borderColor,
      Color? bgColor}) {
    return Container(
      height: getHeight() * 0.053,
      width: width ?? sizes!.width,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: AppColors.hintTextGreyColor,
                blurRadius: 1,
                offset: Offset(0, 1))
          ],
          color: bgColor ?? AppColors.pureWhiteColor,
          border: Border.all(color:AppColors.borderColor ),
          
          borderRadius: BorderRadius.all(Radius.circular(getHeight() * .01))),
      child: TextField(
        controller: textEditingController,
        obscureText: obscureText ?? false,
        cursorHeight: getHeight() * .025,
        keyboardType: textInputType ?? TextInputType.text,
        cursorColor: AppColors.blackTextColor,
        style: TextStyle(
          color: AppColors.blackTextColor,
          fontSize: sizes!.fontSize14,
          fontFamily: Assets.raleWayRegular,
        ),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
                left: getWidth() * .04, bottom: getHeight() * 0.008),
            hintText: hint ?? "",
            alignLabelWithHint: false,
            hintStyle: TextStyle(
              color: AppColors.grey2colrtext,
              fontSize: sizes!.fontSize14,
              fontFamily: Assets.raleWayMedium,
            )),
      ),
    );
  }
}