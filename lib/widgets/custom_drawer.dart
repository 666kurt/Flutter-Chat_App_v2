import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';
import '../screens/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // logo
          Container(
            margin: EdgeInsets.only(top: 100, bottom: 25),
            child: Center(
              child: Icon(
                Icons.message,
                size: 44,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // home link
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text(
                "HOME",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          // setting link
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text(
                "SETTING",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
          ),

          // logout
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text(
                "LOGOUT",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
