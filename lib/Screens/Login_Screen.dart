import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/Screens/Email_Screen.dart';
// import 'package:task_manager/Screens/Email_Screen.dart';
import 'package:task_manager/Screens/Home_Screen.dart';
import 'package:task_manager/Screens/SignUp_Screen.dart';
import 'package:task_manager/Widgets/Custom_Button_Icon.dart';
import 'package:task_manager/Widgets/Custom_TextField.dart';
import 'package:task_manager/utils/Asset_Path.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Get Started With",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                      ),
                    ),
                
                    const SizedBox(height: 20),
                
                    CustomTextfield(
                      controller: email,
                      hintText: "Email",
                      validator: (value) {
    if (value == null || value.isEmpty) {
      return "Email required";
    }
    if (!value.contains("@")) {
      return "Invalid email";
    }
    return null;
  },
                    ),
                
                    const SizedBox(height: 15),
                
                    CustomTextfield(
                      validator: (value) {
    if (value == null || value.isEmpty) {
      return "Password required";
    }
    if (value.length < 6) {
      return "Minimum 6 characters";
    }
    return null;
  },
                      controller: password,
                      hintText: "Password",
                      obscureText: true,
                    ),
                
                    const SizedBox(height: 20),
                
                    CustomButtonIcon(
                      text: '',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      }
                      },
                    ),
                
                    const SizedBox(height: 40),
                    Center(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            },
                            child:  TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmailScreen(),
                                  ),
                                );
                              },
                              child: Text("Forget Password ?",
                              style: TextStyle(color: Colors.grey),
                            ),),
                          ),
                          SizedBox(height: 1),
                          RichText(
                            text: TextSpan(
                              text: "Don't have account? ",
                              style:  TextStyle(
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
                                          builder: (context) => SignUpScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Sign up",
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}