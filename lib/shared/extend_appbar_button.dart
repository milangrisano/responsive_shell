import 'package:flutter/material.dart';

class ExtendAppBarButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
    
  const ExtendAppBarButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
      child: Text(text)
    );
  }
}