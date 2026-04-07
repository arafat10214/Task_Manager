import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/Screens/Login_Screen.dart';
import 'package:task_manager/Screens/PIn_Verify_Screen.dart';
import 'package:task_manager/Widgets/Custom_Button_Icon.dart';
import 'package:task_manager/Widgets/Custom_TextField.dart';
import 'package:task_manager/utils/Asset_Path.dart';

class EmailScreen extends StatelessWidget {
   EmailScreen({super.key});

  final TextEditingController email = TextEditingController();
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
          padding:  EdgeInsets.all(16.0),
          child: Center(
            child: SizedBox(
              height: 400,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Email  Address',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('A 6 digit verification pin will be sent to your \n email address',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),),
                  SizedBox(height: 15),
                  CustomTextfield(hintText: 'Email', controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Simple email validation
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  ),
                  SizedBox(height: 20),
                  CustomButtonIcon(onPressed: (){
                      if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VerificationScreen()),
                          );
                      }
                  }, text: '',),
                  SizedBox(
                    height: 35,
                  ),
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
      ),],
     ),
    );
  }
}