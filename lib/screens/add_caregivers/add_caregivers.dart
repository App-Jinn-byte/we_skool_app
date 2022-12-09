import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/add_caregivers/add_caregivers_components.dart';

import '../../widgets/common_widgets.dart';

class AddCaregivers extends StatefulWidget {
  const AddCaregivers({super.key});

  @override
  State<AddCaregivers> createState() => _AddCaregiversState();
}

class _AddCaregiversState extends State<AddCaregivers> {
  final Addcaregiverscomponents _addcaregiverscomponents = Addcaregiverscomponents();
  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);

    return SafeArea(
        child: Scaffold(
      body: Container(
        height: sizes!.height,
        width: sizes!.width,
        color: AppColors.pureWhiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonWidgets.appBarIconImageText(
                  text: "Add Caregivers",
                  image: "",
                  isDataFetched: false,
                  onPressMenu: () {
                    Navigator.pop(context);
                  }),
              Container(
                height: sizes!.height * 0.85,
                margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.lightBackground),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  
                  children: [
                    SizedBox(height: getHeight()*0.03,),
                    _addcaregiverscomponents.myAddCaregiver(height: getHeight()*0.6),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
