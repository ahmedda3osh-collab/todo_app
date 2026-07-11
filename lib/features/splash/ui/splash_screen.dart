

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/features/auth/ui/auth_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed( Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context)=>AuthScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          "assets/icons/splash_icon.json",
         
        ),
      ),
    );
  }
}