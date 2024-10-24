import 'package:flutter/material.dart';
import 'package:demo/widgets/app_logo.dart';
import 'package:demo/widgets/profile_form.dart';

class FillProfileScreen extends StatefulWidget {
  @override
  _FillProfileScreenState createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String? _selectedGender;
  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  // Function to show date picker for Date of Birth
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _continue() {
    if (_formKey.currentState!.validate()) {
      // Here you can handle profile saving logic
      print('Full Name: ${_fullNameController.text}');
      print('Nick Name: ${_nickNameController.text}');
      print('Date of Birth: ${_dobController.text}');
      print('Email: ${_emailController.text}');
      print('Phone Number: ${_phoneNumberController.text}');
      print('Gender: $_selectedGender');

      // Navigate to the next screen if necessary
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA), // Light background color
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F7FA), // Match background color
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1F2C37)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Fill Your Profile',
          style: TextStyle(
            color: Color(0xFF1F2C37),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),

                // App Logo
                const AppLogo(),
                SizedBox(height: 20),

                // Profile Form
                ProfileForm(
                  formKey: _formKey,
                  fullNameController: _fullNameController,
                  nickNameController: _nickNameController,
                  dobController: _dobController,
                  emailController: _emailController,
                  phoneNumberController: _phoneNumberController,
                  selectedGender: _selectedGender,
                  genderOptions: _genderOptions,
                  onGenderChanged: (String? newGender) {
                    setState(() {
                      _selectedGender = newGender;
                    });
                  },
                  onSelectDate: () => _selectDate(context),
                  onContinue: _continue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
