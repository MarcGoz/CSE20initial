import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:facetap/user_data.dart';


class EdNotificationScreen extends StatefulWidget {
  const EdNotificationScreen({Key? key}) : super(key: key);

  @override
  _SdNotificationScreenState createState() => _SdNotificationScreenState();
}

class _SdNotificationScreenState extends State<EdNotificationScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  List<String> notifications = ["Notification 1", "Notification 2", "Notification 3"];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 19.v),
                Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Text(
                    "Notifications",
                    style: CustomTextStyles.titleLargeRoboto,
                  ),
                ),
                SizedBox(height: 9.v),
                _buildSDNotification(context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {

    UserData userData = Provider.of<UserData>(context, listen: false);
    String? uid = userData.uid;
    String? accountType = userData.accountType;

    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 20.h),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Fac".toUpperCase(),
                style: theme.textTheme.headlineLarge,
              ),
              TextSpan(
                text: "E".toUpperCase(),
                style: theme.textTheme.headlineLarge,
              ),
              TextSpan(
                text: "TAP".toUpperCase(),
                style: CustomTextStyles.headlineLargePrimary,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.h), // Add padding to the right
          child: GestureDetector(
            onTap: () {
              // Handle onTap for the trailing image
              Navigator.of(context).pushReplacementNamed(AppRoutes.edSettingsScreen);
            },
            child: userData.image != null
                ? AppbarTrailingCircleimage(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.edSettingsScreen);
              },
              imagePath: userData.image!,
              margin: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 5.v,
              ),
            )
                : FaIcon(
              FontAwesomeIcons.circleUser,
              size: 35, // Adjust the size as needed
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSDNotification(BuildContext context) {
    return notifications.isEmpty
        ? const Center(
      child: Text(
        "No notifications available",
        style: TextStyle(fontSize: 16),
      ),
    )
        : ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return EdnotificationItemWidgetWithCross(
          text: notifications[index],
          onRemove: () {
            setState(() {
              notifications.removeAt(index);
            });
          },
        );
      },
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        switch (type) {
          case BottomBarEnum.Attendance:
            Navigator.of(context).pushReplacementNamed(AppRoutes.edAttendanceOneScreen);
            break;
          case BottomBarEnum.Notification:
            Navigator.of(context).pushReplacementNamed(AppRoutes.edNotificationScreen);
            break;
          case BottomBarEnum.Settings:
            Navigator.of(context).pushReplacementNamed(AppRoutes.edSettingsScreen);
            break;
          case BottomBarEnum.Home:
            Navigator.of(context)
                .pushReplacementNamed(AppRoutes.teacherDashboardHomeScreen);
            break;
        }
      },
      getCurrentPage: () {
        // Replace with your logic to determine the current page
        return BottomBarEnum.Notification;
      },
    );
  }
}

class EdnotificationItemWidgetWithCross extends StatelessWidget {
  final String text;
  final VoidCallback onRemove;

  const EdnotificationItemWidgetWithCross({
    required this.text,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Add your logic to handle the notification click
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.h),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}
