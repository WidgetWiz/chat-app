import 'package:flutter/material.dart';
import '../pages/setings_page.dart';

class MyDrawer extends StatelessWidget {
  final String? currentUserEmail;

  const MyDrawer({super.key, this.currentUserEmail});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      child: ListView(
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
            ),
            child: Center(
              child: Image.asset("assets/images/128px-Cib_Logo.svg.png"),
            ),
          ),
          // Current User Email
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: Text(currentUserEmail ?? 'No Email Available'),
              leading: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onTap: () {
                // Pop the drawer
                Navigator.pop(context);
              },
            ),
          ),

          // Home List
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("Home"),
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Settings
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("Settings"),
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
            ),
          ),

          // Logout
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("Logout"),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
