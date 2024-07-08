import 'package:flutter/material.dart';
import 'package:responsive_app/shared/custom_drawer_header.dart';
import 'package:responsive_app/shared/drawer_list_tile.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),
      endDrawer: const Drawer(
        child: Column(
          children: [
            CustomDrawerHeader(),
            DrawerListTile(
              icon: Icons.home,
              name: Text('Home'),
            ),
            DrawerListTile(
              icon: Icons.people,
              name: Text('About'),
            ),
            DrawerListTile(
              icon: Icons.money,
              name: Text('Pricing'),
            ),
            DrawerListTile(
              icon: Icons.mail_outline_outlined,
              name: Text('Contact'),
            ),
            DrawerListTile(
              icon: Icons.location_on,
              name: Text('Location'),
            ),
          ],
        ),

      ),
    );
  }
}
