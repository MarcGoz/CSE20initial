// SdAttendanceOneScreen.dart
import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:facetap/user_data.dart';

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

  Widget _buildAttendance(BuildContext context) {
    return Row(
      children: [
        Text("Attendance", style: CustomTextStyles.titleLargeBold),
        SizedBox(width: 20.h), // Adjusted spacing between "Attendance" and text field
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 3.v, bottom: 2.v),
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 6.v),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6.0,
                  spreadRadius: 0.0,
                  offset: const Offset(0, 2),
                ),
              ],
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
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.arrowRight, // Replace with the appropriate FontAwesome enter icon
                    size: 18, // Adjust the size as needed
                  ),
                  onPressed: () {
                    // Add your search logic here
                  },
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth < 600 ? 2 : 3,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            itemCount: 1, // Adjust the itemCount based on your data
            itemBuilder: (context, index) {
              return _buildDashboardItem(
                context,
                "CSE20",
                "XYZ789",
                const Color(0xFFF9B572),
                const Color(0xFFF9B572).withOpacity(0.7),
                _buildPlaceholderContainer("CSE20"),
                "80%",
              );
            },
          );
        },
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
                  offset: const Offset(0, 12),
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
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Class Code: ${subjectName.toUpperCase()}123",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
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
              offset: const Offset(0, 12),
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
                style: const TextStyle(
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

  onTapSubject(BuildContext context, String subjectName) {
    print("Tapped on $subjectName");
    // Navigate to the corresponding screen for the selected subject
    if (subjectName == "CSE20") {
      Navigator.of(context).pushNamed(AppRoutes.sdAttendanceScreen);
    }
  }

}
