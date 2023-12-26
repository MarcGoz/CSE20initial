import '../sd_notification_one_screen/widgets/sdnotificationone_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';

class SdNotificationOneScreen extends StatelessWidget {
  SdNotificationOneScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
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
              SizedBox(
                height: mediaQueryData.size.height - 240.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 19.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildSDNotificationOne(context),
                              SizedBox(height: 34.v),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 24.h),
                                  child: Text(
                                    "01:00 pm",
                                    style: CustomTextStyles.bodySmallRubikErrorContainerRegular,
                                  ),
                                ),
                              ),
                              SizedBox(height: 36.v),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _buildThirtyFive(context),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.h),
          child: _buildBottomBar(context),
        ),
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
          margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.v),
        ),
      ],
    );
  }

  Widget _buildSDNotificationOne(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.v);
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return SdnotificationoneItemWidget();
        },
      ),
    );
  }

  Widget _buildThirtyFive(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: mediaQueryData.size.height - 92.v),
        padding: EdgeInsets.fromLTRB(17.h, 6.v, 17.h, 7.v),
        decoration: AppDecoration.outlineBlack,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                onTapTwentyNine(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 5.v),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgNavHome,
                      height: 25.v,
                      width: 29.h,
                    ),
                    Text("Home", style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.v),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFrame,
                    height: 27.v,
                    width: 20.h,
                    onTap: () {
                      onTapImgImage(context);
                    },
                  ),
                  Text("Attendance", style: theme.textTheme.bodySmall),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.v),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFramePrimary25x21,
                    height: 25.v,
                    width: 21.h,
                  ),
                  SizedBox(height: 1.v),
                  Text("Notification", style: CustomTextStyles.bodySmallPrimary),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                onTapThirtyThree(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 5.v),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgNavSettings,
                      height: 25.adaptSize,
                      width: 25.adaptSize,
                    ),
                    SizedBox(height: 2.v),
                    Text("Settings", style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
            Navigator.of(context)
                .pushNamed(AppRoutes.studentDashboardHomeScreen);
            break;
        }
      },
      getCurrentPage: () {
        // Replace with your logic to determine the current page
        return BottomBarEnum.Notification;
      },
    );
  }


  onTapTwentyNine(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.teacherDashboardHomeScreen);
  }

  onTapImgImage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.edAttendanceScreen);
  }

  onTapThirtyThree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.edSettingsScreen);
  }
}
