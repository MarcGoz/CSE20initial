import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_checkbox_button.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';

class SignInAsEducatorScreen extends StatefulWidget {
  SignInAsEducatorScreen({Key? key}) : super(key: key);

  @override
  _SignInAsEducatorScreenState createState() => _SignInAsEducatorScreenState();
}

class _SignInAsEducatorScreenState extends State<SignInAsEducatorScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAppBar(context),
                SizedBox(height: 52),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorPrimary,
                  height: 54,
                  width: 77,
                ),
                SizedBox(height: 7),
                Text(
                  "Educators",
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 57),
                _buildEmailFormField(),
                SizedBox(height: 22),
                _buildPasswordFormField(),
                SizedBox(height: 22),
                _buildRememberMe(context),
                SizedBox(height: 25),
                _buildSignInButton(),
                SizedBox(height: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarSubtitleOne(
        text: "Back",
        margin: EdgeInsets.only(left: 10),
      ),
    );
  }

  Widget _buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Enter your email",
        hintStyle: TextStyle(color: Colors.grey),
        prefix: Container(
          margin: EdgeInsets.fromLTRB(12, 2, 10, 2),
          child: CustomImageView(
            imagePath: ImageConstant.img1e,
            height: 14,
            width: 20,
          ),
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 41),
        contentPadding: EdgeInsets.only(right: 30),
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Enter your password",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(12, 2, 10, 2),
          child: CustomImageView(
            imagePath: ImageConstant.imgPasswordField,
            height: 14,
            width: 20,
          ),
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 41),
        contentPadding: EdgeInsets.only(right: 30),
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  Widget _buildRememberMe(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CustomCheckboxButton(
        alignment: Alignment.centerLeft,
        text: "Remember me",
        value: rememberMe,
        onChange: (value) {
          setState(() {
            rememberMe = value;
          });
        },
      ),
    );
  }

  Widget _buildSignInButton() {
    return CustomElevatedButton(
      height: 49,
      text: "Log In".toUpperCase(),
      onPressed: () {
        onTapSignIn(context);
      },
    );
  }

  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  void onTapSignIn(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle sign-in logic and navigation
      Navigator.pushNamed(context, AppRoutes.teacherDashboardHomeScreen);
    }
  }
}
