import 'package:flutter/material.dart';
import 'package:demo/screens/login_screen.dart'; // Your login page
import 'package:demo/screens/register_screen.dart'; // Your register page
import 'package:demo/screens/fill_profile_screen.dart'; // Your fill profile screen
import 'package:demo/screens/base_screen.dart'; // Your home screen
import 'package:demo/screens/onboarding_screen.dart'; // Your onboarding screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      theme: ThemeData(
        // Using colorScheme to define primary and secondary colors
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.amber, // Secondary color (accent)
        ),
        scaffoldBackgroundColor:
            Color(0xFFF5F7FA), // Light background color for the entire app
        fontFamily: 'Poppins', // Custom font if needed
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Button color across the app
            textStyle: TextStyle(
                fontWeight: FontWeight.bold), // Text style for buttons
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      initialRoute: '/onboarding', // Set the initial route to onboarding screen
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/fillProfile': (context) => FillProfileScreen(),
        '/home': (context) => BaseScreen(),
      },
    );
  }
}
