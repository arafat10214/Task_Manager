


import 'package:flutter/material.dart';
import 'package:task_manager/Api_Service/Api_Caller.dart';
import 'package:task_manager/Api_Service/Api_Response.dart';
import 'package:task_manager/Api_Service/Urls.dart';
import 'package:task_manager/utils/models/Task_Model.dart';
import 'package:task_manager/utils/models/Task_Stutus_CountModel.dart';


class TaskProvider extends ChangeNotifier{

    List<TaskModel>newTask = [];
    List<TaskModel>progressTask = [];
    List<TaskModel>completeTask = [];
    List<TaskModel>cancelledTask = [];
    List<TaskStatusCountModel>taskStatusCounts = [];

    bool isLoading = false;
    String? errorMessage;


    _setLoading(bool value){
      isLoading = value;
      notifyListeners();
    }

    void setListByStatus(String status, List<TaskModel>tasks){
      switch(status){
        case 'New':
          newTask = tasks;
          break;

        case 'Progress':
          progressTask = tasks;
          break;

        case 'Completed':
          completeTask = tasks;
          break;

        case 'Cancelled':
          cancelledTask = tasks;
          break;

      }
    }


    Future fetchTaskByStatus(String status) async {
      _setLoading(true);

      final response = await ApiCaller.getRequest(URL: Urls.TaskByStatusURL(status));


      if(response.isSuccess){
        List<TaskModel> tasks  = [];
        for(Map<String,dynamic>jsonData in response.responseData['data']){
          tasks.add(TaskModel.fromJson(jsonData));
        }
        setListByStatus(status, tasks );
      }else{
        errorMessage = response.responseData['data'];
      }

      _setLoading(false);
    }


    Future fetchTaskCounts() async {

      final response = await ApiCaller.getRequest(URL: Urls.TaskCountURL);


      if(response.isSuccess){
        List<TaskStatusCountModel> count = [];
        for(Map<String,dynamic>jsonData in response.responseData['data']){
          count.add(TaskStatusCountModel.fromJson(jsonData));
        }
        taskStatusCounts = count;
      }else{
        errorMessage = response.responseData['data'];
      }
      notifyListeners();
    }



    Future<bool>changeTaskStatus(String id, String newStatus) async {

      final response =await ApiCaller.getRequest(URL: Urls.ChangeStatusURL(id, newStatus));

      if(response.isSuccess){
        newTask.removeWhere((t)=>t.sId == id);
        progressTask.removeWhere((t)=>t.sId == id);
        completeTask.removeWhere((t)=>t.sId == id);
        cancelledTask.removeWhere((t)=>t.sId == id);

       await Future.wait([
        fetchTaskByStatus(newStatus),
        fetchTaskCounts(),
        ]);


        return true;
      }else{

        errorMessage = response.responseData['data'];
        notifyListeners();
        return false;
      }



    }



    Future<bool>deleteTask(String id) async {

      final response =await ApiCaller.getRequest(URL: Urls.DeleteTaskURL(id));

      if(response.isSuccess){
        newTask.removeWhere((t)=>t.sId == id);
        progressTask.removeWhere((t)=>t.sId == id);
        completeTask.removeWhere((t)=>t.sId == id);
        cancelledTask.removeWhere((t)=>t.sId == id);

        await Future.wait([
          fetchTaskCounts(),
        ]);


        return true;
      }else{

        errorMessage = response.responseData['data'];
        notifyListeners();
        return false;
      }



    }


    Future<bool>addTask(String title, String description) async {

      _setLoading(true);

      final ApiResponse response = await ApiCaller.PostRequest(URL: Urls.AddTaskURL,
      body: {
        'title': title,
        'description': description,
        'status': 'New',
      }
      );

      _setLoading(false);

      if(response.isSuccess){
        await Future.wait([
          fetchTaskByStatus('New'),
          fetchTaskCounts(),

        ]);
        return true;
      }else{
        errorMessage = response.responseData['data'];
        notifyListeners();
        return false;
      }
    }

 Future<bool> signUp({
  required String email,
  required String firstName,
  required String lastName,
  required String mobile,
  required String password,
}) async {
  _setLoading(true);
  errorMessage = null;

  final response = await ApiCaller.PostRequest(
    URL: Urls.signUpUrl,
    body: {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "password": password,
    },
  );

  _setLoading(false);

  if (response.isSuccess) {
    return true;
  } else {
    errorMessage = response.responseData?['data'] ?? "Signup failed";
    notifyListeners();
    return false;
  }
}

}