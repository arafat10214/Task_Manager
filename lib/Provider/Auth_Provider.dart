import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Api_Service/Api_Caller.dart';
import 'package:task_manager/Api_Service/Api_Response.dart';
import 'package:task_manager/Api_Service/Urls.dart';
import 'package:task_manager/utils/models/User_Model.dart';

class AuthProvider extends ChangeNotifier {
  static String _accessTokenKey = 'token';
  static String _userModelKey = 'user-data';
  static final Logger _logger = Logger();

  static String? accessToken;
  static UserModel? userModel;

  String? errorMessage;
  bool isLoading = false;

  Future saveUserData(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    await sharedPreferences.setString(
      _userModelKey,
      jsonEncode(model.toJson()),
    );
    accessToken = token;
    userModel = model;
    _logger.i(accessToken);
    _logger.i(userModel);
    notifyListeners();
  }

  Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    if (token != null) {
      accessToken = token;
      String? userData = sharedPreferences.getString(_userModelKey);
      userModel = UserModel.fromJson(jsonDecode(userData!));
    }
    _logger.i(token);
    _logger.i(userModel);
    notifyListeners();
  }

  Future<bool> isUserLoggeIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    return token != null;
  }

  Future<void> updateUserData(UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(
      _userModelKey,
      jsonEncode(model.toJson()),
    );
  }

  Future<void> cleanUserData(UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    notifyListeners();
  }

  _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<bool> signIn(String email, String password) async {
    Map<String, dynamic> requestBody = {"email": email, "password": password};

    _setLoading(true);

    final ApiResponse response = await ApiCaller.PostRequest(
      URL: Urls.loginUrl,
      body: requestBody,
    );

    _setLoading(false);

    print("FULL RESPONSE: ${response.responseData}"); // 🔥 debug

    final data = response.responseData;

    if (response.isSuccess &&
        data != null &&
        data["data"] != null &&
        data["token"] != null) {
        UserModel model = UserModel.fromJson(data["data"]);
        String accessToken = data["token"];
        await saveUserData(model, accessToken);
        return true;
      
    } else {
      errorMessage = data?["message"] ?? "Login failed. Try again";
      notifyListeners();
      return false;
    }
  }
}
