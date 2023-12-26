import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:facetap/core/app_export.dart';

class ChooseARoleScreen extends StatelessWidget {
  const ChooseARoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Choose Your Role", style: theme.textTheme.headlineSmall),
                SizedBox(height: 30),
                _buildRoleButton(
                  imagePath: ImageConstant.imgVector,
                  roleText: "Students",
                  onTap: () {
                    onTapStudent(context);
                  },
                ),
                SizedBox(height: 20),
                _buildRoleButton(
                  imagePath: ImageConstant.imgVectorPrimary,
                  roleText: "Educators",
                  onTap: () {
                    onTapEducator(context);
                  },
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton({
    required String imagePath,
    required String roleText,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey.withOpacity(0.5),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          padding: EdgeInsets.all(25),
          width: double.infinity, // Full width
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), // Adjust opacity as needed
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: imagePath,
                height: 80,
                width: 80,
              ),
              SizedBox(height: 15),
              Text(
                roleText,
                style: TextStyle(
                  color: Colors.grey[800], // Adjust color as needed
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapStudent(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInAsStudentScreen);
  }

  void onTapEducator(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInAsEducatorScreen);
  }
}
