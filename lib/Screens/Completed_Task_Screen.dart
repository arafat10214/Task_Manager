import 'package:flutter/material.dart';
import 'package:task_manager/Api_Service/Api_Caller.dart';
import 'package:task_manager/Api_Service/Urls.dart';
import 'package:task_manager/Widgets/Custom_appbar.dart';
import 'package:task_manager/utils/models/Task_Model.dart';
import '../widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {

  List<TaskModel> taskList = [];
  bool isLoading = false;

  Future<void> getCompletedTask() async {
    setState(() {
      isLoading = true;
    });

    final response = await ApiCaller.getRequest(
      URL: Urls.TaskByStatusURL('Completed'),
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
    getCompletedTask(); // 🔥 correct function name
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: getCompletedTask,
              child: ListView.separated(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    taskModel: taskList[index],
                    cardColor: Colors.green,
                    refreshParent: getCompletedTask, // 🔥 refresh working
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 4);
                },
              ),
            ),
    );
  }
}