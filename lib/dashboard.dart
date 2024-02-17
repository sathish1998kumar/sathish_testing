import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sathish_testing/list.dart';
import 'package:sathish_testing/login.dart';
import 'package:sathish_testing/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homescreen.dart';
import 'profile.dart';

class Dashboard extends StatefulWidget {
  String username;
  String password;
  String token;

  Dashboard({
    Key? key,
    required this.username,
    required this.password,
    required this.token,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Timer _timer;
  int _selectedIndex = 0; // Index of the selected bottom navigation bar item

  // Define the items for the bottom navigation bar
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'), // Placeholder for the home screen
    Text('Profile'), // Placeholder for the search screen
    Text('Settings'), // Placeholder for the settings screen
  ];

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    startTimer();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    // Create a periodic timer that calls getcheck() every 2 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      getcheck();
    });
  }

  Future<void> getcheck() async {
    var js = {
      "action": "check",
      "username": widget.username,
      "password": widget.password,
      "token": widget.token,
    };

    var response1 = await http.post(
      Uri.parse("http://dev.igps.io/swms/sathish.php"),
      body: jsonEncode(js),
    );
    print(response1.body);
    if (response1.statusCode == 200) {
      // print(response1.body);
    } else {
      SharedPreferences prefrences = await SharedPreferences.getInstance();
      await prefrences.remove("username");
      await prefrences.remove("password");
      await prefrences.remove("token");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      _timer.cancel();
    }
  }

  // Method to handle bottom navigation item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _widgetOptions.elementAt(_selectedIndex),
        // automaticallyImplyLeading: false, // Hides the back button
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'John Doe', // Replace with actual username
                  style: const TextStyle(fontSize: 20),
                ),
                accountEmail: null,
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/userlog.png',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                   image: AssetImage('assets/splash.jpg'),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                leading: const Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  Listscreen(username: widget.username, password: widget.password, token: widget.token,index:0),
                      ));
                  // Handle navigation to profile page
                },
              ),
              Divider(
                height: 1.2,
                color: Colors.black38,
                thickness: 1,
              ),
              ListTile(
                title: const Text('Profile'),
                leading: const Icon(Icons.person),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  Listscreen(username: widget.username, password: widget.password, token: widget.token,index:1),
                      ));
                  // Handle navigation to profile page
                },
              ),
              Divider(
                height: 1.2,
                color: Colors.black38,
                thickness: 1,
              ),
              ListTile(
                title: const Text('Settings'),
                leading: const Icon(Icons.settings),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  Listscreen(username: widget.username, password: widget.password, token: widget.token,index:2),
                      ));
                  // Handle navigation to profile page
                },
              ),
              Divider(
                height: 1.2,
                color: Colors.black38,
                thickness: 1,
              ),
              ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.logout),
                onTap: () async {
                  // SharedPreferences prefrences =
                  // await SharedPreferences.getInstance();
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Logout'),
                          content:
                          const Text('Are You Want Confirm to Logout ..'),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () async {
                                SharedPreferences prefrences =
                                await SharedPreferences.getInstance();
                                await prefrences.remove("username");
                                await prefrences.remove("password");
                                await prefrences.remove("token");
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>  LoginScreen(),
                                    ));
                              },
                              child: const Text('OK'),
                            ),
                            ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Cancel')),
                          ],
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
      drawerEdgeDragWidth: 0, // Disable edge drag to open the drawer
      body: Center(
        child: _selectedIndex == 0
            ? WelcomeScreen(
                username: widget.username,
                password: widget.password,
                token: widget.token)
            : _selectedIndex == 1
                ? Profile(
                    username: widget.username,
                    password: widget.password,
                    token: widget.token):_selectedIndex==2?SettingsScreen(username: widget.username,
            password: widget.password,
            token: widget.token)
                : _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
