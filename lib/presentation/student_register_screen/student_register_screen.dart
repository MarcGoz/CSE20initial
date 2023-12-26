import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_checkbox_button.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentRegisterScreen extends StatefulWidget {
  StudentRegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<StudentRegisterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool rememberMe = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _animationController.forward();
  }

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
                Hero(
                  tag: 'logo',
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: _animationController.isCompleted ? 120 : 0,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgVector,
                      height: 72,
                      width: 102,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Register as Student",
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 57),
                _buildNameFormField(),
                SizedBox(height: 22),
                _buildEmailFormField(),
                SizedBox(height: 22),
                _buildPasswordFormField(),
                SizedBox(height: 22),
                _buildConfirmPasswordFormField(),
                SizedBox(height: 22),
                _buildSignUpButton(),
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
      leadingWidth: 40,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          onTapArrowLeft(context);
        },
      ),
    );
  }

  Widget _buildNameFormField() {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Enter your name",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(12, 2, 10, 2),
          child: FaIcon(
            FontAwesomeIcons.user,
            size: 15,
            color: Colors.black,
          ),
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 41),
        contentPadding: EdgeInsets.only(right: 30),
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
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
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(12, 2, 10, 2),
          child: FaIcon(
            FontAwesomeIcons.solidEnvelope,
            size: 15,
            color: Colors.black,
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
          child: FaIcon(
            FontAwesomeIcons.lock,
            size: 15,
            color: Colors.black,
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

  Widget _buildConfirmPasswordFormField() {
    return TextFormField(
      controller: confirmPasswordController,
      obscureText: true,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Confirm your password",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(12, 2, 10, 2),
          child: FaIcon(
            FontAwesomeIcons.lock,
            size: 15,
            color: Colors.black,
          ),
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 41),
        contentPadding: EdgeInsets.only(right: 30),
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        } else if (value != passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Widget _buildSignUpButton() {
    return Hero(
      tag: 'button',
      child: CustomElevatedButton(
        height: 49,
        text: "Sign Up".toUpperCase(),
        onPressed: () {
          onTapSignUp(context);
        },
      ),
    );
  }

  void onTapArrowLeft(BuildContext context) {
    _animationController.reverse().then((value) {
      Navigator.pop(context);
    });
  }

  void onTapSignUp(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle sign-up logic and navigation
      Navigator.pushNamed(context, AppRoutes.signInAsStudentScreen);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}