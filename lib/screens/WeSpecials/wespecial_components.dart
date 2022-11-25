
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class WeSpecialWidgets {
  static Widget myBackButton(
      {required Function? onPress, required double height, width}) {
    return GestureDetector(
      onTap: () {
        onPress!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: sizes!.widthRatio * 10,
            vertical: sizes!.heightRatio * 10),
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.pureWhiteColor,
              width: 0.20,
            ),
            borderRadius:
            BorderRadius.all(Radius.circular(getHeight() * 0.016)),
            color: AppColors.pureWhiteColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 221, 217, 217),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )
            ]),
        child: Image.asset(
          Assets.backIcon,
        ),
      ),
    );
  }

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



  static Widget searchField({
    TextEditingController? textEditingController,
  }) {
    return Container(
        height: getHeight() * 0.055,
        width: getWidth(),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: AppColors.shadow, blurRadius: 2, offset: Offset(1, 3))
          ],
          color: AppColors.pureWhiteColor,
          // border: Border.all(color: borderColor ?? AppColors.blackColor),
          borderRadius: BorderRadius.all(Radius.circular(getHeight() * .014)),
        ),
        child: TextField(
            cursorHeight: getHeight() * .024,
            controller: textEditingController,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: AppColors.blackTextColor,
            style: TextStyle(
              color: AppColors.blackTextColor,
              fontSize: sizes!.fontSize14,
              fontFamily: Assets.raleWayRegular,
            ),
            decoration: InputDecoration(
              hintText: '     Search',
              hintStyle: TextStyle(
                color: AppColors.hintTextGreyColor,
                fontSize: sizes!.fontSize15,
                fontFamily: Assets.raleWayRegular,
              ),
              prefixIcon: FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 9),
                      child: Icon(
                        Icons.search,
                        color: AppColors.greyTextColor,

                      ),
                    ),
                    SizedBox(
                      width: getWidth() * 0.03,
                    ),
                    Container(
                      height: getHeight() * 0.02,
                      width: getWidth() * 0.002,
                      color: AppColors.greyTextColor,
                    ),

                  ],
                ),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: getWidth() * 0.01, bottom: getHeight() * .01),
              alignLabelWithHint: false,
            )));
  }



  static Widget myDividers() {
    return const Divider(
      thickness: 1.4,
      color: AppColors.dividercolr,
    );
  }
  static Widget miniContainer({String? text1,textprice, required Color color,colortext}) {
    return   Container(
      height: getHeight()*0.043,
      width: getWidth(),

      decoration: BoxDecoration(

        color: AppColors.pureWhiteColor,
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(Radius.circular(getHeight() * .012)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextView.size14Text(text1, color: colortext),
          Text('|',style: TextStyle(color: colortext),),

          TextView.size14Text(textprice, color: colortext),

        ],
      ),
    );
  }
}