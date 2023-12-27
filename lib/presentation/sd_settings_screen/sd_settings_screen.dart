// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_leading_circleimage.dart';
import 'package:facetap/widgets/app_bar/appbar_subtitle.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';
import 'package:facetap/widgets/custom_outlined_button.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';
import 'package:image_picker/image_picker.dart';

class SdSettingsScreen extends StatefulWidget {
  const SdSettingsScreen({Key? key}) : super(key: key);

  @override
  _SdSettingsScreenState createState() => _SdSettingsScreenState();
}

class _SdSettingsScreenState extends State<SdSettingsScreen> {
  final List<bool> _isExpandedList = [false, false, false];

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingCircleimage(
        imagePath: ImageConstant.imgEllipse8,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 5.v,
          bottom: 5.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Yennefer Doe",
        margin: EdgeInsets.only(left: 10.h),
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
            Navigator.of(context).pushNamed(AppRoutes.studentDashboardHomeScreen);
            break;
        }
      },
      getCurrentPage: () {
        return BottomBarEnum.Settings;
      },
    );
  }

  Widget _buildAccordionTile(BuildContext context, {required String title, required List<Widget> formFields, required int index}) {
    return ExpansionTile(
      onExpansionChanged: (bool expanded) {
        setState(() {
          _isExpandedList[index] = expanded;
          for (int i = 0; i < _isExpandedList.length; i++) {
            if (i != index) {
              _isExpandedList[i] = false;
            }
          }
        });
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomTextStyles.bodyMediumRegular15.copyWith(
              color: appTheme.black90001,
            ),
          ),
        ],
      ),
      children: _isExpandedList[index]
          ? [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: formFields.map((field) => Column(
              children: [
                field,
                const SizedBox(height: 15.0), // Adjust the height as needed
              ],
            )).toList(),
          ),
        ),
      ]
          : [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.005),
                child: Text(
                  "Account Settings",
                  style: CustomTextStyles.bodyMediumSecondaryContainer,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.023),
              _buildAccordionTile(
                context,
                title: "Edit profile",
                formFields: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  InkWell(
                    onTap: () async {
                      final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        // Handle the selected image file (e.g., save it, display it, etc.)
                        // You can use pickedFile.path to get the file path.
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.image),
                          SizedBox(width: 8.0),
                          Text("Select new Profile Image"),
                        ],
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      // Edit profile logic
                    },
                    text: "Save Changes",
                    buttonStyle: CustomButtonStyles.outlinePrimaryBL4,
                  ),
                ],
                index: 0,
              ),
              _buildAccordionTile(
                context,
                title: "Change password",
                formFields: [
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Old Password"),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "New Password"),
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      // Change password logic
                    },
                    text: "Save Changes",
                    buttonStyle: CustomButtonStyles.outlinePrimaryBL4,
                  ),
                ],
                index: 1,
              ),
              _buildAccordionTile(
                context,
                title: "Delete account?",
                formFields: [
                  CustomElevatedButton(
                    onPressed: () {
                      _showDeleteConfirmationDialog(context);
                    },
                    text: "Delete Account",
                    buttonStyle: CustomButtonStyles.outlinePrimaryBL4,
                  ),
                ],
                index: 2,
              ),
              const Spacer(),
              CustomOutlinedButton(
                text: "Logout",
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.007),
                onPressed: () {
                  _showLogoutConfirmationDialog(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }
}

void _showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure you want to delete your account? This action cannot be undone."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Perform delete account logic here
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pushNamed(AppRoutes.signInAsStudentScreen);
              // Implement the logic to delete the account
            },
            child: const Text("Delete"),
          ),
        ],
      );
    },
  );
}

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Perform logout logic here
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pushNamed(AppRoutes.signInAsStudentScreen);
            },
            child: const Text("Logout"),
          ),
        ],
      );
    },
  );
}
