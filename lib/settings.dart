import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final String username;
  final String password;
  final String token;

  SettingsScreen({Key? key, required this.username, required this.password, required this.token}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Change Username'),
            onTap: () {
              // Navigate to username change screen
            },
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            title: Text('Change Password'),
            onTap: () {
              // Navigate to password change screen
            },
            leading: Icon(Icons.lock),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            title: Text('Notification Settings'),
            onTap: () {
              // Navigate to notification settings screen
            },
            leading: Icon(Icons.notifications),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            title: Text('Theme Settings'),
            onTap: () {
              // Navigate to theme settings screen
            },
            leading: Icon(Icons.color_lens),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
        ],
      ),
    );
  }
}
