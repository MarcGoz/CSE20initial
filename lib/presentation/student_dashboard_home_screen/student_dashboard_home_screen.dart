// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';

class StudentDashboardHomeScreen extends StatelessWidget {
  StudentDashboardHomeScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 37.h,
              vertical: 22.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.v),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "09: 45 ".toUpperCase(),
                          style: CustomTextStyles.montserratBlack90001Light,
                        ),
                        TextSpan(
                          text: "am ".toUpperCase(),
                          style: CustomTextStyles.headlineLargeBlack90001,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 8.v), // Adjusted spacing
                Center(
                  child: Text(
                    "Monday, November 12, 2023",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 20.v),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 39.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.h,
                    vertical: 34.v,
                  ),
                  decoration: AppDecoration.gradientPrimaryToGreen.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder41,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup19,
                        height: 108.adaptSize,
                        width: 108.adaptSize,
                      ),
                      SizedBox(height: 4.v),
                      Text(
                        "Clock In",
                        style: CustomTextStyles.titleMediumMontserrat,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.v),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Your next class is ",
                          style: theme.textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: "CSE20",
                          style: CustomTextStyles.titleSmallGreen40002,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 29.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Center the columns
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgClock,
                            height: 33.adaptSize,
                            width: 33.adaptSize,
                          ),
                          SizedBox(height: 2.v),
                          Text(
                            "--:--",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "Time In",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgFrameGreen4000215x11,
                            height: 15.v,
                            width: 11.h,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(right: 7.h),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgClockGreen40001,
                                height: 33.adaptSize,
                                width: 33.adaptSize,
                              ),
                              SizedBox(height: 2.v),
                              Text(
                                "--:--",
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                "Time Out",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgFrameGreen40001,
                            height: 33.adaptSize,
                            width: 33.adaptSize,
                          ),
                          SizedBox(height: 2.v),
                          Text(
                            "--:--",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            "Class Time",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
        AppbarTrailingCircleimage(
          imagePath: ImageConstant.imgEllipse8,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 5.v,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        switch (type) {
          case BottomBarEnum.Attendance:
            Navigator.of(context).pushNamed(AppRoutes.sdAttendanceOneScreen);
            break;
          case BottomBarEnum.Notification:
            Navigator.of(context).pushNamed(AppRoutes.sdNotificationScreen);
            break;
          case BottomBarEnum.Settings:
            Navigator.of(context).pushNamed(AppRoutes.sdSettingsScreen);
            break;
          case BottomBarEnum.Home:
            Navigator.of(context).pushNamed(AppRoutes.studentDashboardHomeScreen);
            break;
        }
      },
    );
  }
}
