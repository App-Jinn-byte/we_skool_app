import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/screens/bottomTab/pages/notification/notification_components.dart';
import 'package:we_skool_app/screens/consultation_request/consultation_request_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';



class ConsultationRequest extends StatefulWidget {
  const ConsultationRequest({Key? key}) : super(key: key);

  @override
  _ConsultationRequestState createState() => _ConsultationRequestState();
}

class _ConsultationRequestState extends State<ConsultationRequest> {
  final ConsultationRequestComponents _consultationRequestComponents = ConsultationRequestComponents();
  TextEditingController? searchController;
  DateTime? slot1Date;
  DateTime? slot2Date;
  DateTime? slot3Date;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  List <String> genderList = ['Male','Female'];
  String? _genderSelection;

  void updateTypeGender(String value){
    setState(() {
      _genderSelection = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: sizes!.height,
            width: sizes!.width,
            color: AppColors.pureWhiteColor,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidgets.appBarIconImageText(
                      text: "Consultation Requests",
                      image: "",
                      onPressMenu: () {
                        Navigator.pop(context);
                      },
                      isDataFetched: false),
                  Container(
                    height: sizes!.height * 0.85,
                    margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.lightBackground), fit: BoxFit.fill
                        )),
                    child: Column(
                      children: [
                        SizedBox(height: getHeight() * 0.03),
                        CommonWidgets.searchField(textEditingController: searchController),
                        SizedBox(height: getHeight() * 0.03),
                        Container(
                          height: getHeight() * 0.41,
                          width: getWidth(),
                          padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.shadow, blurRadius: 2, offset: Offset(0, 0))
                            ],
                            color: AppColors.pureWhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(getHeight() * .02)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView.size14Text("Consultation Type",
                                  color: AppColors.blackLight,
                                  fontFamily: Assets.raleWaySemiBold,
                                  fontWeight: FontWeight.w600),
                              // SizedBox(height: getHeight() * 0.02),
                              _consultationRequestComponents.dropDown(
                                  selectedCategory: _genderSelection,
                                  updateSelectedCategory: updateTypeGender,
                                  categories: genderList,
                                  hint: "Select Consultation Type"
                              ),
                              Divider(height: getHeight() * 0.001, thickness: getHeight() * 0.001, color: AppColors.dividerColor),
                              SizedBox(height: getHeight() * 0.015),
                              TextView.size14Text("Time Slot 1",
                                  color: AppColors.blackLight,
                                  fontFamily: Assets.raleWaySemiBold,
                                  fontWeight: FontWeight.w600
                              ),
                              SizedBox(height: getHeight() * 0.015),
                              _consultationRequestComponents.getDateField(
                                  date: slot1Date != null
                                      ? "${slot1Date!.day}/${slot1Date!.month}/${slot1Date!.year}"
                                      : "Select Date",
                                  onPressDate: () {
                                    _selectDateSlot1(context);
                                  }
                              ),
                              SizedBox(height: getHeight() * 0.01),
                              Divider(height: getHeight() * 0.01, thickness: getHeight() * 0.001, color: AppColors.dividerColor),
                              SizedBox(height: getHeight() * 0.01),
                              TextView.size14Text("Time Slot 2",
                                  color: AppColors.blackLight,
                                  fontFamily: Assets.raleWaySemiBold,
                                  fontWeight: FontWeight.w600
                              ),
                              SizedBox(height: getHeight() * 0.015),
                              _consultationRequestComponents.getDateField(
                                  date: slot2Date != null
                                      ? "${slot2Date!.day}/${slot2Date!.month}/${slot2Date!.year}"
                                      : "Select Date",
                                  onPressDate: () {
                                    _selectDateSlot1(context);
                                  }
                              ),
                              SizedBox(height: getHeight() * 0.01),
                              Divider(height: getHeight() * 0.01, thickness: getHeight() * 0.001, color: AppColors.dividerColor),
                              SizedBox(height: getHeight() * 0.01),
                              TextView.size14Text("Time Slot 3",
                                  color: AppColors.blackLight,
                                  fontFamily: Assets.raleWaySemiBold,
                                  fontWeight: FontWeight.w600
                              ),
                              SizedBox(height: getHeight() * 0.015),
                              _consultationRequestComponents.getDateField(
                                  date: slot3Date != null
                                      ? "${slot3Date!.day}/${slot3Date!.month}/${slot3Date!.year}"
                                      : "Select Date",
                                  onPressDate: () {
                                    _selectDateSlot1(context);
                                  }
                              ),
                              SizedBox(height: getHeight() * 0.01),
                              // Divider(height: getHeight() * 0.01, thickness: getHeight() * 0.001, color: AppColors.dividerColor),
                            ],
                          ),
                        ),
                        SizedBox(height: getHeight() * 0.08),
                        CommonWidgets.getButton(
                          height: getHeight()*0.06,
                            text: "Book Consultation",
                            fontSize: sizes!.fontSize14,
                            fontFamily: Assets.raleWaySemiBold,
                            fontWeight: FontWeight.w600,
                            onPress: () {

                        })
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
  Future<void> _selectDateSlot1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
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
    if (picked != null && picked != slot1Date) {
      setState(() {
        slot1Date = picked;
      });
    }
  }

  Future<void> _selectDateSlot2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
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
    if (picked != null && picked != slot2Date) {
      setState(() {
        slot2Date = picked;
      });
    }
  }

  Future<void> _selectDateSlot3(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
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
    if (picked != null && picked != slot3Date) {
      setState(() {
        slot3Date = picked;
      });
    }
  }
}
