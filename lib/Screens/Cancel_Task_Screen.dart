<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Provider/Task_Provider.dart';
import 'package:task_manager/Widgets/Custom_appbar.dart';
import '../widgets/task_card.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TaskProvider>().fetchTaskByStatus('Cancelled');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),

      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {

          // 🔥 loading
          if (taskProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          // 🔥 error
          if (taskProvider.errorMessage != null) {
            return Center(child: Text(taskProvider.errorMessage!));
          }

          // 🔥 data
          return RefreshIndicator(
            onRefresh: () async {
              await taskProvider.fetchTaskByStatus('Cancelled');
            },
            child: ListView.separated(
              itemCount: taskProvider.cancelledTask.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  taskModel: taskProvider.cancelledTask[index],
                  cardColor: Colors.red,
                  refreshParent: () {
                    taskProvider.fetchTaskByStatus('Cancelled');
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 4);
              },
            ),
          );
        },
      ),
    );
  }
=======
import 'package:flutter/material.dart';

class CancelTaskScreen extends StatelessWidget {
  const CancelTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
}