import 'package:client/controller/signin_controller.dart';
import 'package:client/screens/home.dart';
import 'package:client/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MyApp());
  Get.put(SigninController());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        // home: SignUpScreen()
        home: Home());
  }
}
