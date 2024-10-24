import 'package:flutter/material.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an Account? '),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text(
            'SIGN UP',
            style: TextStyle(
              color: Color(0xFF1E4FF1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
