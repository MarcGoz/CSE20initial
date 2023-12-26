import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_checkbox_button.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';

class PermissionsScreen extends StatefulWidget {
  PermissionsScreen({Key? key}) : super(key: key);

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
              SizedBox(height: 14),
              _buildDescription(),
              SizedBox(height: 5),
              Expanded(child: _buildPermissions()),
              SizedBox(height: 24),
              _buildAllowButton(),
              SizedBox(height: 5),
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
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          onTapArrowLeft(context);
        },
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 8),
      child: Text(
        "Please give us permission to access the following for fast and wide facial detection.",
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16, height: 1.20),
      ),
    );
  }

  Widget _buildPermissions() {
    return Padding(
      padding: EdgeInsets.fromLTRB(7, 20, 7, 0), // Add top margin
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomCheckboxButton(
            text: "Allow access to Camera",
            value: cameraPermissionChecked,
            onChange: (value) {
              setState(() {
                cameraPermissionChecked = value;
              });
            },
          ),
          SizedBox(height: 30),
          CustomCheckboxButton(
            text: "Allow access to Location",
            value: locationPermissionChecked,
            onChange: (value) {
              setState(() {
                locationPermissionChecked = value;
              });
            },
          ),
          SizedBox(height: 30),
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
          SizedBox(height: 30),
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
      margin: EdgeInsets.symmetric(horizontal: 8),
      onPressed: () => onTapAllow(context),
      alignment: Alignment.center,
    );
  }

  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  void onTapAllow(BuildContext context) {
    if (cameraPermissionChecked && locationPermissionChecked && readPolicyChecked && termsAndConditionsChecked) {
      Navigator.pushNamed(context, AppRoutes.chooseARoleScreen);
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
}
