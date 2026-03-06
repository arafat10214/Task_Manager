import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/Screens/Login_Screen.dart';
import 'package:task_manager/Widgets/Custom_Button_Icon.dart';
import 'package:task_manager/Widgets/Custom_TextField.dart';
import 'package:task_manager/utils/Asset_Path.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final password = TextEditingController();
  final mobile = TextEditingController();
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
                      "Join With us",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),

                  const SizedBox(height: 20),

                  CustomTextfield(controller: email, hintText: "Email",
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter your email";
                    }
                    return null;
                  },
                  ),

                  const SizedBox(height: 15),

                  CustomTextfield(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter your first name";
                      }
                      return null;
                    },
                    controller: firstname,
                    hintText: "First Name",
                  ),

                  const SizedBox(height: 15),

                  CustomTextfield(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter your last name";
                      }
                      return null;
                    },
                    controller: lastname,
                    hintText: "Last Name",
                  ),

                  const SizedBox(height: 15),

                  CustomTextfield(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter your mobile number";
                      }
                      return null;
                    },  
                    controller: mobile,
                    hintText: "Mobile",
                    obscureText: true,
                  ),

                  const SizedBox(height: 20),
                  CustomTextfield(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter your password";
                      }
                      return null;
                    },
                    hintText: "Password", 
                    controller: password
                    ),
                  SizedBox(height: 20),
                  CustomButtonIcon(
                    text: '',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      }
                      }
                  ),

                  const SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Have account? ",
                            style: TextStyle(color: Colors.black, fontSize: 14),
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
