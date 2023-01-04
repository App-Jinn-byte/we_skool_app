
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/registration/parent_guardian_provider.dart';
import 'package:we_skool_app/screens/registration/registration_components.dart';
import 'package:we_skool_app/screens/registration/select_program.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import 'package:we_skool_app/res/toasts.dart';
import '../../res/colors.dart';

class ParentGuardian extends StatefulWidget {
  final String? firstName, lastName, dateOfBirth, gender, country, state, city, address;

  const ParentGuardian({Key? key,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.country,
    this.state,
    this.city,
    this.address
  }) : super(key: key);

  @override
  _ParentGuardianState createState() => _ParentGuardianState();
}

class _ParentGuardianState extends State<ParentGuardian> {
  final RegistrationComponents _registrationComponents = RegistrationComponents();
  late ParentGuardianProvider _guardianProvider;
  TextEditingController? firstNameParent1;
  TextEditingController? lastNameParent1;
  TextEditingController? relationshipParent1;
  TextEditingController? emailParent1;
  TextEditingController? phoneParent1;
  TextEditingController? countryParent1;
  TextEditingController? stateParent1;
  bool onCheck = true;
  bool isOpened = false;
  TextEditingController? firstNameParent2;
  TextEditingController? lastNameParent2;
  TextEditingController? relationshipParent2;
  TextEditingController? emailParent2;
  TextEditingController? phoneParent2;
  TextEditingController? addressParent2;
  String? _countrySelected;
  String? _stateSelected;
  String? _citySelected;

  void updateCountry(String value){
    setState(() {
      _countrySelected = value;
    });
  }
  void updateState(String value){
    setState(() {
      _stateSelected = value;
    });
  }
  void updateCity(String value){
    setState(() {
      _citySelected = value;
    });
  }


