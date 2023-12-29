// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';
import 'package:facetap/widgets/custom_text_form_field.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:facetap/user_data.dart';

class EdAddDeleteScreen extends StatelessWidget {
  EdAddDeleteScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameController = TextEditingController();

  TextEditingController group411Controller = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 17.v,
            ),
            child: Column(
              children: [
                SizedBox(height: 4.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 11.h),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgFrameBlack90001,
                          height: 28.v,
                          width: 18.h,
                          margin: EdgeInsets.only(top: 1.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 28.h),
                          child: Text(
                            "Add a Class",
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 9.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text(
                      "Class Name",
                      style: CustomTextStyles.bodySmallGray500Regular,
                    ),
                  ),
                ),
                SizedBox(height: 4.v),
                _buildName(context),
                SizedBox(height: 6.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text(
                      "Class Code",
                      style: CustomTextStyles.bodySmallGray500Regular,
                    ),
                  ),
                ),
                SizedBox(height: 2.v),
                _buildGroup411(context),
                SizedBox(height: 7.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text(
                      "Weekly Schedule",
                      style: CustomTextStyles.bodySmallGray500Regular,
                    ),
                  ),
                ),
                SizedBox(height: 9.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 43.h,
                    right: 28.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Monday",
                        style: CustomTextStyles.bodySmallGray600,
                      ),
                      const Spacer(),
                      Container(
                        height: 12.v,
                        width: 14.h,
                        margin: EdgeInsets.only(bottom: 2.v),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onError,
                          borderRadius: BorderRadius.circular(
                            3.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 9.h),
                        child: _buildFiftyFive(
                          context,
                          labelTwo: "--:--:--",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 43.h,
                    right: 28.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tuesday",
                        style: CustomTextStyles.bodySmallGray600,
                      ),
                      const Spacer(),
                      Container(
                        height: 12.v,
                        width: 14.h,
                        margin: EdgeInsets.only(bottom: 2.v),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onError,
                          borderRadius: BorderRadius.circular(
                            3.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 9.h),
                        child: _buildFiftyFive(
                          context,
                          labelTwo: "--:--:--",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 43.h,
                    right: 28.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Wednesday",
                        style: CustomTextStyles.bodySmallGray600,
                      ),
                      const Spacer(),
                      Container(
                        height: 12.v,
                        width: 14.h,
                        margin: EdgeInsets.only(bottom: 2.v),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onError,
                          borderRadius: BorderRadius.circular(
                            3.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 9.h),
                        child: _buildFiftyFive(
                          context,
                          labelTwo: "--:--:--",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 43.h,
                    right: 28.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Thursday",
                        style: CustomTextStyles.bodySmallGray600,
                      ),
                      const Spacer(),
                      Container(
                        height: 12.v,
                        width: 14.h,
                        margin: EdgeInsets.only(bottom: 2.v),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onError,
                          borderRadius: BorderRadius.circular(
                            3.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 9.h),
                        child: _buildFiftyFive(
                          context,
                          labelTwo: "--:--:--",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 43.h,
                    right: 28.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Friday",
                        style: CustomTextStyles.bodySmallGray600,
                      ),
                      const Spacer(),
                      Container(
                        height: 12.v,
                        width: 14.h,
                        margin: EdgeInsets.only(bottom: 2.v),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onError,
                          borderRadius: BorderRadius.circular(
                            3.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 9.h),
                        child: _buildFiftyFive(
                          context,
                          labelTwo: "--:--:--",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.v),
                Divider(
                  indent: 16.h,
                  endIndent: 1.h,
                ),
                SizedBox(height: 5.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.h),
                    child: Text(
                      "Period",
                      style: CustomTextStyles.bodySmallGray500Regular,
                    ),
                  ),
                ),
                SizedBox(height: 11.v),
                _buildDate(context),
                SizedBox(height: 9.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.h),
                    child: Text(
                      "Location",
                      style: CustomTextStyles.bodySmallGray500Regular,
                    ),
                  ),
                ),
                SizedBox(height: 11.v),
                _buildLocation(context),
                SizedBox(height: 6.v),
                CustomImageView(
                  imagePath: ImageConstant.imgImage1,
                  height: 53.v,
                  width: 317.h,
                ),
                SizedBox(height: 14.v),
                _buildSAVE(context),
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

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.h,
        right: 1.h,
      ),
      child: CustomTextFormField(
        controller: nameController,
        hintText: "Mobile Application",
        textInputType: TextInputType.phone,
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup411(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.h,
        right: 1.h,
      ),
      child: CustomTextFormField(
        controller: group411Controller,
        hintText: "CSE10",
        hintStyle: CustomTextStyles.bodyLargeBluegray90001,
      ),
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.h),
      child: CustomTextFormField(
        controller: dateController,
        hintText: "28 Feb 2020",
        hintStyle: CustomTextStyles.bodyMediumPrimaryContainer,
        suffix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 1.v, 3.h, 6.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgIccalender,
            height: 16.adaptSize,
            width: 16.adaptSize,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 23.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLocation(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.h),
      child: CustomTextFormField(
        controller: locationController,
        hintText: "Current Location",
        hintStyle: CustomTextStyles.bodyMediumPrimaryContainer,
        textInputAction: TextInputAction.done,
        suffix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 1.v, 5.h, 1.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgLocation,
            height: 18.v,
            width: 15.h,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 23.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSAVE(BuildContext context) {
    return CustomElevatedButton(
      height: 26.v,
      width: 127.h,
      text: "SAVE".toUpperCase(),
      rightIcon: Container(
        margin: const EdgeInsets.only(),
        child: CustomImageView(
          imagePath: ImageConstant.imgRoundedRectangle1Copy9,
          height: 26.v,
          width: 127.h,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlinePrimary3,
    );
  }

  /// Section Widget
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
        return BottomBarEnum.Attendance;
      },
    );
  }

  /// Common widget
  Widget _buildFiftyFive(
    BuildContext context, {
    required String labelTwo,
  }) {
    return SizedBox(
      height: 12.v,
      width: 42.h,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 12.v,
              width: 42.h,
              padding: EdgeInsets.fromLTRB(3.h, 3.v, 3.h, 2.v),
              decoration: AppDecoration.outlineOnError,
              child: CustomImageView(
                imagePath: ImageConstant.imgVectorOnerror,
                height: 6.v,
                width: 5.h,
                alignment: Alignment.centerRight,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text(
                labelTwo,
                style: CustomTextStyles.bodySmallGray500.copyWith(
                  color: appTheme.gray500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
