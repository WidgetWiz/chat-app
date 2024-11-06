import 'package:flutter/material.dart';

import '../pages/setings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Column(
          children: [
            //logo
            DrawerHeader(
                child: Center(
              child: Image.asset(
                "assets/images/128px-Cib_Logo.svg.png",
              ),
            )),

            //homeList
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("Home"),
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onTap: () {
                  //pop the drawer
                  Navigator.pop(context);
                },
              ),
            ),

            //Settings
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("Settings"),
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onTap: () {
                  //pop the drawer
                  Navigator.pop(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ));
                },
              ),
            ),

            //logout
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("Logout"),
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          ],
        ));
  }
}
