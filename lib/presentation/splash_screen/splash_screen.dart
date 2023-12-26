import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;
            final screenWidth = constraints.maxWidth;

            return Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 0.1 * screenWidth),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFaceTrackerPrimary,
                    height: 0.5 * screenHeight,
                    width: 0.5 * screenWidth,
                    margin: EdgeInsets.only(bottom: 0.01 * screenHeight),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Face".toUpperCase(),
                          style: theme.textTheme.displaySmall,
                        ),
                        TextSpan(
                          text: "TAP".toUpperCase(),
                          style: CustomTextStyles.displaySmallPrimary,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 0.005 * screenHeight),
                  Container(
                    width: 0.7 * screenWidth, // Adjust the width as needed
                    margin: EdgeInsets.symmetric(horizontal: 0.038 * screenWidth),
                    child: Text(
                      "FaceTap is a facial recognition app designed to simplify and streamline attendance management for educational institutions, corporate organizations, and events using facial recognition technology.",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmall10.copyWith(height: 1.84),
                    ),
                  ),
                  SizedBox(height: 0.03 * screenHeight),
                  Container(
                    width: 0.7 * screenWidth, // Adjust the width as needed
                    child: CustomElevatedButton(
                      height: 0.044 * screenHeight,
                      text: "Get Started".toUpperCase(),
                      margin: EdgeInsets.only(left: 0.017 * screenWidth),
                      buttonStyle: CustomButtonStyles.outlinePrimaryBL4,
                      buttonTextStyle: CustomTextStyles.labelLargeOnPrimaryContainerBlack,
                      onPressed: () {
                        onTapGetStarted(context);
                      },
                    ),
                  ),
                  SizedBox(height: 0.005 * screenHeight),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Navigates to the permissionsScreen when the action is triggered.
  void onTapGetStarted(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.permissionsScreen);
  }
}
