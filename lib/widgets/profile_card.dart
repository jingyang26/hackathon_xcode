import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String fullName;
  final String email;

  const ProfileCard({
    Key? key,
    required this.fullName,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            fullName,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2C37),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            email,
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF6A6A6A),
            ),
          ),
          SizedBox(height: 20.0),
          Divider(color: Colors.grey[300]),
        ],
      ),
    );
  }
}
