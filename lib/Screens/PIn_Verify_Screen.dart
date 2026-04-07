import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/Screens/Login_Screen.dart';
import 'package:task_manager/Screens/Set_Password_Screen.dart';
import 'package:task_manager/Widgets/Custom_Text_Button.dart';
import 'package:task_manager/Widgets/Pin_Container.dart';
import 'package:task_manager/utils/Asset_Path.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// 6 PIN Controllers
  final List<TextEditingController> pinControllers =
      List.generate(6, (index) => TextEditingController());

  /// Combine PIN Value
  String get pinCode =>
      pinControllers.map((e) => e.text).join();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// Background SVG
          SvgPicture.asset(
            AssetPath.backgroundSvg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: SizedBox(
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const Text(
                        'Pin Verification',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'A 6 digit verification pin will be sent to your \n email address',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// PIN INPUT
                      PinContainer(
                        controllers: pinControllers,
                      ),

                      const SizedBox(height: 30),

                      /// VERIFY BUTTON
                      CustomTextButton(
                        text: 'Verify',
                        onPressed: () {

                          if(pinCode.isEmpty || pinCode.length != 6){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Enter 6 digit PIN"),
                              ),
                            );
                            return;
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  SetPasswordScreen(),
                            ),
                          );

                        },
                      ),

                      const SizedBox(height: 30),

                      /// Login Navigation
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
                                        builder: (context) =>  LoginScreen(),
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