import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'package:task_manager/Provider/Auth_Provider.dart';
import 'package:task_manager/Provider/Navigation_provider.dart';
import 'package:task_manager/Provider/Task_Provider.dart';
import 'package:task_manager/app.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TaskProvider()),
      ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
    ],
    child: TaskManager(),
  ));
=======
import 'package:task_manager/app.dart';

void main(){
  runApp(TaskManager());
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
}