
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final Text name;
  const DrawerListTile({
    super.key,
    required this.icon,
    required this.name
  });  

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(icon),
      title: name,
    );
  }
}