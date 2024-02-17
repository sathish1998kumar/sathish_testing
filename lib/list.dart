import 'package:flutter/material.dart';
import 'package:sathish_testing/profile.dart';
import 'package:sathish_testing/settings.dart';

import 'homescreen.dart';
class Listscreen extends StatefulWidget {
  String username;
  String password;
  String token;
  int index;
   Listscreen({super.key, required this.username,
     required this.password,
     required this.token,required this.index});

  @override
  State<Listscreen> createState() => _ListscreenState();
}

class _ListscreenState extends State<Listscreen> {
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Profile'),
    Text('Settings'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:_widgetOptions.elementAt(widget.index)
      ),
      body:widget.index==0?WelcomeScreen(
          username: widget.username,
          password: widget.password,
          token: widget.token):widget.index==1?Profile(
    username: widget.username,
        password: widget.password,
        token: widget.token):SettingsScreen(username: widget.username,
          password: widget.password,
          token: widget.token),
    );
  }
}
