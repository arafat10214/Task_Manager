import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Provider/Task_Provider.dart';
=======
import 'package:flutter_svg/svg.dart';
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
import 'package:task_manager/Screens/Login_Screen.dart';
import 'package:task_manager/Widgets/Custom_Button_Icon.dart';
import 'package:task_manager/Widgets/Custom_TextField.dart';
import 'package:task_manager/utils/Asset_Path.dart';

<<<<<<< HEAD
class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
=======
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final password = TextEditingController();
  final mobile = TextEditingController();
  final _formKey = GlobalKey<FormState>();

<<<<<<< HEAD
  _clearTextFields() {
    email.clear();
    firstname.clear();
    lastname.clear();
    password.clear();
    mobile.clear();
  }

=======
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
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
<<<<<<< HEAD
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
=======
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
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
