import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart' show ReadContext;
import 'package:task_manager/Provider/Auth_Provider.dart';
import 'package:task_manager/Screens/Email_Screen.dart';
import 'package:task_manager/Screens/Home_Screen.dart';
import 'package:task_manager/Screens/SignUp_Screen.dart';
import 'package:task_manager/Widgets/Custom_Button_Icon.dart';
import 'package:task_manager/Widgets/Custom_TextField.dart';
import 'package:task_manager/Widgets/ShowSnackBar.dart';
import 'package:task_manager/utils/Asset_Path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _signIn() async {
    final authProvider = context.read<AuthProvider>();

    final bool success = await authProvider.signIn(email.text, password.text);

    if (success) {
      showSnackbar(BuildContext,context, "Login successful!");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      showSnackbar(BuildContext,context, authProvider.errorMessage ?? "Login failed");
    }
  }

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
                      controller: password,
                      hintText: "Password",
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password required";
                        }
                        if (value.length < 6) {
                          return "Minimum 6 characters";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    context.read<AuthProvider>().isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButtonIcon(
                            text: 'Sign In',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _signIn();
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
                                  builder: (_) => EmailScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Forget Password ?",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),

                          const SizedBox(height: 5),

                          RichText(
                            text: TextSpan(
                              text: "Don't have account? ",
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
                                          builder: (_) => SignUpScreen(),
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