  @override
  void initState() {
    super.initState();
    _guardianProvider = ParentGuardianProvider();
    _guardianProvider = Provider.of<ParentGuardianProvider>(context, listen: false);
    _guardianProvider.init(context: context);
    firstNameParent1 = TextEditingController();
    lastNameParent1 = TextEditingController();
    relationshipParent1 = TextEditingController();
    emailParent1 = TextEditingController();
    phoneParent1 = TextEditingController();
    countryParent1 = TextEditingController();
    stateParent1 = TextEditingController();
    firstNameParent2 = TextEditingController();
    lastNameParent2 = TextEditingController();
    relationshipParent2 = TextEditingController();
    emailParent2 = TextEditingController();
    phoneParent2 = TextEditingController();
    addressParent2 = TextEditingController();
    isOpened = false;
    print(widget.firstName);
    print(widget.lastName);
    print(widget.dateOfBirth);
    print(widget.gender);
    print(widget.country);
    print(widget.state);
    print(widget.city);
    print(widget.address);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ParentGuardianProvider>(context, listen: true);
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
                          _registrationComponents.percentageBar(
                              box1Color: AppColors.yellowColor,
                              box2Color: AppColors.yellowColor,
                              box3Color:AppColors.veryLightBLue,
                              text1Color: AppColors.pureWhiteColor,
                              text2Color: AppColors.pureWhiteColor,
                              text3Color: AppColors.greyColor,
                              bar1Color: AppColors.yellowColor,
                              bar2Color: AppColors.veryLightBLue
                          ),
                          SizedBox(height: getHeight() * 0.01),
                          TextView.size26Text("Parent Guardian # 1",
                              color: AppColors.blackTextColor,
                              fontFamily: Assets.raleWayBold,
                              fontWeight: FontWeight.w700),
                          SizedBox(height: getHeight() * 0.02),
                          CommonWidgets.textField(
                            textEditingController: firstNameParent1,
                            hint: "First Name",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          CommonWidgets.textField(
                            textEditingController: lastNameParent1,
                            hint: "Last Name",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          CommonWidgets.textField(
                            textEditingController: relationshipParent1,
                            hint: "Relationship",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          CommonWidgets.textField(
                            textEditingController: emailParent1,
                            hint: "Enter Your Email",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          CommonWidgets.textField(
                            textEditingController: phoneParent1,
                            hint: "Phone",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          GestureDetector(
                            onTap: () {
                              // openSheet(getHeight() * 0.7);
                              setState(() {
                                isOpened = !isOpened;
                              });
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                  isOpened == true ?
                                  Icons.keyboard_arrow_up: Icons.keyboard_arrow_down_sharp, size: getHeight() * 0.04, color: AppColors.pinkColor),
                            ),
                          ),
                          isOpened ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView.size26Text("Parent Guardian # 2",
                                  color: AppColors.blackTextColor,
                                  fontFamily: Assets.raleWayBold,
                                  fontWeight: FontWeight.w700),
                              SizedBox(height: getHeight() * 0.03),
                              CommonWidgets.textField(
                                textEditingController: firstNameParent2,
                                hint: "Full Name",
                                textInputType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: getHeight() * 0.02),
                              CommonWidgets.textField(
                                textEditingController: lastNameParent2,
                                hint: "Last Name",
                                textInputType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: getHeight() * 0.02),
                              CommonWidgets.textField(
                                textEditingController: relationshipParent2,
                                hint: "Relationship",
                                textInputType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: getHeight() * 0.02),
                              CommonWidgets.textField(
                                textEditingController: emailParent2,
                                hint: "Enter Your Email",
                                textInputType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: getHeight() * 0.02),
                              CommonWidgets.textField(
                                textEditingController: phoneParent2,
                                hint: "Phone",
                                textInputType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: getHeight() * 0.02),
                              Row(
                                children: [
                                  SizedBox(width: getWidth() * 0.02),
                                  SizedBox(
                                    height: getHeight() * 0.02,
                                    width: getWidth() * 0.02,
                                    child: Checkbox(
                                      shape: const CircleBorder(),
                                      checkColor: Colors.white,
                                      activeColor: AppColors.yellowColor,
                                      value: onCheck,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          onCheck = value!;
                                        });
                                        // _childInformationProvider.countriesApiHit();
                                      },
                                    ),
                                  ),
                                  SizedBox(width: getWidth() * 0.02),
                                  TextView.size14Text("Is Parent/Guardian #2 address same as child's?",
                                      lines: 2, color: AppColors.greyTextColor, fontFamily: Assets.raleWayLight, fontWeight: FontWeight.w300),
                                ],
                              ),
                              onCheck ?
                              Container():
                              Column(
                                children: [
                                  SizedBox(height: getHeight() * 0.02),
                                  Container(
                                    height: sizes!.height * 0.07,
                                    padding: EdgeInsets.symmetric(horizontal: sizes!.width * 0.05),
                                    decoration: BoxDecoration(
                                        boxShadow:  const [
                                          BoxShadow(
                                            color: AppColors.shadow,
                                            blurRadius: 0,
                                            offset: Offset(0,3),
                                          )
                                        ],
                                        color: AppColors.pureWhiteColor,
                                        borderRadius: BorderRadius.all(Radius.circular(getHeight() * .01))),
                                    child: ButtonTheme(
                                      child: DropdownButton <dynamic>(
                                        hint: Text("Country" ?? '',
                                          style: TextStyle(
                                            color: AppColors.hintTextGreyColor,
                                            fontSize: sizes!.fontSize14,
                                            fontFamily:Assets.raleWayRegular,
                                          ),
                                        ),
                                        value: _countrySelected,
                                        isExpanded: true,
                                        icon: Icon(Icons.keyboard_arrow_down,color: AppColors.hintTextGreyColor,size: getHeight()*.035,),
                                        underline:const SizedBox(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _stateSelected = null;
                                            _citySelected = null;
                                            updateCountry(newValue);
                                          });
                                          _guardianProvider.stateApiHit(countryId: newValue);
                                        },
                                        items: _guardianProvider.countriesList.map((item) =>
                                            DropdownMenuItem(
                                                value: item.id.toString(),
                                                child: Text(item.name!,
                                                  style: TextStyle(
                                                    color: AppColors.blackTextColor,
                                                    fontFamily: Assets.raleWayRegular,
                                                    fontSize: sizes!.fontSize14,
                                                  ),)
                                            )
                                        ).toList(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: getHeight() * 0.02),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: sizes!.height * 0.07,
                                        width: getWidth() * 0.42,
                                        padding: EdgeInsets.symmetric(horizontal: sizes!.width * 0.05),
                                        decoration: BoxDecoration(
                                            boxShadow:  const [
                                              BoxShadow(
                                                color: AppColors.shadow,
                                                blurRadius: 0,
                                                offset: Offset(0,3),
                                              )
                                            ],
                                            color: AppColors.pureWhiteColor,
                                            borderRadius: BorderRadius.all(Radius.circular(getHeight() * .01))),
                                        child: ButtonTheme(
                                          child: DropdownButton <dynamic>(
                                            hint: Text("State" ?? '',
                                              style: TextStyle(
                                                color: AppColors.hintTextGreyColor,
                                                fontSize: sizes!.fontSize14,
                                                fontFamily:Assets.raleWayRegular,
                                              ),
                                            ),
                                            value: _stateSelected,
                                            isExpanded: true,
                                            icon: Icon(Icons.keyboard_arrow_down,color: AppColors.hintTextGreyColor,size: getHeight()*.035,),
                                            underline:const SizedBox(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _citySelected = null;
                                                updateState(newValue);
                                              });
                                              _guardianProvider.cityApiHit(stateId: newValue);
                                            },
                                            items: _guardianProvider.statesList.map((item) =>
                                                DropdownMenuItem(
                                                    value: item.id.toString(),
                                                    child: Text(item.name!,
                                                      style: TextStyle(
                                                        color: AppColors.blackTextColor,
                                                        fontFamily: Assets.raleWayRegular,
                                                        fontSize: sizes!.fontSize14,
                                                      ),)
                                                )
                                            ).toList(),
                                          ),
                                        ),
                                      ),
                                      CommonWidgets.dropDownForApiList(
                                          width: getWidth() * 0.42,
                                          selectedCategory: _citySelected,
                                          updateSelectedCategory: updateCity,
                                          categories: _guardianProvider.citiesList,
                                          hint: "City"),
                                    ],
                                  ),
                                  SizedBox(height: getHeight() * 0.02),
                                  CommonWidgets.textField(
                                    textEditingController: addressParent2,
                                    hint: "Street Address",
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(height: getHeight() * 0.01),
                                ],
                              ),
                            ],
                          ): Container(),
                          SizedBox(height: isOpened ? getHeight() * 0.04: getHeight() * 0.15),
                          CommonWidgets.getButton(
                              onPress: () {
                                navigateToNextScreen();
                              },
                              width: getWidth()* 0.9,
                              btnColor: AppColors.pinkColor,
                              text: "Next",
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.pureWhiteColor,
                              fontFamily: Assets.raleWaySemiBold),
                          SizedBox(height: getHeight() * 0.02),
                        ],
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: getHeight() * 0.02,
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                  //     child: CommonWidgets.getButton(
                  //         onPress: () {
                  //           navigateToNextScreen();
                  //         },
                  //         width: getWidth()* 0.9,
                  //         btnColor: AppColors.pinkColor,
                  //         text: "Next",
                  //         fontWeight: FontWeight.w600,
                  //         textColor: AppColors.pureWhiteColor,
                  //         fontFamily: Assets.raleWaySemiBold),
                  //   ),)
                ]
            )),
      ),
    );
  }

  // void openSheet(double height) {
  //
  //   // setState(() {
  //   //   BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10));
  //   // });
  //
  //   showModalBottomSheet(
  //     //barrierColor: Colors.black.withOpacity(0.5),
  //     context: context,
  //     isScrollControlled: true,
  //     isDismissible: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => Container(
  //       padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //       child: SingleChildScrollView(
  //         child: Container(
  //           //margin: EdgeInsets.only(top: sizes!.heightRatio * 58.74),
  //           padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
  //           height: sizes!.height * 0.85,
  //           decoration:  const BoxDecoration(
  //             image: DecorationImage(
  //                 image: AssetImage(Assets.backGroundImage), fit: BoxFit.fill),
  //             // borderRadius: BorderRadius.only(
  //             //   topLeft: Radius.circular(getHeight() * 0.02),
  //             //   topRight: Radius.circular(getHeight() * 0.02),
  //             // ),
  //           ),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               SizedBox(
  //                 height: sizes!.heightRatio * 10,
  //               ),
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                   },
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.end,
  //                     children: [
  //                       Container(
  //                         height: getHeight() * 0.019,
  //                         width: getWidth() * 0.035,
  //                         padding: EdgeInsets.only(top: getHeight() * 0.06),
  //                         decoration: const BoxDecoration(
  //                           image: DecorationImage(
  //                               image: AssetImage(Assets.crossIcon),
  //                               fit: BoxFit.fill
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   )),
  //               SizedBox(
  //                 height: sizes!.heightRatio * 10,
  //               ),
  //               TextView.size26Text("Parent Guardian # 2",
  //                   color: AppColors.blackTextColor,
  //                   fontFamily: Assets.raleWayBold,
  //                   fontWeight: FontWeight.w700),
  //               SizedBox(height: getHeight() * 0.03),
  //               CommonWidgets.textField(
  //                 textEditingController: firstNameParent2,
  //                 hint: "Full Name",
  //                 textInputType: TextInputType.emailAddress,
  //               ),
  //               SizedBox(height: getHeight() * 0.02),
  //               CommonWidgets.textField(
  //                 textEditingController: relationshipParent2,
  //                 hint: "Relationship",
  //                 textInputType: TextInputType.emailAddress,
  //               ),
  //               SizedBox(height: getHeight() * 0.02),
  //               CommonWidgets.textField(
  //                 textEditingController: emailParent2,
  //                 hint: "Enter Your Email",
  //                 textInputType: TextInputType.emailAddress,
  //               ),
  //               SizedBox(height: getHeight() * 0.02),
  //               CommonWidgets.textField(
  //                 textEditingController: phoneParent2,
  //                 hint: "Phone",
  //                 textInputType: TextInputType.emailAddress,
  //               ),
  //               SizedBox(height: getHeight() * 0.02),
  //               CommonWidgets.textField(
  //                 textEditingController: countryParent2,
  //                 hint: "Country",
  //                 textInputType: TextInputType.emailAddress,
  //               ),
  //               SizedBox(height: getHeight() * 0.02),
  //               CommonWidgets.textField(
  //                 textEditingController: stateParent2,
  //                 hint: "Add State",
  //                 textInputType: TextInputType.emailAddress,
  //               ),
  //               SizedBox(height: getHeight() * 0.09),
  //               CommonWidgets.getButton(
  //                   onPress: () {
  //                     Navigator.pop(context);
  //                   },
  //                   btnColor: AppColors.pinkColor,
  //                   text: "Next",
  //                   fontWeight: FontWeight.w600,
  //                   textColor: AppColors.pureWhiteColor,
  //                   fontFamily: Assets.raleWaySemiBold),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  void navigateToNextScreen() async{
    if(firstNameParent1!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter first name");
    }
    else if(lastNameParent1!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter last name");
    }
    else if(relationshipParent1!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter relationship");
    }
    else if(emailParent1!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter an email");
    }
    else if(phoneParent1!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter phone number");
    }
    else{
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => SelectProgram(
            firstName: widget.firstName,
            lastName: widget.lastName,
            dateOfBirth: widget.dateOfBirth,
            gender: widget.gender,
            childCountry: widget.country,
            childState: widget.state,
            childCity: widget.city,
            childAddress: widget.address,
            firstNameParent1: firstNameParent1!.text.trim(),
            lastNameParent1: lastNameParent1!.text.trim(),
            relationShipParent1: relationshipParent1!.text.trim(),
            emailParent1: emailParent1!.text.trim(),
            phoneParent1: phoneParent1!.text.trim(),
            firstNameParent2: firstNameParent2!.text.trim(),
            lastNameParent2: lastNameParent2!.text.trim(),
            relationshipParent2: relationshipParent2!.text.trim(),
            emailParent2: emailParent2!.text.trim(),
            phoneParent2: phoneParent2!.text.trim(),
            countryParent2: onCheck ? widget.country: _countrySelected,
            stateParent2: onCheck ? widget.state: _stateSelected,
            cityParent2: onCheck ? widget.city: _citySelected,
            addressParent2: onCheck ? widget.address: addressParent2!.text.trim(),
          )));
    }
  }
}
