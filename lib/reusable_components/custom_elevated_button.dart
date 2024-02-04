import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;
  String title;
  Color color;
  CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          )),
    );
  }
}
