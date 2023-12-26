// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';

class TeacherDashboardHomeScreen extends StatelessWidget {
  TeacherDashboardHomeScreen({Key? key})
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
            vertical: 6.v,
          ),
          child: Column(
            children: [
              RichText(
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
                textAlign: TextAlign.left,
              ),
              Text(
                "Monday, November 12, 2023",
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: 7.v),
              _buildEightyFour(context),
              SizedBox(height: 17.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today’s Classes",
                  style: CustomTextStyles.titleLargeBold,
                ),
              ),
              SizedBox(height: 5.v),
              _buildEightyThree(context),
              SizedBox(height: 5.v),
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
  Widget _buildEightyFour(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgPieGraph,
            height: 156.adaptSize,
            width: 156.adaptSize,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 10.h,
              top: 21.v,
              bottom: 27.v,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 8.h,
              vertical: 13.v,
            ),
            decoration: AppDecoration.outlineGray300.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder4,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGroup37,
                  height: 28.v,
                  width: 103.h,
                  alignment: Alignment.centerRight,
                ),
                SizedBox(height: 7.v),
                Container(
                  width: 98.h,
                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Classes",
                        style: CustomTextStyles.bodySmallBluegray900,
                      ),
                      Text(
                        "120",
                        style: CustomTextStyles.bodySmallRegular,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.v),
                Container(
                  width: 99.h,
                  margin: EdgeInsets.only(
                    left: 5.h,
                    right: 4.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Present days",
                        style: CustomTextStyles.bodySmallBluegray900,
                      ),
                      Text(
                        "99",
                        style: CustomTextStyles.bodySmallRegular,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.v),
                Container(
                  width: 97.h,
                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Absent days",
                        style: CustomTextStyles.bodySmallBluegray900,
                      ),
                      Text(
                        "21",
                        style: CustomTextStyles.bodySmallRegular,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.v),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEightyThree(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.h),
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.outlineGray30002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder11,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: _buildB(
              context,
              b: "M",
              biology: "Mathematics I",
              time: "09:30 am",
            ),
          ),
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(right: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 29.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 7.h,
                    vertical: 3.v,
                  ),
                  decoration: AppDecoration.fillGreen.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder14,
                  ),
                  child: Text(
                    "P",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.h,
                    top: 9.v,
                  ),
                  child: Text(
                    "Physics",
                    style: CustomTextStyles.bodyLarge16,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 9.v,
                    bottom: 4.v,
                  ),
                  child: Text(
                    "10:40 am",
                    style: CustomTextStyles.bodyMediumErrorContainer,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: _buildB(
              context,
              b: "B",
              biology: "Biology",
              time: "11:45 am",
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: _buildB(
              context,
              b: "G",
              biology: "Geography",
              time: "12:10 am",
            ),
          ),
          SizedBox(height: 7.v),
        ],
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
        return BottomBarEnum.Home;
      },
    );
  }

}

  /// Common widget
  Widget _buildB(
    BuildContext context, {
    required String b,
    required String biology,
    required String time,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 29.adaptSize,
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 3.v,
          ),
          decoration: AppDecoration.fillPrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder14,
          ),
          child: Text(
            b,
            style: theme.textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 5.h,
            top: 9.v,
          ),
          child: Text(
            biology,
            style: CustomTextStyles.bodyLarge16.copyWith(
              color: appTheme.gray800,
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(top: 13.v),
          child: Text(
            time,
            style: CustomTextStyles.bodyMediumErrorContainer.copyWith(
              color: theme.colorScheme.errorContainer,
            ),
          ),
        ),
      ],
    );
  }




