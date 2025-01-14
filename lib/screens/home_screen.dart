import 'package:demo/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:demo/widgets/search_field.dart';
import 'package:demo/widgets/tutor_card.dart'; // Define a TutorCard widget for slidable tutors
import 'package:demo/models/tutor.dart'; // Define Tutor model
import 'package:demo/models/course.dart';
import 'package:demo/widgets/course_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Tutor> tutors = [
    Tutor(name: "Jotaro", rating: 4.8, imageUrl: 'assets/images/tutor.jpg', course: 'Physics'),
    Tutor(name: "Ali bin Abu", rating: 5.0, imageUrl: 'assets/images/tutor.jpg', course: 'Add Math'),
    Tutor(name: "Suzana Li", rating: 4.8, imageUrl: 'assets/images/tutor.jpg', course: 'Coding'),
  ];

  final List<Course> courses = [
    
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                "Recommended Tutors",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 160, enlargeCenterPage: true, enableInfiniteScroll: true),
              items: tutors.map((tutor) {
                return TutorCard(tutor: tutor); // Create a custom TutorCard widget
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore Resources",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add action for See All button
                    },
                    child: const Text("See All", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: courses.map((course) => CourseCard(course: course)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            kPrimaryLight,
            kPrimaryColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,\nGood Morning",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome back!",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ],
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/malaysia-flag-1.jpg'), // Fixed asset path
                radius: 25,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SearchField(),
        ],
      ),
    );
  }
}
