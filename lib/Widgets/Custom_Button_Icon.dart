import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButtonIcon({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 350,
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
      backgroundColor:  Color.fromARGB(255, 46, 190, 96),
      minimumSize: Size(double.infinity, 55),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
        ),
        onPressed: onPressed,
        child: Icon(
      Icons.arrow_forward_ios,
      color: Colors.white,
      size: 25,
        ),
      ),
    );
  }
}