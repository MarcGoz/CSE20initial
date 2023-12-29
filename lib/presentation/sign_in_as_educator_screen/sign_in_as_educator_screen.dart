import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_checkbox_button.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInAsEducatorScreen extends StatefulWidget {
  const SignInAsEducatorScreen({Key? key}) : super(key: key);

  @override
  _SignInAsEducatorScreenState createState() => _SignInAsEducatorScreenState();
}

class _SignInAsEducatorScreenState extends State<SignInAsEducatorScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward(); // Start the animation immediately
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAppBar(context),
                const SizedBox(height: 52),
                Hero(
                  tag: 'logo',
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgVectorPrimary,
                      height: 72,
                      width: 102,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  "Educators",
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 57),
                _buildEmailFormField(),
                const SizedBox(height: 22),
                _buildPasswordFormField(),
                const SizedBox(height: 22),
                _buildRememberMe(context),
                const SizedBox(height: 25),
                _buildSignInButton(),
                const SizedBox(height: 3),
                _buildRegisterButton(),
                const SizedBox(height: 3),
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
        icon: const Icon(Icons.arrow_back),
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
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Enter your email",
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Container(
          margin: const EdgeInsets.fromLTRB(12, 2, 10, 2),
          child: const FaIcon(
            FontAwesomeIcons.solidEnvelope,
            size: 15,
            color: Colors.black,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(maxHeight: 41),
        contentPadding: const EdgeInsets.only(right: 30),
        border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
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
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Enter your password",
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Container(
          margin: const EdgeInsets.fromLTRB(12, 2, 10, 2),
          child: const FaIcon(
            FontAwesomeIcons.lock,
            size: 15,
            color: Colors.black,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(maxHeight: 41),
        contentPadding: const EdgeInsets.only(right: 30),
        border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
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
      Navigator.pushReplacementNamed(context, AppRoutes.chooseARoleScreen);
    });
  }

  void onTapSignIn(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle sign-in logic and navigation
      Navigator.pushReplacementNamed(context, AppRoutes.teacherDashboardHomeScreen);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
