import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_checkbox_button.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInAsEducatorScreen extends StatefulWidget {
  SignInAsEducatorScreen({Key? key}) : super(key: key);

  @override
  _SignInAsEducatorScreenState createState() => _SignInAsEducatorScreenState();
}

class _SignInAsEducatorScreenState extends State<SignInAsEducatorScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                    height: _animationController.isCompleted ? 120 : 0, // Increased logo size
                    child: CustomImageView(
                      imagePath: ImageConstant.imgVectorPrimary,
                      height:72, // Increased logo size
                      width: 102, // Increased logo size
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Educators",
                  style: theme.textTheme.titleLarge,
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
                _buildRegisterButton(),
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
    return Hero(
      tag: 'button',
      child: CustomElevatedButton(
        height: 49,
        text: "Log In".toUpperCase(),
        onPressed: () {
          onTapSignIn(context);
        },
      ),
    );
  }

  Widget _buildRegisterButton() {
    return TextButton(
      onPressed: () {
        onTapRegister(context);
      },
      child: Text(
        "Don't have an account? Register here",
        style: TextStyle(color: theme.primaryColor),
      ),
    );
  }

  void onTapRegister(BuildContext context) {
    // Handle sign-in logic and navigation
    Navigator.pushReplacementNamed(context, AppRoutes.registerEducatorScreen);
  }

  void onTapArrowLeft(BuildContext context) {
    _animationController.reverse().then((value) {
      Navigator.pop(context);
    });
  }

  void onTapSignIn(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle sign-in logic and navigation
      Navigator.pushNamed(context, AppRoutes.teacherDashboardHomeScreen);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
