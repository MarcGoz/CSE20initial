// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_leading_circleimage.dart';
import 'package:facetap/widgets/app_bar/appbar_subtitle.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';
import 'package:facetap/widgets/custom_outlined_button.dart';

class EdSettingsScreen extends StatelessWidget {
  EdSettingsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.005),
                child: Text(
                  "Account Settings",
                  style: CustomTextStyles.bodyMediumSecondaryContainer,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.023),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.005,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: _buildThirty(
                  context,
                  changePassword: "Edit profile",
                  onTap: () {
                    // Navigate to sd_notification_screen.dart
                    Navigator.of(context).pushNamed(AppRoutes.studentDashboardHomeScreen);
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.005,
                  right: MediaQuery.of(context).size.width * 0.048,
                ),
                child: _buildThirty(
                  context,
                  changePassword: "Change password",
                  onTap: () {
                    // Navigate to sd_notification_screen.dart
                    Navigator.of(context).pushNamed(AppRoutes.sdNotificationScreen);
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
                child: _buildThirty(
                  context,
                  changePassword: "Delete account?",
                  onTap: () {
                    // Navigate to sd_settings_screen.dart
                    Navigator.of(context).pushNamed(AppRoutes.sdSettingsScreen);
                  },
                ),
              ),
              Spacer(),
              CustomOutlinedButton(
                text: "Logout",
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.007),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.chooseARoleScreen);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingCircleimage(
        imagePath: ImageConstant.imgEllipse8,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 5.v,
          bottom: 5.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Yennefer Doe",
        margin: EdgeInsets.only(left: 10.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        switch (type) {
          case BottomBarEnum.Attendance:
            Navigator.of(context).pushNamed(AppRoutes.edAttendanceOneScreen);
            break;
          case BottomBarEnum.Notification:
            Navigator.of(context).pushNamed(AppRoutes.edNotificationScreen);
            break;
          case BottomBarEnum.Settings:
            Navigator.of(context).pushNamed(AppRoutes.edSettingsScreen);
            break;
          case BottomBarEnum.Home:
            Navigator.of(context)
                .pushNamed(AppRoutes.teacherDashboardHomeScreen);
            break;
        }
      },
      getCurrentPage: () {
        // Replace with your logic to determine the current page
        return BottomBarEnum.Settings;
      },
    );
  }

  Widget _buildThirty(
      BuildContext context, {
        required String changePassword,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.001),
            child: Text(
              changePassword,
              style: CustomTextStyles.bodyMediumRegular15.copyWith(
                color: appTheme.black90001,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: MediaQuery.of(context).size.width * 0.03,
            width: MediaQuery.of(context).size.width * 0.03,
          ),
        ],
      ),
    );
  }
}
