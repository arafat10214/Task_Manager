import 'package:flutter/material.dart';
import 'package:task_manager/Widgets/Custom_Taskcount_by_status.dart';
import 'package:task_manager/Widgets/Custom_appbar.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(6),
            child: SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 100,
                    child: CustomTaskcountByStatus(tittle: 'New', count: 10));
                },
                separatorBuilder: (context, index) => SizedBox(width: 8),
                itemCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
