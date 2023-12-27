// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, required this.onChanged, required this.getCurrentPage});

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
      icon: FontAwesomeIcons.house,
      activeIcon: FontAwesomeIcons.house,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: FontAwesomeIcons.calendarDays,
      activeIcon: FontAwesomeIcons.calendarDays,
      title: "Attendance",
      type: BottomBarEnum.Attendance,
    ),
    BottomMenuModel(
      icon: FontAwesomeIcons.bell,
      activeIcon: FontAwesomeIcons.bell,
      title: "Notification",
      type: BottomBarEnum.Notification,
    ),
    BottomMenuModel(
      icon: FontAwesomeIcons.gear,
      activeIcon: FontAwesomeIcons.gear,
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
            offset: const Offset(
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
                Icon(
                  bottomMenuList[index].icon,
                  size: 15.v,
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
                Icon(
                  bottomMenuList[index].activeIcon,
                  size: 18.v,
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

  IconData icon; // Change the type to IconData
  IconData activeIcon; // Change the type to IconData
  String? title;
  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
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

