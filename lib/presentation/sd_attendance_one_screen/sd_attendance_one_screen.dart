// SdAttendanceOneScreen.dart

import '../sd_attendance_one_screen/widgets/sdattendanceone_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';

class SdAttendanceOneScreen extends StatelessWidget {
  SdAttendanceOneScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAttendance(context),
              SizedBox(height: 20.v),
              _buildSDAttendanceOne(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 20.h),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Fac".toUpperCase(),
              style: CustomTextStyles.headlineLargeBlack90001,
            ),
            TextSpan(
              text: "E".toUpperCase(),
              style: CustomTextStyles.headlineLargeBlack90001,
            ),
            TextSpan(
              text: "TAP".toUpperCase(),
              style: CustomTextStyles.headlineLargePrimary,
            ),
          ]),
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

  Widget _buildAttendance(BuildContext context) {
    return Row(
      children: [
        Text("Attendance", style: CustomTextStyles.titleLargeBold),
        SizedBox(width: 20.h), // Adjusted spacing between "Attendance" and text field
        Expanded(
          child: Container(
            height: 25.h,
            margin: EdgeInsets.only(top: 3.v, bottom: 2.v),
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 6.v),
            decoration: AppDecoration.outlineBlack900011.copyWith(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter class code",
                      hintStyle: CustomTextStyles.bodySmallGray400,
                    ),
                    style: CustomTextStyles.bodySmallGray400,
                    onChanged: (value) {
                      // Handle the text field value change if needed
                    },
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorPrimary15x18,
                  height: 15.v,
                  width: 18.h,
                  margin: EdgeInsets.only(left: 6.h, top: 7.v, bottom: 6.v),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSDAttendanceOne(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          _buildDashboardItem(
            context,
            "PTF",
            "ABC123",
            Colors.red,
            Colors.red.withOpacity(0.7),
            _buildPlaceholderContainer("PTF"),
            "20%",
          ),
          _buildDashboardItem(
            context,
            "CSE20",
            "XYZ789",
            Color(0xFFF9B572),
            Color(0xFFF9B572).withOpacity(0.7),
            _buildPlaceholderContainer("CSE20"),
            "80%",
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderContainer(String subjectName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 24.0,
                  spreadRadius: 6.0,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjectName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Class Code: ${subjectName.toUpperCase()}123",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardItem(
      BuildContext context,
      String subjectName,
      String classCode,
      Color backgroundColor,
      Color overlayColor,
      Widget logo,
      String gradePercentage,
      ) {
    return GestureDetector(
      onTap: () {
        onTapSubject(context, subjectName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 24.0,
              spreadRadius: 6.0,
              offset: Offset(0, 12),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: _buildBackgroundOverlay(overlayColor),
            ),
            logo,
            Positioned(
              top: 16.0,
              right: 16.0,
              child: Text(
                gradePercentage,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundOverlay(Color overlayColor) {
    return Container(
      decoration: BoxDecoration(
        color: overlayColor,
        borderRadius: BorderRadius.circular(24.0),
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
        return BottomBarEnum.Attendance;
      },
    );
  }

  onTapSubject(BuildContext context, String subjectName) {
    print("Tapped on $subjectName");
    // Navigate to the corresponding screen for the selected subject
    if (subjectName == "CSE20") {
      Navigator.of(context).pushNamed(AppRoutes.sdAttendanceScreen);
    }
  }

}
