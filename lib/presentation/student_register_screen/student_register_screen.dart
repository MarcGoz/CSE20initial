import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class StudentRegisterScreen extends StatefulWidget {
  const StudentRegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<StudentRegisterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Define a global counter variable
  int _globalCounter = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                      imagePath: ImageConstant.imgVector,
                      height: 72,
                      width: 102,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  "Register as Student",
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 57),
                _buildNameFormField(),
                const SizedBox(height: 22),
                _buildEmailFormField(),
                const SizedBox(height: 22),
                _buildPasswordFormField(),
                const SizedBox(height: 22),
                _buildConfirmPasswordFormField(),
                const SizedBox(height: 22),
                _buildSignUpButton(),
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

  Widget _buildNameFormField() {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.text,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Enter your name",
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Container(
          margin: const EdgeInsets.fromLTRB(12, 2, 10, 2),
          child: const FaIcon(
            FontAwesomeIcons.user,
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

  Widget _buildConfirmPasswordFormField() {
    return TextFormField(
      controller: confirmPasswordController,
      obscureText: true,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Confirm your password",
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
      Navigator.pushReplacementNamed(context, AppRoutes.signInAsStudentScreen);
    });
  }

  void onTapSignUp(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        // Sign up with email and password
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // Retrieve the signed-in user
        User? user = userCredential.user;

        if (user != null) {
          // Fetch the current counter value from Firestore
          DocumentSnapshot counterSnapshot =
          await _firestore.collection('stud_counter')
              .doc('studentCounter')
              .get();

          int currentCounter = counterSnapshot.exists
              ? counterSnapshot['count']
              : 0;

          // Generate studId using the current counter
          String studId = 's${currentCounter + 1}';

          // Update the counter in Firestore
          await _firestore.collection('stud_counter')
              .doc('studentCounter')
              .update({
            'count': currentCounter + 1,
          });

          // Create a document in the "students" collection with the user's UID
          await _firestore.collection('students').doc(user.uid).set({
            'studId': studId,
            'name': nameController.text,
            'email': emailController.text,
            // Add other fields as needed
          });

          // Navigate to the home screen on successful sign-up
          Navigator.pushReplacementNamed(context, AppRoutes.signInAsStudentScreen);
          
        }
      } catch (e) {
        // Handle registration error
        print("Error during registration: $e");
        // You can show an error message to the user
      }
    }
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}