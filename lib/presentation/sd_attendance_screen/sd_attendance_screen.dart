
// ignore_for_file: must_be_immutable

import '../sd_attendance_screen/widgets/month_item_widget.dart';
import '../sd_attendance_screen/widgets/twentyfive_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:facetap/user_data.dart';

class SdAttendanceScreen extends StatelessWidget {
  SdAttendanceScreen({Key? key})
      : super(
    key: key,
  );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 15.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 6.v),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to .sdAttendanceOneScreen
                      Navigator.pop(context);
                    },
                    child: CustomImageView(
                      imagePath: ImageConstant.imgFrameBlack90001,
                      height: 30.v,
                      width: 10.h,
                      margin: EdgeInsets.only(left: 10.h),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 29.h),
                    child: Text(
                      "CSE20 Attendance",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.v),
              _buildTwentyFive(context),
              SizedBox(height: 17.v),
              _buildMonth(context),
            ],
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

  /// Section Widget
  Widget _buildTwentyFive(BuildContext context) {
    return SizedBox(
      height: 94.v,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 31.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
            context,
            index,
            ) {
          return SizedBox(
            width: 23.h,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return const TwentyfiveItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildMonth(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
            context,
            index,
            ) {
          return SizedBox(
            height: 18.v,
          );
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return const MonthItemWidget();
        },
      ),
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
        return BottomBarEnum.Attendance;
      },
    );
  }

}