import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_skool_app/screens/bottomTab/bottom_tab_provider.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/res.dart';

class BottomTab extends StatefulWidget {
  final int pageIndex;

  const BottomTab({Key? key, required this.pageIndex}) : super(key: key);

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> with WidgetsBindingObserver {
  BottomTabProvider _bottomTabProvider = BottomTabProvider();

  @override
  void initState() {
    super.initState();
    _bottomTabProvider = Provider.of<BottomTabProvider>(context, listen: false);
    _bottomTabProvider.init(context: context, index: widget.pageIndex);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BottomTabProvider>(context, listen: true);
    return Scaffold(
      body: Container(
        child: _bottomTabProvider.screens[_bottomTabProvider.selectedIndex],
      ),
      bottomNavigationBar: SizedBox(
        height: getHeight() * .10,
        child: BottomNavigationBar(
          currentIndex: _bottomTabProvider.selectedIndex,
          backgroundColor: AppColors.pureWhiteColor,
          selectedItemColor: AppColors.yellowColor,
          unselectedItemColor: AppColors.greyColor,
          selectedLabelStyle: TextStyle(
            fontSize: sizes!.fontSize10,
            fontFamily: Assets.raleWaySemiBold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: sizes!.fontSize10,
            fontFamily: Assets.raleWaySemiBold,
          ),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _bottomTabProvider.setCurrentIndex = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(getHeight() * 0.008),
                  decoration: BoxDecoration(
                    color: _bottomTabProvider.selectedIndex == 0 ? AppColors.creamColor: AppColors.pureWhiteColor,
                    border: Border.all(color: _bottomTabProvider.selectedIndex == 0 ? AppColors.pinkColor.withOpacity(0.1): AppColors.pureWhiteColor, width: getWidth() * 0.005),
                    borderRadius: BorderRadius.circular(
                      getWidth() * .02,
                    ),
                  ),
                  child: Image.asset(
                    Assets.homeIcon,
                    height: 22,
                    width: 22,
                    color: _bottomTabProvider.selectedIndex == 0
                        ? AppColors.yellowColor
                        : AppColors.greyColor,
                  ),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(getHeight() * 0.008),
                  decoration: BoxDecoration(
                    color: _bottomTabProvider.selectedIndex == 1 ? AppColors.creamColor: AppColors.pureWhiteColor,
                    border: Border.all(color: _bottomTabProvider.selectedIndex == 1 ? AppColors.pinkColor.withOpacity(0.1): AppColors.pureWhiteColor, width: getWidth() * 0.005),
                    borderRadius: BorderRadius.circular(
                      getWidth() * .02,
                    ),
                  ),
                  child: Image.asset(
                    Assets.chatIcon,
                    height: 22,
                    width: 22,
                    color: _bottomTabProvider.selectedIndex == 1
                        ? AppColors.yellowColor
                        : AppColors.greyColor,
                  ),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(getHeight() * 0.008),
                  decoration: BoxDecoration(
                    color: _bottomTabProvider.selectedIndex == 2 ? AppColors.creamColor: AppColors.pureWhiteColor,
                    border: Border.all(color: _bottomTabProvider.selectedIndex == 2 ? AppColors.pinkColor.withOpacity(0.1): AppColors.pureWhiteColor, width: getWidth() * 0.005),
                    borderRadius: BorderRadius.circular(
                      getWidth() * .02,
                    ),
                  ),
                  child: Image.asset(
                    Assets.calendarIcon,
                    height: 22,
                    width: 22,
                    color: _bottomTabProvider.selectedIndex == 2
                        ? AppColors.yellowColor
                        : AppColors.greyColor,
                  ),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(getHeight() * 0.008),
                  decoration: BoxDecoration(
                    color: _bottomTabProvider.selectedIndex == 3 ? AppColors.creamColor: AppColors.pureWhiteColor,
                    border: Border.all(color: _bottomTabProvider.selectedIndex == 3 ? AppColors.pinkColor.withOpacity(0.1): AppColors.pureWhiteColor, width: getWidth() * 0.005),
                    borderRadius: BorderRadius.circular(
                      getWidth() * .02,
                    ),
                  ),
                  child: Image.asset(
                    Assets.notificationIcon,
                    height: 22,
                    width: 22,
                    color: _bottomTabProvider.selectedIndex == 3
                        ? AppColors.yellowColor
                        : AppColors.greyColor,
                  ),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(getHeight() * 0.008),
                  decoration: BoxDecoration(
                    color: _bottomTabProvider.selectedIndex == 4 ? AppColors.creamColor: AppColors.pureWhiteColor,
                    border: Border.all(color: _bottomTabProvider.selectedIndex == 4 ? AppColors.pinkColor.withOpacity(0.1): AppColors.pureWhiteColor, width: getWidth() * 0.005),
                    borderRadius: BorderRadius.circular(
                      getWidth() * .02,
                    ),
                  ),
                  child: Image.asset(
                    Assets.weContact,
                    height: 22,
                    width: 22,
                    color: _bottomTabProvider.selectedIndex == 4
                        ? AppColors.yellowColor
                        : AppColors.greyColor,
                  ),
                ),
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
