import 'package:flutter/material.dart';
import 'package:demo/widgets/app_logo.dart';
import 'package:demo/widgets/login_form.dart';
import 'package:demo/widgets/sign_up_link.dart';
import 'package:demo/models/initial_user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      // Validate the credentials
      if (email == InitialUser.email && password == InitialUser.password) {
        // Successful login
        print('Login successful!');
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Failed login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid email or password'),
            backgroundColor: Colors.red,
          ),
        );
      }
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

                // App Logo
                const AppLogo(),
                SizedBox(height: 30),

                // Login Form
                LoginForm(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  isPasswordVisible: _isPasswordVisible,
                  rememberMe: _rememberMe,
                  onPasswordToggle: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  onRememberMeToggle: (value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                  onLogin: _login,
                ),
                SizedBox(height: 20),

                // Sign Up link
                const SignUpLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
