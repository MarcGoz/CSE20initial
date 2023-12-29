import '../sd_attendance_one_screen/widgets/sdattendanceone_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EdAttendanceOneScreen extends StatelessWidget {
  EdAttendanceOneScreen({Key? key}) : super(key: key);

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
        GestureDetector(
          child: AppbarTrailingCircleimage(
            onTap: () {
              // Navigate to sdSettingsScreen
              Navigator.of(context).pushReplacementNamed(AppRoutes.edSettingsScreen);
            },
            imagePath: ImageConstant.imgEllipse8,
            margin: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 5.v,
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
        Expanded(child: Container()), // Use Expanded widget
        _buildAddClassButton(), // Adjusted spacing between "Attendance" and text field
      ],
    );
  }

  Widget _buildAddClassButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
      child: SizedBox(
        height: 40, // Set the desired width
        width: 140, // Set the desired width
        child: ElevatedButton.icon(
          onPressed: () {
            // Add your logic for the button click here
          },
          style: CustomButtonStyles.outlinePrimaryBL4, // Use the outlined style here
          icon: const Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
          label: const Text(
            "Add Class",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
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

  onTapSubject(BuildContext context, String subjectName) {
    print("Tapped on $subjectName");
    // Navigate to the corresponding screen for the selected subject
    if (subjectName == "CSE20") {
      Navigator.of(context).pushReplacementNamed(AppRoutes.sdAttendanceScreen);
    }
  }

}
