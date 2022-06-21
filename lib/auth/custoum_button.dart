import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String name;
  final Color backgroundcolor;
  CustomButton(
      {required this.name,
      required this.onpress,
      required this.backgroundcolor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      child: Text(name),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundcolor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
