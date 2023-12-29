// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:facetap/user_data.dart';

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
                          text: "${DateFormat('h:mm').format(DateTime.now())} ",
                          style: CustomTextStyles.montserratBlack90001Light,
                        ),
                        TextSpan(
                          text: DateFormat('a').format(DateTime.now()).toLowerCase(),
                          style: CustomTextStyles.headlineLargeBlack90001,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 8.v),
                Center(
                  child: Text(
                    DateFormat("EEEE, MMMM d, y").format(DateTime.now()),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 20.v),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.studentDashboardClockInScreen,
                      );
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Set the background color to transparent
                      elevation: 0, // Remove the elevation
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusStyle.roundedBorder41,
                      ),
                    ),
                    child: Container(
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
                  ),
                ),
                SizedBox(height: 29.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.clock,
                            size: 33.adaptSize,
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
                              FaIcon(
                                FontAwesomeIcons.clock,
                                size: 33.adaptSize,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.clock,
                            size: 33.adaptSize,
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
              Navigator.of(context).pushReplacementNamed(AppRoutes.sdSettingsScreen);
            },
            child: userData.image != null
                ? AppbarTrailingCircleimage(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.sdSettingsScreen);
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

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        switch (type) {
          case BottomBarEnum.Attendance:
            Navigator.of(context).pushReplacementNamed(AppRoutes.sdAttendanceOneScreen);
            break;
          case BottomBarEnum.Notification:
            Navigator.of(context).pushReplacementNamed(AppRoutes.sdNotificationScreen);
            break;
          case BottomBarEnum.Settings:
            Navigator.of(context).pushReplacementNamed(AppRoutes.sdSettingsScreen);
            break;
          case BottomBarEnum.Home:
            Navigator.of(context)
                .pushReplacementNamed(AppRoutes.studentDashboardHomeScreen);
            break;
        }
      },
      getCurrentPage: () {
        // Replace with your logic to determine the current page
        return BottomBarEnum.Home;
      },
    );
  }

}
