import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';

class StudentDashboardClockInScreen extends StatelessWidget {
  const StudentDashboardClockInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                height: mediaQueryData.size.height,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.center, children: [
                  _buildThirtyFive(context),
                  Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          height: mediaQueryData.size.height,
                          width: 357.h,
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgPexelsCottonbr,
                                height: 640.v,
                                width: 357.h,
                                alignment: Alignment.center),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 21.h),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgFrameOnprimarycontainer,
                                              height: 28.v,
                                              width: 18.h,
                                              alignment: Alignment.centerLeft),
                                          SizedBox(height: 33.v),
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgFaceTracker,
                                              height: 374.v,
                                              width: 292.h),
                                          SizedBox(height: 24.v),
                                          SizedBox(
                                              height: 30.adaptSize,
                                              width: 30.adaptSize,
                                              child: Stack(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgRoundedRectangle,
                                                        height: 30.adaptSize,
                                                        width: 30.adaptSize,
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgFrameOnprimarycontainer18x14,
                                                        height: 18.v,
                                                        width: 14.h,
                                                        alignment:
                                                            Alignment.topCenter,
                                                        margin: EdgeInsets.only(
                                                            top: 6.v))
                                                  ])),
                                          SizedBox(height: 5.v),
                                          SizedBox(
                                              width: 157.h,
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "Your Location\n",
                                                        style: CustomTextStyles
                                                            .bodySmallOnPrimaryContainer),
                                                    TextSpan(
                                                        text:
                                                            "Angeles University Foundation, Angeles City, Pampanga, Philippines",
                                                        style: CustomTextStyles
                                                            .bodySmallOnPrimaryContainer_1)
                                                  ]),
                                                  textAlign: TextAlign.center)),
                                          SizedBox(height: 12.v),
                                          CustomElevatedButton(
                                              width: 227.h,
                                              text: "CLOCK IN".toUpperCase(),
                                              margin:
                                                  EdgeInsets.only(right: 26.h),
                                              onPressed: () {
                                                onTapCLOCKIN(context);
                                              },
                                              alignment: Alignment.centerRight)
                                        ])))
                          ])))
                ]))));
  }

  /// Section Widget
  Widget _buildThirtyFive(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 581.v),
            padding: EdgeInsets.fromLTRB(17.h, 6.v, 17.h, 7.v),
            decoration: AppDecoration.outlineBlack,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Column(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgHome,
                            height: 25.v,
                            width: 29.h),
                        Text("Home", style: CustomTextStyles.bodySmallPrimary)
                      ])),
                  Padding(
                      padding: EdgeInsets.only(top: 4.v),
                      child: Column(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgFrame,
                            height: 27.v,
                            width: 20.h),
                        Text("Attendance", style: theme.textTheme.bodySmall)
                      ])),
                  Padding(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Column(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgNavNotification,
                            height: 25.v,
                            width: 21.h),
                        SizedBox(height: 1.v),
                        Text("Notification", style: theme.textTheme.bodySmall)
                      ])),
                  Padding(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Column(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgNavSettings,
                            height: 25.adaptSize,
                            width: 25.adaptSize),
                        SizedBox(height: 2.v),
                        Text("Settings", style: theme.textTheme.bodySmall)
                      ]))
                ])));
  }

  /// Navigates to the studentDashboardHomeScreen when the action is triggered.
  onTapCLOCKIN(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.studentDashboardHomeScreen);
  }
}
