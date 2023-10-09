import 'package:flutter/material.dart';
import 'package:sky_scrapper/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Image(image: AssetImage('assets/img/sun.png'))),
    );
  }
}
