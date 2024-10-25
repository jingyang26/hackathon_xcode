import 'package:flutter/material.dart';
import 'package:demo/widgets/app_logo.dart';
import 'package:demo/widgets/register_form.dart';
import 'package:demo/widgets/sign_in_link.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _register() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      // Here you can handle registration logic, like sending data to backend
      print('Email: $email, Password: $password');

      // Navigate to FillProfileScreen after successful registration
      Navigator.pushReplacementNamed(context, '/fillProfile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA), // Light background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),

                // App Logo and Title
                const AppLogo(),
                SizedBox(height: 30),

                // Registration Form
                RegisterForm(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  isPasswordVisible: _isPasswordVisible,
                  onPasswordToggle: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  onRegister: _register,
                ),
                SizedBox(height: 20),

                // Sign In link
                const SignInLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
