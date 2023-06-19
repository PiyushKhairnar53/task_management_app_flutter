
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_management_app/views/screens/home_screen.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: const <Widget>[
          Icon(
            FontAwesomeIcons.checkCircle,
                              size: 45,color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "TaskManager",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      nextScreen: const HomeScreen(),
      duration: 3000,
      backgroundColor: const Color(0xFF0747a6),
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}