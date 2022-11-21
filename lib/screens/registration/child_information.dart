import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/registration/parent_gaurdian.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import '../../res/colors.dart';


class ChildInformation extends StatefulWidget {
  const ChildInformation({Key? key}) : super(key: key);

  @override
  _ChildInformationState createState() => _ChildInformationState();
}

class _ChildInformationState extends State<ChildInformation> {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  DateTime? startDate;
  List <String> genderList = ['Male','Female'];
  String? _genderSelection;

  void updateTypeGender(String value){
    setState(() {
      _genderSelection = value;
    });
  }

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: sizes!.height,
            width: sizes!.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.backGroundImage), fit: BoxFit.fill),
            ),
            child: Stack(
              children: [
                Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getHeight() * 0.04),
                      CommonWidgets.customBackButton(onPress: () {
                        Navigator.pop(context);
                      }),
                      SizedBox(height: getHeight() * 0.05),
                      TextView.size26Text("Child Information",
                          color: AppColors.blackTextColor,
                          fontFamily: Assets.raleWayBold,
                          fontWeight: FontWeight.w700),
                      SizedBox(height: getHeight() * 0.04),
                      CommonWidgets.textField(
                        textEditingController: firstNameController,
                        hint: "First Name",
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: getHeight() * 0.03),
                      CommonWidgets.textField(
                        textEditingController: lastNameController,
                        hint: "Last Name",
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: getHeight() * 0.03),
                      CommonWidgets.getDateField(
                          date: startDate != null
                              ? "${startDate!.day}/${startDate!.month}/${startDate!.year}"
                              : "Please select Date",
                          onPressDate: () {
                            _selectStartDate(context);
                          }),
                      SizedBox(height: getHeight() * 0.03),
                      CommonWidgets.dropDown(
                          selectedCategory: _genderSelection,
                          updateSelectedCategory: updateTypeGender,
                          categories: genderList,
                          hint: "Gender"),

                    ],
                  ),
                ),
              ),
                Positioned(
                  bottom: getHeight() * 0.03,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                      child: CommonWidgets.getButton(
                          onPress: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const ParentGuardian()));
                          },
                          width: getWidth()* 0.9,
                          btnColor: AppColors.pinkColor,
                          text: "Next",
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.pureWhiteColor,
                          fontFamily: Assets.raleWaySemiBold),
                    ),)
              ]
            )),
      ),
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(DateTime.now().year + 20),
      helpText: 'Select booking date',
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(primary: AppColors.pinkColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            highlightColor: Colors.grey[400],
          ), // This will change to light theme.
          child: child!,
        );
      },
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }
}
