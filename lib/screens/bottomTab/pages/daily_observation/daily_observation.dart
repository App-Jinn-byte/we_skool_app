import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/screens/bottomTab/pages/daily_observation/daily_observation_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import 'package:we_skool_app/screens/bottomTab/pages/daily_observation/daily_observation_provider.dart';
import 'package:we_skool_app/res/toasts.dart';

class DailyObservation extends StatefulWidget {
  String? from;

  DailyObservation({super.key, @required this.from});

  @override
  _DailyObservationState createState() => _DailyObservationState();
}

class _DailyObservationState extends State<DailyObservation>
    with SingleTickerProviderStateMixin {
  final DailyObservationComponents _dailyObservationComponents = DailyObservationComponents();
  DailyObservationProvider _dailyObservationProvider = DailyObservationProvider();
  TextEditingController? activityNameController;
  TextEditingController? materialPresentedController;
  TextEditingController? childQuoteController;
  TextEditingController? additionalNotesController;
  TextEditingController? sleepSessionsController;
  TextEditingController? snacksController;
  TextEditingController? diaperingController;
  TextEditingController? medicationController;
  TextEditingController? additionalController;
  DateTime? observationDate;
  DateTime? notesDate;
  final TimeOfDay _timeOfDay = TimeOfDay.now();
  String? _sleepStartTime;
  String? _sleepEndTime;
  String? _mealStartTime;
  String? _mealEndTime;
  String? _diaperStartTime;
  String? _medicationStartTime;
  String? _additionalStartTime;
  String? _additionalEndTime;

  @override
  void initState() {
    super.initState();
    _dailyObservationProvider = Provider.of<DailyObservationProvider>(context, listen: false);
    _dailyObservationProvider.init(context: context);
    activityNameController = TextEditingController();
    materialPresentedController = TextEditingController();
    childQuoteController = TextEditingController();
    additionalNotesController = TextEditingController();
    sleepSessionsController = TextEditingController();
    snacksController = TextEditingController();
    diaperingController = TextEditingController();
    medicationController = TextEditingController();
    additionalController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Container(
              height: sizes!.height,
              width: sizes!.width,
              color: AppColors.pureWhiteColor,
              // padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.from == "home"
                        ? CommonWidgets.appBarIconImageText(
                            text: "Daily Observation",
                            image: "",
                            onPressMenu: () {
                              Navigator.pop(context);
                            },
                            isDataFetched: false)
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth() * 0.05),
                            child: CommonWidgets.appBarTextImage(
                                text: "Daily Observation",
                                image: "",
                                isDataFetched: false),
                          ),
                    Container(
                      height: sizes!.height * 0.8,
                      padding:
                          EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.lightBackground),
                              fit: BoxFit.fill)),
                      child: Column(
                       // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: getHeight() * 0.02),
                          ButtonsTabBar(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: getWidth() * 0.090),
                            unselectedBorderColor: AppColors.greyColor,
                            borderWidth: 1,
                            height: getHeight() * 0.045,
                            labelStyle: const TextStyle(
                                color: AppColors.pureWhiteColor,
                                fontFamily: Assets.raleWaySemiBold,
                                fontWeight: FontWeight.w600),
                            unselectedLabelStyle: const TextStyle(
                                color: AppColors.greyColor,
                                fontFamily: Assets.raleWaySemiBold,
                                fontWeight: FontWeight.w600),
                            backgroundColor: AppColors.redColor,
                            unselectedBackgroundColor: AppColors.pureWhiteColor,
                            borderColor: AppColors.pinkColor,
                            buttonMargin: EdgeInsets.symmetric(
                                horizontal: getWidth() * 0.015),
                            tabs: const [
                              Tab(
                                text: 'Observations',
                              ),
                              Tab(
                                text: '      Notes      ',
                              ),
                            ],
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          Expanded(
                              child: TabBarView(
                            children: [
                              ScrollConfiguration(
                                behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
                                child: ListView(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [

                                        Padding(
                                          padding:  EdgeInsets.only(left: getWidth()*0.002),
                                          child: _dailyObservationComponents
                                              .getDateField(
                                                  date: observationDate != null
                                                      ? "${observationDate!.day}/${observationDate!.month}/${observationDate!.year}"
                                                      : "DD/MM/YY",
                                                  onPressDate: () {
                                                    _selectObservationDate(
                                                        context);
                                                  }),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: getWidth() * 0.023),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: getHeight() * 0.02),
                                              TextView.size14Text(
                                                  "Name of activity",
                                                  color: AppColors.blackLight,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      Assets.raleWaySemiBold),
                                              SizedBox(
                                                  height: getHeight() * 0.02),
                                              _dailyObservationComponents
                                                  .textField(
                                                      textEditingController:
                                                          activityNameController),
                                              SizedBox(
                                                  height: getHeight() * 0.02),
                                              TextView.size14Text(
                                                  "Materials presented by",
                                                  color: AppColors.blackLight,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      Assets.raleWaySemiBold),
                                              SizedBox(
                                                  height: getHeight() * 0.02),
                                              _dailyObservationComponents.textField(
                                                  textEditingController:
                                                      materialPresentedController),
                                              SizedBox(
                                                  height: getHeight() * 0.02),
                                              TextView.size14Text(
                                                  "Child's quotes & questions (if applicable)",
                                                  color: AppColors.blackLight,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      Assets.raleWaySemiBold),
                                              SizedBox(
                                                  height: getHeight() * 0.02),
                                              _dailyObservationComponents
                                                  .textField(
                                                      textEditingController:
                                                          childQuoteController),
                                              SizedBox(
                                                  height: getHeight() * 0.02),
                                              TextView.size14Text(
                                                  "Additional notes",
                                                  color: AppColors.blackLight,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      Assets.raleWaySemiBold),
                                              SizedBox(
                                                  height: getHeight() * 0.02),
                                              _dailyObservationComponents.textField(
                                                  textEditingController:
                                                      additionalNotesController),
                                              SizedBox(
                                                  height: getHeight() * 0.02),
                                              _dailyObservationComponents
                                                  .buttonRow(
                                                      onPressCancel: () {
                                                        makeObservationControllersEmpty();
                                                      },
                                                      onPressSave: () {
                                                        callDailyObservationApi(isSubmit: false);
                                                      },
                                                      onPressSubmit: () {
                                                        callDailyObservationApi(isSubmit: true);
                                                      }),
                                              SizedBox(
                                                  height: getHeight() * 0.04),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ScrollConfiguration(
                                behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
                                child: ListView(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                           padding:  EdgeInsets.only(left: getWidth()*0.002),
                                          child: _dailyObservationComponents
                                              .getDateField(
                                                  date: notesDate != null
                                                      ? "${notesDate!.day}/${notesDate!.month}/${notesDate!.year}"
                                                      : "DD/MM/YY",
                                                  onPressDate: () {
                                                    _selectNotesDate(context);
                                                  }),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: getWidth() * 0.023),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: getHeight() * 0.02),
                                              _dailyObservationComponents.getHeadingAndTime(
                                                  text: "Sleep Sessions",
                                                  startTimeText: _sleepStartTime,
                                                  endTimeText: _sleepEndTime,
                                                  onPressStartTime: () {
                                                    sleepTimeStart();
                                                  },
                                                  onPressEndTime: () {
                                                    sleepTimeEnd();
                                                  }),
                                              SizedBox(height: getHeight() * 0.02),
                                              _dailyObservationComponents.textField(
                                                      textEditingController: sleepSessionsController),
                                              SizedBox(height: getHeight() * 0.02),
                                              _dailyObservationComponents.getHeadingAndTime(
                                                  text: "Meals/Snacks",
                                                  startTimeText: _mealStartTime,
                                                  endTimeText: _mealEndTime,
                                                  onPressStartTime: () {
                                                    mealTimeStart();
                                                  },
                                                  onPressEndTime: () {
                                                    mealTimeEnd();
                                                  }),
                                              SizedBox(height: getHeight() * 0.02),
                                              _dailyObservationComponents.textField(
                                                      textEditingController: snacksController),
                                              SizedBox(height: getHeight() * 0.02),

                                              _dailyObservationComponents.getHeadingSingleTime(
                                                  text: "Diapering/Toileting",
                                                  startTimeText: _diaperStartTime,
                                                  onPressStartTime: () {
                                                    diaperTimeStart();
                                                  }),
                                              SizedBox(height: getHeight() * 0.02),
                                              _dailyObservationComponents.textField(
                                                      textEditingController: diaperingController),
                                              SizedBox(height: getHeight() * 0.02),
                                              _dailyObservationComponents.getHeadingSingleTime(
                                                  text: "Medications",
                                                  startTimeText: _medicationStartTime,
                                                  onPressStartTime: () {
                                                    medicationTimeStart();
                                                  }),
                                              SizedBox(height: getHeight() * 0.02),
                                              _dailyObservationComponents.textField(
                                                      textEditingController: medicationController),
                                              SizedBox(height: getHeight() * 0.02),
                                              _dailyObservationComponents.getHeadingAndTime(
                                                  text: "Additional",
                                                  startTimeText: _additionalStartTime,
                                                  endTimeText: _additionalEndTime,
                                                  onPressStartTime: () {
                                                    additionalTimeStart();
                                                  },
                                                  onPressEndTime: () {
                                                    additionalTimeEnd();
                                                  }),
                                              SizedBox(height: getHeight() * 0.02),
                                              _dailyObservationComponents.textField(
                                                  textEditingController: additionalController),
                                              SizedBox(height: getHeight() * 0.02),
                                              _dailyObservationComponents
                                                  .notesButtonRow(
                                                      onPressCancel: () {
                                                        makeNotesControllersEmpty();
                                                      },
                                                      onPressSubmit: () {
                                                        callDailyNotesApi();
                                                      }),
                                              SizedBox(height: getHeight() * 0.04),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void makeObservationControllersEmpty() {
    setState(() {
      observationDate = null;
      activityNameController = TextEditingController(text: "");
      materialPresentedController = TextEditingController(text: "");
      childQuoteController = TextEditingController(text: "");
      additionalNotesController = TextEditingController(text: "");
    });
  }

  void makeNotesControllersEmpty() {
    setState(() {
      notesDate = null;
      sleepSessionsController = TextEditingController(text: "");
      snacksController = TextEditingController(text: "");
      diaperingController = TextEditingController(text: "");
      medicationController = TextEditingController(text: "");
      additionalController = TextEditingController(text: "");
      _sleepStartTime = null;
      _sleepEndTime = null;
      _mealStartTime = null;
      _mealEndTime = null;
      _diaperStartTime = null;
      _medicationStartTime = null;
      _additionalStartTime = null;
      _additionalEndTime = null;
    });
  }

  void callDailyObservationApi({required bool isSubmit}) async{
    if(observationDate == null){
      Toasts.getErrorToast(text: "Please select date");
    }
    else if(activityNameController!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter activity name");
    }
    else if(materialPresentedController!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter materials presented by");
    }
    else{
      await _dailyObservationProvider.addDailyObservationApi(
          date: observationDate.toString(),
          nameOfActivity: activityNameController!.text.trim(),
          materialsPresentedBy: materialPresentedController!.text.trim(),
          quotesAndQuestions: childQuoteController!.text.trim(),
          additionalNotes: additionalNotesController!.text.trim(),
          isSubmit: isSubmit);
    }
  }

  void callDailyNotesApi() async{
    if(notesDate == null){
      Toasts.getErrorToast(text: "Please select date");
    }
    else if(sleepSessionsController!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter sleep session");
    }
    else if(_sleepStartTime == null){
      Toasts.getErrorToast(text: "Please select sleep start time");
    }
    else if(_sleepEndTime == null){
      Toasts.getErrorToast(text: "Please select sleep end time");
    }
    else if(snacksController!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter meals");
    }
    else if(_mealStartTime == null){
      Toasts.getErrorToast(text: "Please select meal start time");
    }
    else if(_mealEndTime == null){
      Toasts.getErrorToast(text: "Please select meal end time");
    }
    else if(diaperingController!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter diapering");
    }
    else if(_diaperStartTime == null){
      Toasts.getErrorToast(text: "Please select toilet time");
    }
    else if(medicationController!.text.isEmpty){
      Toasts.getErrorToast(text: "Please enter medications");
    }
    else if(_medicationStartTime == null){
      Toasts.getErrorToast(text: "Please select medications time");
    }
    else{
      await _dailyObservationProvider.addDailyNotesApi(
          date: notesDate.toString(),
          sleepSession: '${sleepSessionsController!.text} from $_sleepStartTime to $_sleepEndTime',
          meals: '${snacksController!.text} from $_mealStartTime to $_mealEndTime',
          diaper: '${diaperingController!.text} at $_diaperStartTime',
          medications: '${medicationController!.text} at $_medicationStartTime',
          additional: '${additionalController!.text} from $_additionalStartTime to $_additionalEndTime'
      );
    }
  }

  Future<void> _selectObservationDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
    if (picked != null && picked != observationDate) {
      setState(() {
        observationDate = picked;
      });
    }
  }

  Future<void> _selectNotesDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
    if (picked != null && picked != notesDate) {
      setState(() {
        notesDate = picked;
      });
    }
  }

  Future<void> sleepTimeStart() async {
   final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
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
    if (picked != null) {
      setState(() {
      //  _timeOfDay = _picked;
        _sleepStartTime = picked.format(context);
        
      });
    }
  }

  Future<void> sleepTimeEnd() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
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
    if (picked != null) {
      setState(() {
        //  _timeOfDay = _picked;
        _sleepEndTime = picked.format(context);

      });
    }
  }

  Future<void> mealTimeStart() async {
   final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
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
    if (picked != null) {
      setState(() {
      //  _timeOfDay = _picked;
        _mealStartTime = picked.format(context);
        
      });
    }
  }

  Future<void> mealTimeEnd() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
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
    if (picked != null) {
      setState(() {
        //  _timeOfDay = _picked;
        _mealEndTime = picked.format(context);

      });
    }
  }

  Future<void> diaperTimeStart() async {
   final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
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
    if (picked != null) {
      setState(() {
      //  _timeOfDay = _picked;
        _diaperStartTime = picked.format(context);
        
      });
    }
  }

   Future<void> medicationTimeStart() async {
   final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
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
    if (picked != null) {
      setState(() {
      //  _timeOfDay = _picked;
        _medicationStartTime = picked.format(context);

      });
    }
  }

  Future<void> additionalTimeStart() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
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
    if (picked != null) {
      setState(() {
        _additionalStartTime = picked.format(context);

      });
    }
  }

  Future<void> additionalTimeEnd() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
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
    if (picked != null) {
      setState(() {
        _additionalEndTime = picked.format(context);

      });
    }
  }

}
