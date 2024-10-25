import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(18.0),
        backgroundColor: Color(0xFF1E4FF1), // Blue button color
      ),
      child: Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
    );
  }
}
