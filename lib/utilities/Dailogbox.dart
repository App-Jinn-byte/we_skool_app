import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class AlertDilog extends StatelessWidget {
  const AlertDilog({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: getHeight() * 0.70,
                    width: getWidth() * 0.87,
                    decoration: BoxDecoration(
                      color: AppColors.pureWhiteColor,
                      boxShadow: const [
                        BoxShadow(
                            color: AppColors.shadow,
                            blurRadius: 2,
                            offset: Offset(0, 0))
                      ],
                      borderRadius:
                          BorderRadius.all(Radius.circular(getHeight() * .02)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getHeight() * 0.02,
                          horizontal: getWidth() * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextView.size20Text('Payment Information',
                              color: AppColors.redColor,
                              fontFamily: Assets.raleWaySemiBold,
                              fontWeight: FontWeight.w600),
                          TextView.size14Text('Credit/Debit Card Number',
                              color: AppColors.textcolr,
                              fontWeight: FontWeight.w600,
                              fontFamily: Assets.raleWaySemiBold),
                          textField(
                            hint: '1234-1234-1234-1234',
                            icon: const Icon(
                              Icons.payment,
                              color: AppColors.greyColor,
                      
                            ),
                            textInputType: TextInputType.number,
                          ),
                          TextView.size14Text('Exeprie Date',
                              color: AppColors.textcolr,
                              fontWeight: FontWeight.w600,
                              fontFamily: Assets.raleWaySemiBold),
                          textField(
                            hint: '12/2022',
                            icon: const Icon(
                              Icons.payment,
                              color: AppColors.greyColor,
                            ),
                          ),
                          TextView.size14Text('CVC',
                              color: AppColors.textcolr,
                              fontWeight: FontWeight.w600,
                              fontFamily: Assets.raleWaySemiBold),
                          textField(
                            textInputType: TextInputType.number,
                            hint: '1234',
                            icon: const Icon(
                              Icons.payment,
                              color: AppColors.greyColor,
                            ),
                          ),
                          TextView.size14Text('Amount to Pay',
                              color: AppColors.textcolr,
                              fontWeight: FontWeight.w600,
                              fontFamily: Assets.raleWaySemiBold),
                          textField(
                            hint: 'Yoga Class',
                            icon: const Icon(Icons.monetization_on_outlined),
                      
                          ),
                          Divider(
                              height: getHeight() * 0.01,
                              thickness: getHeight() * 0.001,
                              color: AppColors.dividerColor),
                          CommonWidgets.getButton(
                              onPress: () {
                                Navigator.pop(context);
                              },
                              text: 'Pay Amount ',
                              textColor: AppColors.pureWhiteColor,
                              btnColor: AppColors.pinkColor,
                              height: getHeight() * 0.06,
                              fontFamily: Assets.raleWaySemiBold),
                          CommonWidgets.getButton(
                              onPress: () {
                                Navigator.pop(context);
                              },
                              text: 'Cancel',
                              textColor: AppColors.btntextcolr,
                              btnColor: AppColors.pureWhiteColor,
                              height: getHeight() * 0.06,
                              fontFamily: Assets.raleWaySemiBold,
                              borderColor: AppColors.shadow),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget textField(
      {TextEditingController? textEditingController,
      bool? obscureText,
      String? hint,
      TextInputType? textInputType,
      double? width,
      Widget? icon,
      Color? borderColor,
      Color? bgColor}) {
    return Container(
      height: getHeight() * 0.05,
      width: width ?? sizes!.width,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: AppColors.hintTextGreyColor,
                blurRadius: 2,
                offset: Offset(1, 0))
          ],
          color: bgColor ?? AppColors.pureWhiteColor,
          // border: Border.all(color: borderColor ?? AppColors.blackColor),
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
            suffixIcon: icon,
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
                left: getWidth() * .04, top: getHeight() * 0.0049),
            hintText: hint ?? "",
            alignLabelWithHint: false,
            hintStyle: TextStyle(
              color: AppColors.hintTextGreyColor,
              fontSize: sizes!.fontSize14,
              fontFamily: Assets.raleWayRegular,
            )),
      ),
    );
  }
}
