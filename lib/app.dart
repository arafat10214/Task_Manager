import 'package:flutter/material.dart';
import 'package:task_manager/Screens/Splash_Screen.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      home: SplashScreen(),
    );
  }
}
