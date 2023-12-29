import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_checkbox_button.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';
import 'package:permission_handler/permission_handler.dart'; // Import the permission_handler package

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({Key? key}) : super(key: key);

  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool cameraPermissionChecked = false;
  bool locationPermissionChecked = false;
  bool readPolicyChecked = false;
  bool termsAndConditionsChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingValue = screenWidth > 600 ? 48 : 24;

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingValue, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Face Tap for Students", style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 14),
              _buildDescription(),
              const SizedBox(height: 5),
              Expanded(child: _buildPermissions()),
              const SizedBox(height: 24),
              _buildAllowButton(),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 80,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          onTapArrowLeft(context);
        },
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 8),
      child: const Text(
        "Please give us permission to access the following for fast and wide facial detection.",
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16, height: 1.20),
      ),
    );
  }

  Widget _buildPermissions() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 20, 7, 0), // Add top margin
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomCheckboxButton(
            text: "Allow access to Camera",
            value: cameraPermissionChecked,
            onChange: (value) async {
              final bool granted = await requestCameraPermission();
              if (granted) {
                setState(() {
                  cameraPermissionChecked = value;
                });
              }
            },
          ),
          const SizedBox(height: 30),
          CustomCheckboxButton(
            text: "Allow access to Location",
            value: locationPermissionChecked,
            onChange: (value) async {
              final bool granted = await requestLocationPermission();
              if (granted) {
                setState(() {
                  locationPermissionChecked = value;
                });
              }
            },
          ),
          const SizedBox(height: 30),
          CustomCheckboxButton(
            text: "I read the Privacy policy",
            isExpandedText: false,
            value: readPolicyChecked,
            onChange: (value) {
              setState(() {
                readPolicyChecked = value;
              });
            },
          ),
          const SizedBox(height: 30),
          CustomCheckboxButton(
            text: "I accept the terms and conditions",
            isExpandedText: false,
            value: termsAndConditionsChecked,
            onChange: (value) {
              setState(() {
                termsAndConditionsChecked = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAllowButton() {
    return CustomElevatedButton(
      height: 43,
      text: "Allow".toUpperCase(),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      onPressed: () => onTapAllow(context),
      alignment: Alignment.center,
    );
  }

  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  void onTapAllow(BuildContext context) {
    if (cameraPermissionChecked && locationPermissionChecked && readPolicyChecked && termsAndConditionsChecked) {
      Navigator.pushReplacementNamed(context, AppRoutes.chooseARoleScreen);
    } else {
      showSnackbar(context, "Please check all permissions before proceeding.");
    }
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<bool> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    return status == PermissionStatus.granted;
  }

  Future<bool> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    return status == PermissionStatus.granted;
  }

}
