import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Provider/Task_Provider.dart';
import 'package:task_manager/Screens/Login_Screen.dart';
import 'package:task_manager/Widgets/Custom_Button_Icon.dart';
import 'package:task_manager/Widgets/Custom_TextField.dart';
import 'package:task_manager/utils/Asset_Path.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final password = TextEditingController();
  final mobile = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _clearTextFields() {
    email.clear();
    firstname.clear();
    lastname.clear();
    password.clear();
    mobile.clear();
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
              child: Consumer<TaskProvider>(
                builder: (context, taskProvider, child) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Join With us",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Inter')),
                        const SizedBox(height: 20),
                        CustomTextfield(controller: email, hintText: "Email", validator: (String? p1) {  },),
                        const SizedBox(height: 15),
                        CustomTextfield(controller: firstname, hintText: "First Name", validator: (String? p1) {  },),
                        const SizedBox(height: 15),
                        CustomTextfield(controller: lastname, hintText: "Last Name", validator: (String? p1) {  },),
                        const SizedBox(height: 15),
                        CustomTextfield(controller: mobile, hintText: "Mobile", validator: (String? p1) {  },),
                        const SizedBox(height: 20),
                        CustomTextfield(controller: password, hintText: "Password", validator: (String? p1) {  }, obscureText: true,),
                        const SizedBox(height: 20),
                        taskProvider.isLoading
                            ? const Center(child: CircularProgressIndicator(color: Colors.green))
                            : CustomButtonIcon(
                                text: 'Sign Up',
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    bool success = await taskProvider.signUp(
                                      email: email.text.trim(),
                                      firstName: firstname.text.trim(),
                                      lastName: lastname.text.trim(),
                                      mobile: mobile.text.trim(),
                                      password: password.text.trim(),
                                    );
                                    if (success) {
                                      _clearTextFields();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text("Sign up successful")));
                                      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(taskProvider.errorMessage ?? "Signup failed")));
                                    }
                                  }
                                },
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}