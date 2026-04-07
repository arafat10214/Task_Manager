import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Provider/Task_Provider.dart';
import 'package:task_manager/Screens/Add_New_Task_Screen.dart';
import 'package:task_manager/Widgets/Custom_Taskcount_by_status.dart';
import 'package:task_manager/Widgets/Custom_appbar.dart';
import 'package:task_manager/Widgets/Task_Card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final provider = context.read<TaskProvider>();
      provider.fetchTaskCounts();
      provider.fetchTaskByStatus('New');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          // 🔥 loading handle
          if (taskProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          // 🔥 error handle
          if (taskProvider.errorMessage != null) {
            return Center(child: Text(taskProvider.errorMessage!));
          }

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(6),
                child: SizedBox(
                  height: 70,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: taskProvider.taskStatusCounts.length,
                    itemBuilder: (context, index) {
                      final item = taskProvider.taskStatusCounts[index];

                      return SizedBox(
                        width: 100,
                        child: CustomTaskcountByStatus(
                          tittle: item.status,
                          count: item.count,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                  ),
                ),
              ),

              Expanded(
                child: ListView.separated(
                  itemCount: taskProvider.newTask.length,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      taskModel: taskProvider.newTask[index],
                      cardColor: Colors.blue, refreshParent: () {
                        taskProvider.fetchTaskByStatus('New');
                      },
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewTaskScreen()),
          );
        },
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
