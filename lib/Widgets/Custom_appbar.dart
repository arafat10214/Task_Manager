<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Controller/Auth_Controller.dart';
import 'package:task_manager/Screens/Login_Screen.dart';
import 'package:task_manager/Screens/Profile_Update_Screen.dart';
import 'package:task_manager/utils/models/User_Model.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    await AuthController.getUserData(); // Load user data from shared preferences
    setState(() {
      user = AuthController.userModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => UpdateProfileScreen()));
            },

            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                user?.photo.isNotEmpty == true
                    ? user!.photo
                    : 'https://avatars.githubusercontent.com/u/184945222?v=4',
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user != null
                    ? "${user!.firstName} ${user!.lastName}"
                    : "Guest User",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                user?.email ?? "guest@example.com",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () async {
            // logout: clear shared preferences
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            setState(() {
              user = null; // Clear user data from state
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            });
          },
          icon: Icon(Icons.logout, color: Colors.white),
        ),
      ],
    );
  }
}
=======
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget get child => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/184945222?v=4'),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Md.Arafat Hossain",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "arafatatik225@gmail.com",
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.logout, color: Colors.white),
        ),
      ],
    );
  }
}
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
