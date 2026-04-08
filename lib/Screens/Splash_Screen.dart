import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
<<<<<<< HEAD
import 'package:task_manager/Controller/Auth_Controller.dart';
import 'package:task_manager/Screens/Home_Screen.dart';
=======
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
import 'package:task_manager/Screens/Login_Screen.dart';
import 'package:task_manager/utils/Asset_Path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
<<<<<<< HEAD

class _SplashScreenState extends State<SplashScreen> {
=======
class _SplashScreenState extends State<SplashScreen> {

>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      moveToHome();
    });
  }

  Future<void> moveToHome() async {
    await Future.delayed(const Duration(seconds: 4));
<<<<<<< HEAD
    await AuthController.getUserData();
    final bool isLoggedIn = await AuthController.isUserLoggeIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  LoginScreen()),
      );
    }
=======

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetPath.backgroundSvg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
<<<<<<< HEAD
          Center(child: Image.asset(AssetPath.logopng, height: 200)),
=======
          Center(
            child: Image.asset(
              AssetPath.logopng,
              height: 300,
            ),
          ),
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
