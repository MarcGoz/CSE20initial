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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:facetap/user_data.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io'; // For File class
import 'package:firebase_storage/firebase_storage.dart';

class SdSettingsScreen extends StatefulWidget {
  const SdSettingsScreen({Key? key}) : super(key: key);

  @override
  _SdSettingsScreenState createState() => _SdSettingsScreenState();
}

class _SdSettingsScreenState extends State<SdSettingsScreen> {
  final List<bool> _isExpandedList = [false, false, false];

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    String? name = userData.name;

    return CustomAppBar(
      leadingWidth: 64.h,
      leading: userData.profile != null
          ? AppbarLeadingCircleimage(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(AppRoutes.sdSettingsScreen);
        },
        imagePath: userData.image!,
        margin: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 5.v,
        ),
      )
          : Padding(
        padding: EdgeInsets.only(top: 10.h, left: 30.h),
        child: FaIcon(
          FontAwesomeIcons.circleUser,
          size: 35,
        ),
      ),
      title: AppbarSubtitle(
        text: name ?? "User Account", // Display the user name or a default if it's null
        margin: EdgeInsets.only(left: 10.h),
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
            Navigator.of(context).pushReplacementNamed(AppRoutes.studentDashboardHomeScreen);
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
    UserData userData = Provider.of<UserData>(context, listen: false);
    String? oldPassword;
    String? newPassword;

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
                    onChanged: (value) {
                      userData.name = value; // Update the name in the UserData object
                    },
                  ),
                  InkWell(
                    onTap: () async {
                      final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        String extension = pickedFile.path.split('.').last;
                        String imagePath = 'profiles/${userData.uid}.$extension';

                        try {
                          Reference storageRef = FirebaseStorage.instance.ref().child(imagePath);
                          await storageRef.putFile(File(pickedFile.path));
                          userData.updateImage(imagePath);

                          // Show success snackbar
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Image uploaded successfully"),
                            duration: Duration(seconds: 2),
                          ));
                        } catch (e) {
                          // Show error snackbar
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Error uploading image: $e"),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ));
                        }
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
                    onPressed: () async {
                      try {
                        await FirebaseFirestore.instance
                            .collection('Students') // Assuming 'Students' is the collection name
                            .doc(userData.uid)
                            .update({'Name': userData.name, 'Image': userData.image});

                        userData.notifyListeners();

                        // Show success snackbar
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Changes saved successfully"),
                          duration: Duration(seconds: 2),
                        ));

                      } catch (e) {
                        // Show error snackbar
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Error saving changes: $e"),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ));
                      }
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
                    onChanged: (value) {
                      // Store the old password as the user types
                      oldPassword = value;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "New Password"),
                    onChanged: (value) {
                      // Store the new password as the user types
                      newPassword = value;
                    },
                  ),
                  CustomElevatedButton(
                    onPressed: () async {
                      try {
                        // Check if oldPassword and newPassword are not null or empty
                        if (oldPassword == null || newPassword == null || oldPassword!.isEmpty || newPassword!.isEmpty) {
                          // Show an error message or handle the case where passwords are missing
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please enter both old and new passwords."),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        // Get the current user
                        User? user = FirebaseAuth.instance.currentUser;

                        // Reauthenticate the user with the old password
                        AuthCredential credential = EmailAuthProvider.credential(email: user?.email ?? '', password: oldPassword!);
                        await user?.reauthenticateWithCredential(credential);

                        // Change the password
                        await user?.updatePassword(newPassword!);

                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Password changed successfully."),
                            duration: Duration(seconds: 2),
                          ),
                        );

                        // You can also navigate to another screen if needed
                        // ...
                        Navigator.of(context).pushReplacementNamed(AppRoutes.signInAsStudentScreen);

                      } catch (error) {
                        print('Error changing password: $error');
                        // Handle error (e.g., display an error message)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Error changing password. Please try again."),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
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
            onPressed: () async {
              try {
                // Get the current user
                User? user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  // Delete the corresponding Firestore data
                  await FirebaseFirestore.instance.collection('Students').doc(user.uid).delete();

                  // Delete the user's authentication record
                  await user.delete();

                  // Close the dialog
                  Navigator.of(context).pop();

                  Provider.of<UserData>(context, listen: false).clearUserData(); // Clear user data

                  // Show a success Snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Account deleted successfully."),
                    ),
                  );

                  // Navigate to the sign-in screen
                  Navigator.of(context).pushReplacementNamed(AppRoutes.signInAsStudentScreen);
                } else {
                  // Handle the case where the user is not authenticated
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("User not authenticated."),
                    ),
                  );
                }
              } catch (e) {
                // Handle errors, e.g., if there's an issue deleting the data
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Error: $e"),
                  ),
                );
              }
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
              Provider.of<UserData>(context, listen: false).clearUserData(); // Clear user data
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pushReplacementNamed(AppRoutes.signInAsStudentScreen);
            },
            child: const Text("Logout"),
          ),
        ],
      );
    },
  );
}
