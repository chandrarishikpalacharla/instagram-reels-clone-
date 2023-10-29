import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/constants.dart';
import 'package:project1/controller/auth_controller.dart';
import 'package:project1/views/screens/auth/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAhRmyD5DLrbryugXgeZWcrIFjKPGUpAmk",
        appId: "1:222933158490:android:ee415cbc06e60baf3b2663",
        messagingSenderId: "222933158490",
        storageBucket: "project1-bed4c.appspot.com",
        projectId: "project1-bed4c",
      ),
    );
  } else if (Platform.isIOS) {
    await Firebase.initializeApp();
  }

  // Initialize GetX controller after Firebase initialization
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tik Tok',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      home: LoginScreen(),
    );
  }
}

