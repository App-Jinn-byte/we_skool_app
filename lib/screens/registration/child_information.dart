import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/registration/child_information_provider.dart';
import 'package:we_skool_app/screens/registration/parent_gaurdian.dart';
import 'package:we_skool_app/screens/registration/registration_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import '../../res/colors.dart';
import 'package:we_skool_app/res/toasts.dart';

class ChildInformation extends StatefulWidget {
  const ChildInformation({Key? key}) : super(key: key);

  @override
  _ChildInformationState createState() => _ChildInformationState();
}

class _ChildInformationState extends State<ChildInformation> {
  final RegistrationComponents _registrationComponents = RegistrationComponents();
  ChildInformationProvider _childInformationProvider = ChildInformationProvider();
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? streetAddressController;
  DateTime? dateOfBirth;
  List <String> genderList = ['Unknown (Child not born yet)','Female','Male', 'Non-Binary','Prefer not to be disclosed'];
  String? _genderSelection;
  String? _countrySelection;
  String? _stateSelection;
  String? _citySelection;

  void updateTypeGender(String value){
    setState(() {
      _genderSelection = value;
    });
  }
  void updateCountry(String value){
    setState(() {
      _countrySelection = value;
    });
  }
  void updateState(String value){
    setState(() {
      _stateSelection = value;
    });
  }
  void updateCity(String value){
    setState(() {
      _citySelection = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _childInformationProvider = Provider.of<ChildInformationProvider>(context, listen: false);
    _childInformationProvider.init(context: context);
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    streetAddressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ChildInformationProvider>(context, listen: true);
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
                      SizedBox(height: getHeight() * 0.02),
                      CommonWidgets.customBackButton(onPress: () {
                        Navigator.pop(context);
                      }),
                      SizedBox(height: getHeight() * 0.01),
                      _registrationComponents.percentageBar(
                          box1Color: AppColors.yellowColor,
                          box2Color: AppColors.veryLightBLue,
                          box3Color:AppColors.veryLightBLue,
                          text1Color: AppColors.pureWhiteColor,
                          text2Color: AppColors.greyColor,
                          text3Color: AppColors.greyColor,
                          bar1Color: AppColors.veryLightBLue,
                          bar2Color: AppColors.veryLightBLue
                      ),
                      SizedBox(height: getHeight() * 0.01),
                      TextView.size26Text("Child Information",
                          color: AppColors.blackTextColor,
                          fontFamily: Assets.raleWayBold,
                          fontWeight: FontWeight.w700),
                      SizedBox(height: getHeight() * 0.02),
                      CommonWidgets.textField(
                        textEditingController: firstNameController,
                        hint: "First Name",
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: getHeight() * 0.02),
                      CommonWidgets.textField(
                        textEditingController: lastNameController,
                        hint: "Last Name",
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: getHeight() * 0.02),
                      CommonWidgets.getDateField(
                          date: dateOfBirth != null
                              ? "${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}"
                              : "Please select Date",
                          onPressDate: () {
                            _selectStartDate(context);
                          }),
                      SizedBox(height: getHeight() * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonWidgets.dropDown(
                              width: getWidth() * 0.42,
                              selectedCategory: _genderSelection,
                              updateSelectedCategory: updateTypeGender,
                              categories: genderList,
                              hint: "Gender"),
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
                                hint: Text("Country" ?? '',
                                  style: TextStyle(
                                    color: AppColors.hintTextGreyColor,
                                    fontSize: sizes!.fontSize14,
                                    fontFamily:Assets.raleWayRegular,
                                  ),
                                ),
                                value: _countrySelection,
                                isExpanded: true,
                                icon: Icon(Icons.keyboard_arrow_down,color: AppColors.hintTextGreyColor,size: getHeight()*.035,),
                                underline:const SizedBox(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _stateSelection = null;
                                    _citySelection = null;
                                    updateCountry(newValue);
                                  });
                                  _childInformationProvider.stateApiHit(countryId: newValue);
                                },
                                items: _childInformationProvider.countriesList.map((item) =>
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
                        ],
                      ),
                      SizedBox(height: getHeight() * 0.03),
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
                                hint: Text("Select State" ?? '',
                                  style: TextStyle(
                                    color: AppColors.hintTextGreyColor,
                                    fontSize: sizes!.fontSize14,
                                    fontFamily:Assets.raleWayRegular,
                                  ),
                                ),
                                value: _stateSelection,
                                isExpanded: true,
                                icon: Icon(Icons.keyboard_arrow_down,color: AppColors.hintTextGreyColor,size: getHeight()*.035,),
                                underline:const SizedBox(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _citySelection = null;
                                    updateState(newValue);
                                  });
                                  _childInformationProvider.cityApiHit(stateId: newValue);
                                },
                                items: _childInformationProvider.statesList.map((item) =>
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
                              selectedCategory: _citySelection,
                              updateSelectedCategory: updateCity,
                              categories: _childInformationProvider.citiesList,
                              hint: "Select City"),
                        ],
                      ),

                      SizedBox(height: getHeight() * 0.02),
                      CommonWidgets.textField(
                        textEditingController: streetAddressController,
                        hint: "Street Address",
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: getHeight() * 0.14),
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
                  )
                ),
              ),
                // Positioned(
                //   bottom: getHeight() * 0.02,
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                //       child: CommonWidgets.getButton(
                //           onPress: () {
                //             print(_countrySelection);
                //             print(_stateSelection);
                //             print(_citySelection);
                //             // navigateToNextScreen();
                //           },
                //           width: getWidth()* 0.9,
                //           btnColor: AppColors.pinkColor,
                //           text: "Next",
                //           fontWeight: FontWeight.w600,
                //           textColor: AppColors.pureWhiteColor,
                //           fontFamily: Assets.raleWaySemiBold),
                //     ),)
              ]
            )),
      ),
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      // firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      firstDate: DateTime(2000),
      lastDate: DateTime(DateTime.now().year + 20),
      helpText: 'Select date',
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
    if (picked != null && picked != dateOfBirth) {
      setState(() {
        dateOfBirth = picked;
      });
    }
  }
  void navigateToNextScreen() async{
    if(firstNameController!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter first name");
    }
    else if(lastNameController!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter last name");
    }
    else if(dateOfBirth == null){
      Toasts.getErrorToast(text: "Please select date of birth");
    }
    else if(_genderSelection == null){
      Toasts.getErrorToast(text: "Please select gender");
    }
    else if(_countrySelection == null){
      Toasts.getErrorToast(text: "Please select country");
    }
    else if(_stateSelection == null){
      Toasts.getErrorToast(text: "Please select state");
    }
    else if(_citySelection == null){
      Toasts.getErrorToast(text: "Please select city");
    }
    else if(streetAddressController!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter street address");
    }
    else{
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => ParentGuardian(
            firstName: firstNameController!.text.trim(),
            lastName: lastNameController!.text.trim(),
            dateOfBirth: dateOfBirth.toString(),
            gender: _genderSelection,
            country: _countrySelection,
            state: _stateSelection,
            city: _citySelection,
            address: streetAddressController!.text.trim(),
          )));
    }
  }


}
