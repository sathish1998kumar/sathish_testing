import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'Profilemenu.dart';
class Profile extends StatefulWidget {
  String username;
  String password;
  String token;

  Profile({super.key, required this.username, required this.password, required this.token});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black45, Colors.white60], // Adjust colors as needed
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Stack(
                    children: [
                      Container(
                        width: 160,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: ClipOval(
                          child:Image.asset(
                            'assets/userlog.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.username,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                ),
                Text(
                  "sathishajith1998@gmail.com",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.white, // Text color
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button background color
                      side: BorderSide.none,
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.white), // Button text color
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Divider(),
                SizedBox(height: 10),
                ProfileMenuWidget(title: "Settings", icon: Icons.settings, onPress: () {}),
                ProfileMenuWidget(title: "Information", icon: Icons.info, onPress: () {}),
                ProfileMenuWidget(title: "User Management", icon: Icons.manage_accounts, onPress: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


