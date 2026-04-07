import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/Api_Service/Api_Caller.dart';
import 'package:task_manager/Api_Service/Api_Response.dart';
import 'package:task_manager/Api_Service/Urls.dart';
import 'package:task_manager/Screens/Home_Screen.dart';
import 'package:task_manager/Screens/New_Task_Screen.dart';
import 'package:task_manager/Widgets/Custom_Button_Icon.dart';
import 'package:task_manager/Widgets/Custom_TextField.dart';
import 'package:task_manager/Widgets/Custom_appbar.dart';
import 'package:task_manager/utils/Asset_Path.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController desriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetPath.backgroundSvg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add New Task",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                      ),
                    ),

                    SizedBox(height: 20),
                    CustomTextfield(
                      hintText: "Subject",
                      controller: subjectController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Subject";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Description",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      maxLines: 6,
                      controller: desriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Description";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomButtonIcon(
                      text: '',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          addNewTask();
                        }
                      },
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

  Future<void> addNewTask() async {
    Map<String, dynamic> requestBody = {
      "title": subjectController.text,
      "description": desriptionController.text,
      "status": "New",
    };

    setState(() {
      isLoading = true;
    });

    final ApiResponse response = await ApiCaller.PostRequest(
      URL: Urls.AddTaskURL,
      body: requestBody,
    );

    setState(() {
      isLoading = false;
    });

    if (response.isSuccess) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task added..!')
      )
);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (predicate) => false,
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }
  }
}
