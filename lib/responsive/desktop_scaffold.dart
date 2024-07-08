import 'package:flutter/material.dart';
import 'package:responsive_app/shared/extend_appbar_button.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('Name Page'),
        actions:  [
          ExtendAppBarButton(text: 'About', onPress: (){},),
          ExtendAppBarButton(text: 'Pricing', onPress: (){},),
          ExtendAppBarButton(text: 'Contact', onPress: (){},),
          ExtendAppBarButton(text: 'Location', onPress: (){},),
          const SizedBox(width: 20),          
        ],
        // elevation: 10,
      ),
    );
  }
}

