
// ignore_for_file: must_be_immutable

import '../sd_attendance_screen/widgets/month_item_widget.dart';
import '../sd_attendance_screen/widgets/twentyfive_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';

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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 13.h,
                    right: 52.h,
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgFrameBlack90001,
                        height: 28.v,
                        width: 18.h,
                        margin: EdgeInsets.only(top: 1.v),
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
                ),
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
          return TwentyfiveItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildMonth(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
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
          return MonthItemWidget();
        },
      ),
    );
  }

  /// Section Widget
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