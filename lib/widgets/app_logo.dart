import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png', // Make sure the logo.png exists in this path
          height: 80,
        ),
        SizedBox(height: 10),
        Text(
          'Getting Started !',
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2C37),
          ),
        ),
      ],
    );
  }
}
