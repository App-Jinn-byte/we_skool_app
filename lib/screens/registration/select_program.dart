import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/registration/registration_components.dart';
import 'package:we_skool_app/screens/registration/select_program_provider.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import '../../res/colors.dart';
import 'package:we_skool_app/res/toasts.dart';

class SelectProgram extends StatefulWidget {
  final String? firstName, lastName, dateOfBirth, gender, childCountry, childState, childCity, childAddress,
  firstNameParent1, lastNameParent1, relationShipParent1, emailParent1, phoneParent1,
  firstNameParent2, lastNameParent2, relationshipParent2, emailParent2, phoneParent2, countryParent2, stateParent2, cityParent2, addressParent2;

  const SelectProgram({Key? key,
    this.firstName, this.lastName,
    this.dateOfBirth, this.gender,
    this.childCountry, this.childState,
    this.childCity, this.childAddress,
    this.firstNameParent1, this.lastNameParent1,
    this.relationShipParent1, this.emailParent1,
    this.phoneParent1, this.firstNameParent2,
    this.lastNameParent2, this.relationshipParent2,
    this.emailParent2, this.phoneParent2,
    this.countryParent2, this.stateParent2,
    this.cityParent2, this.addressParent2,
  }) : super(key: key);

  @override
  _SelectProgramState createState() => _SelectProgramState();
}

class _SelectProgramState extends State<SelectProgram> {
  final RegistrationComponents _registrationComponents = RegistrationComponents();
  SelectProgramProvider _selectProgramProvider = SelectProgramProvider();
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  DateTime? startDate;
  String? _programSelection;

  void updateTypeGender(String value){
    setState(() {
      _programSelection = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectProgramProvider = Provider.of<SelectProgramProvider>(context, listen: false);
    _selectProgramProvider.init(context: context);
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SelectProgramProvider>(context, listen: true);
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
                          SizedBox(height: getHeight() * 0.01),
                          _selectProgramProvider.isDataFetch ?
                          Column(
                            children: [
                              _registrationComponents.percentageBar(
                                  box1Color: AppColors.yellowColor,
                                  box2Color: AppColors.yellowColor,
                                  box3Color:AppColors.yellowColor,
                                  text1Color: AppColors.pureWhiteColor,
                                  text2Color: AppColors.pureWhiteColor,
                                  text3Color: AppColors.pureWhiteColor,
                                  bar1Color: AppColors.yellowColor,
                                  bar2Color: AppColors.yellowColor
                              ),
                              SizedBox(height: getHeight() * 0.02),
                              TextView.size26Text("Select Program",
                                  color: AppColors.blackTextColor,
                                  fontFamily: Assets.raleWayBold,
                                  fontWeight: FontWeight.w700),
                              SizedBox(height: getHeight() * 0.04),
                              CommonWidgets.dropDownForApiList(
                                  selectedCategory: _programSelection,
                                  updateSelectedCategory: updateTypeGender,
                                  categories: _selectProgramProvider.programsList,
                                  hint: "Select"),
                            ],
                          ): CommonWidgets.loading()

                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: getHeight() * 0.02,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                      child: CommonWidgets.getButton(
                          onPress: () {
                            navigateToNextScreen();
                          },
                          width: getWidth()* 0.9,
                          btnColor: AppColors.pinkColor,
                          text: "Sign Up",
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.pureWhiteColor,
                          fontFamily: Assets.raleWaySemiBold),
                    ),)
                ]
            )),
      ),
    );
  }

  void navigateToNextScreen() async{
    if(_programSelection == null){
      Toasts.getErrorToast(text: "Please select program");
    }
    else{
      await _selectProgramProvider.memberRegisterApi(
          childFirstName: widget.firstName,
          childLastName: widget.lastName,
          childDOB: widget.dateOfBirth,
          countryId: widget.childCountry,
          stateId: widget.childState,
          cityId: widget.childCity,
          address: widget.childAddress,
          gender: widget.gender,
          firstNameParent1: widget.firstNameParent1,
          lastNameParent1: widget.lastNameParent1,
          relationshipParent1: widget.relationShipParent1,
          emailParent1: widget.emailParent1,
          phoneParent1: widget.phoneParent1,
          firstNameParent2: widget.firstNameParent2,
          lastNameParent2: widget.lastNameParent2,
          relationshipParent2: widget.relationshipParent2,
          emailParent2: widget.emailParent2,
          phoneParent2: widget.phoneParent2,
          addressParent2: widget.addressParent2,
          countryIdParent2: widget.countryParent2,
          stateIdParent2: widget.stateParent2,
          cityIdParent2: widget.cityParent2,
          programId: _programSelection);
    }
  }
}
