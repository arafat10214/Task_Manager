<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Provider/Task_Provider.dart';
import 'package:task_manager/Widgets/ShowSnackBar.dart';
import 'package:task_manager/utils/models/Task_Model.dart';
import 'package:task_manager/widgets/showSnackBar.dart';

class TaskCard extends StatefulWidget {
  final TaskModel taskModel;
  final Color cardColor;
  final VoidCallback refreshParent;

  const TaskCard({
    super.key,
    required this.taskModel,
    required this.cardColor,
    required this.refreshParent,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Future<void> deleteTask() async {
    final taskProvider = context.read<TaskProvider>();

    bool success = await taskProvider.deleteTask(widget.taskModel.sId ?? "");

    if (success) {
      SnackBar(content: Text('Task deleted successfully')); 
      widget.refreshParent(); // ✅ parent refresh
    } else {
    SnackBar(content: Text(taskProvider.errorMessage.toString()));
    }
  }

  Future<void> changeStatus(String status) async {
    final taskProvider = context.read<TaskProvider>();

    bool success = await taskProvider.changeTaskStatus(
      widget.taskModel.sId ?? "", // ✅ id fix
      status,
    );

    if (success) {
      Navigator.pop(context);
      SnackBar(content: Text('Status changed to $status'));
      widget.refreshParent(); // ✅ refresh UI
    } else {
     SnackBar(content: Text(taskProvider.errorMessage.toString()));
    }
  }

  void showChangeStatusDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildStatusItem('New'),
              buildStatusItem('Progress'),
              buildStatusItem('Completed'),
              buildStatusItem('Cancelled'),
            ],
          ),
        );
      },
    );
  }

  Widget buildStatusItem(String status) {
    return ListTile(
      onTap: () {
        changeStatus(status);
      },
      title: Text(status),
      trailing: widget.taskModel.status == status
          ? const Icon(Icons.done)
          : null,
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'New':
        return Colors.blue;
      case 'Progress':
        return Colors.purple;
      case 'Completed':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = widget.taskModel.status ?? "";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(
            widget.taskModel.title ?? "",
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 18),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(widget.taskModel.description ?? ""),
              const SizedBox(height: 5),
              Text('Date: ${widget.taskModel.createdDate ?? ""}'),
              const SizedBox(height: 10),

              Row(
                children: [
                  Chip(
                    label: Text(status),
                    backgroundColor: getStatusColor(status), // ✅ dynamic color
                    labelStyle: const TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),

                  const Spacer(),

                  IconButton(
                    onPressed: showChangeStatusDialog,
                    icon: const Icon(
                      Icons.edit_note_rounded,
                      color: Colors.orange,
                    ),
                  ),

                  IconButton(
                    onPressed: deleteTask,
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
=======
  
 import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Card(
        child: ListTile(
          title: Text('Task Title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
         subtitle: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('Task Description'),
             Text('Date: 2024-06-30'),
             SizedBox(height: 8),
             Row(
               children: [
                 Chip(label: Text("New",),
                 backgroundColor: Colors.blue,
                 labelStyle: TextStyle(color: Colors.white),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                 ),),

                 Spacer(),
                 IconButton(onPressed: (){}, icon: Icon(Icons.edit_note_rounded, color: Colors.orange,)),
                 IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,)),
               ],
             )
           ],
        ),
      ),
    )
    );
  }
}
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
