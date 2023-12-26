import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';

class SdHomeFacialRecognitionScreen extends StatelessWidget {
  const SdHomeFacialRecognitionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgGroup417),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.v),
                    child: Column(children: [
                      SizedBox(height: 37.v),
                      CustomImageView(
                          imagePath:
                              ImageConstant.imgFaceTrackerOnprimarycontainer,
                          height: 408.v,
                          width: 320.h),
                      SizedBox(height: 15.v),
                      SizedBox(
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRoundedRectangle,
                                height: 30.adaptSize,
                                width: 30.adaptSize,
                                alignment: Alignment.center),
                            CustomImageView(
                                imagePath: ImageConstant.imgInfo,
                                height: 15.v,
                                width: 18.h,
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.only(top: 6.v))
                          ])),
                      SizedBox(height: 11.v),
                      SizedBox(
                          width: 157.h,
                          child: Text(
                              "You are too close. Move away from the camera so your face fits inside the circle ",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles
                                  .bodySmallOnPrimaryContainer10))
                    ]))),
            bottomNavigationBar: _buildRegisterFace(context)));
  }

  /// Section Widget
  Widget _buildRegisterFace(BuildContext context) {
    return CustomElevatedButton(
        width: 227.h,
        text: "register Face".toUpperCase(),
        margin: EdgeInsets.only(left: 66.h, right: 66.h, bottom: 27.v),
        onPressed: () {
          onTapRegisterFace(context);
        });
  }

  /// Navigates to the studentDashboardClockInScreen when the action is triggered.
  onTapRegisterFace(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.studentDashboardClockInScreen);
  }
}
