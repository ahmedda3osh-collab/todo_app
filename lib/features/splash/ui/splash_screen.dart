

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/auth/data/models/user_model.dart';
import 'package:todo_app/features/auth/ui/auth_screen.dart';
import 'package:todo_app/features/home_screen/ui/home_screen.dart';
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
Widget nextRoute(){
 
  if(Hive.box<UserModel>(AppConstant.userBox).isEmpty){
    return AuthScreen();
  }else{
    return HomeScreen();
  }
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