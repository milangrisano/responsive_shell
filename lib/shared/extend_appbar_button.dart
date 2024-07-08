import 'package:flutter/material.dart';

class ExtendAppBarButton extends StatelessWidget {
  final String text;
  final Function onPress;
    
  const ExtendAppBarButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        // disabledForegroundColor: Colors.red.withOpacity(0.38),
      ),
      child: Text(text)
    );
  }
}