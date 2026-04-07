class Urls {
  static String baseUrl = "http://35.73.30.144:2005/api/v1";
  static String signUpUrl = "$baseUrl/registration";
  static String loginUrl = "$baseUrl/login";
  static String AddTaskURL = '$baseUrl/createTask';
  static String ProfileUpdateURL = '$baseUrl/profileUpdate';
  static String TaskCountURL = '$baseUrl/taskStatusCount';
  static String TaskByStatusURL(String status) => '$baseUrl/listTaskByStatus/$status';
  static String DeleteTaskURL(String id) => '$baseUrl/deleteTask/$id';
  static String ChangeStatusURL(String id, String status) => '$baseUrl/updateTaskStatus/$id/$status';
}
