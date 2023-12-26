// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({required this.onChanged, required this.getCurrentPage});

  Function(BottomBarEnum)? onChanged;
  BottomBarEnum Function() getCurrentPage;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  // Method to get the current page's BottomBarEnum
  BottomBarEnum getCurrentPage(BuildContext context) {
    // Replace the logic to determine the current page based on the context
    // For example, you might use Navigator or some other state management approach
    // In this example, I'm assuming a DefaultWidget is the default page
    if (ModalRoute.of(context)!.settings.name == '/home') {
      return BottomBarEnum.Home;
    } else if (ModalRoute.of(context)!.settings.name == '/attendance') {
      return BottomBarEnum.Attendance;
    } else if (ModalRoute.of(context)!.settings.name == '/notification') {
      return BottomBarEnum.Notification;
    } else if (ModalRoute.of(context)!.settings.name == '/settings') {
      return BottomBarEnum.Settings;
    } else {
      return BottomBarEnum.Home; // Default case
    }
  }

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavAttendance,
      activeIcon: ImageConstant.imgNavAttendance,
      title: "Attendance",
      type: BottomBarEnum.Attendance,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavNotification,
      activeIcon: ImageConstant.imgNavNotification,
      title: "Notification",
      type: BottomBarEnum.Notification,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavSettings,
      activeIcon: ImageConstant.imgNavSettings,
      title: "Settings",
      type: BottomBarEnum.Settings,
    )
  ];

  // Method to update the selected index based on the current page
  void updateSelectedIndex() {
    BottomBarEnum currentPage = widget.getCurrentPage();

    for (int i = 0; i < bottomMenuList.length; i++) {
      if (bottomMenuList[i].type == currentPage) {
        selectedIndex = i;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    updateSelectedIndex();
    return Container(
      height: 59.v,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90001.withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: Offset(
              0.0,
              3.0,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 25.v,
                  width: 29.h,
                  color: appTheme.black90001,
                ),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: appTheme.black90001,
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 27.v,
                  width: 20.h,
                  color: theme.colorScheme.primary,
                ),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: CustomTextStyles.bodySmallPrimary.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Attendance,
  Notification,
  Settings,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

