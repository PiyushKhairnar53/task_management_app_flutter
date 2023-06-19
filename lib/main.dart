import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/views/screens/home_screen.dart';
import 'package:task_management_app/views/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    const Map<int, Color> color =
    {
      50:Color.fromRGBO(7,71,166, .1),
      100:Color.fromRGBO(7,71,166, .2),
      200:Color.fromRGBO(7,71,166, .3),
      300:Color.fromRGBO(7,71,166, .4),
      400:Color.fromRGBO(7,71,166, .5),
      500:Color.fromRGBO(7,71,166, .6),
      600:Color.fromRGBO(7,71,166, .7),
      700:Color.fromRGBO(7,71,166, .8),
      800:Color.fromRGBO(7,71,166, .9),
      900:Color.fromRGBO(7,71,166, 1),
    };
    
    String hexColor = "#0747a6";
    // MaterialColor color = MaterialColor(0xFF000000,color);

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF0747A6,color),
      ),
      initialRoute: "/splash",
      getPages: [
        GetPage(name: "/splash", page: () => const SplashScreen()),
        GetPage(name: "/home", page: () => const HomeScreen()),
      ],
    );
  }
}

