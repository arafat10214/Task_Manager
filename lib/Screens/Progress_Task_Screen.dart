<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:task_manager/Api_Service/Api_Caller.dart';
import 'package:task_manager/Api_Service/Urls.dart';
import 'package:task_manager/Widgets/Custom_appbar.dart';
import 'package:task_manager/utils/models/Task_Model.dart';
import '../widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {

  List<TaskModel> taskList = [];
  bool isLoading = false;

  Future<void> getProgressTask() async {
    setState(() {
      isLoading = true;
    });

    final response = await ApiCaller.getRequest(
      URL: Urls.TaskByStatusURL('Progress'),
    );

    if (response.isSuccess) {
      List<TaskModel> tempList = [];

      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        tempList.add(TaskModel.fromJson(jsonData));
      }

      setState(() {
        taskList = tempList;
        isLoading = false;
      });

    } else {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.responseData?['data'] ?? "Something went wrong"),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getProgressTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: getProgressTask,
              child: ListView.separated(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    taskModel: taskList[index],
                    cardColor: Colors.purple,
                    refreshParent: getProgressTask, // 🔥 refresh fix
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 4);
                },
              ),
            ),
    );
  }
=======
import 'package:flutter/material.dart';

class ProgressTaskScreen extends StatelessWidget {
  const ProgressTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
}