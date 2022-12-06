import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/screens/bottomTab/pages/notification/notification_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';



class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TextEditingController? searchController;
  final NotificationComponents _notificationComponents = NotificationComponents();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: sizes!.height,
            width: sizes!.width,
            color: AppColors.pureWhiteColor,
            padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidgets.appBarTextImage(
                      text: "Notifications",
                      image: "",
                      isDataFetched: false),
                  Container(
                    height: sizes!.height * 0.8,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.lightBackground), fit: BoxFit.fill
                        )),
                    child: Column(
                      children: [
                        SizedBox(height: getHeight() * 0.03),
                        CommonWidgets.searchField(textEditingController: searchController),
                        SizedBox(height: getHeight() * 0.03),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 15,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    _notificationComponents.notificationTile(
                                        image: "",
                                        text: "Lorem Ipsum dolar sit amet, csit amit",
                                        isDataFetched: false),
                                    SizedBox(height: getHeight() * 0.02)
                                  ],
                                );
                              }
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
