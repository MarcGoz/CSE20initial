// ignore_for_file: must_be_immutable

import '../sd_notification_screen/widgets/sdnotification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';

class SdNotificationScreen extends StatelessWidget {
  SdNotificationScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

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
          margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSDNotification(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(height: 20.v);
      },
      itemCount: 5,
      itemBuilder: (context, index) {
        return SdnotificationItemWidget();
      },
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
