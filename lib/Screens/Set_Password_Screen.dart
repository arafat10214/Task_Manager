import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/Screens/Login_Screen.dart';
import 'package:task_manager/Widgets/Custom_TextField.dart';
import 'package:task_manager/Widgets/Custom_Text_Button.dart';
import 'package:task_manager/utils/Asset_Path.dart';

class SetPasswordScreen extends StatelessWidget {
  SetPasswordScreen({super.key});

  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetPath.backgroundSvg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Set Password',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Minimum length password 8 characters with \nLetter, number and combination',
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),

                      const SizedBox(height: 15),

                      CustomTextfield(
                        hintText: 'Password',
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          if (value.length <= 6) {
                            return 'Password must be at least 6 characters';
                          }
                          if (!RegExp(
                            r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
                          ).hasMatch(value)) {
                            return 'Password must contain letters and numbers';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      CustomTextfield(
                        hintText: 'Confirm Password',
                        controller: confirmPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm password';
                          }
                          if (value != password.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      CustomTextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          }
                        },
                        text: 'Confirm',
                      ),

                      const SizedBox(height: 20),

                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Have account? ",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            children: [
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Sign in",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
