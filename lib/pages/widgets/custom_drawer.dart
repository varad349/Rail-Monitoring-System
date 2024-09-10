import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "John Doe",
              style: TextStyle(color: Colors.white), // Text color for dark theme
            ),
            accountEmail: Text(
              "johndoe@example.com",
              style: TextStyle(color: Colors.white70), // Text color for dark theme
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.lightBlueAccent,
              child: ClipOval(
                child: Image.network(
                  'https://i.pravatar.cc/300',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black54, // Dark background color
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.orangeAccent), // Icon color
            title: Text(
              'Profile',
              style: TextStyle(color: Color.fromARGB(255, 119, 219, 43)), // Text color
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.lightBlueAccent), // Icon color
            title: Text(
              'About',
              style: TextStyle(color: Color.fromARGB(255, 119, 219, 43)), // Text color
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.orangeAccent), // Icon color
            title: Text(
              'Settings',
              style: TextStyle(color: Color.fromARGB(255, 119, 219, 43)), // Text color
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
