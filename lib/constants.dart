import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project1/controller/auth_controller.dart';
import 'package:project1/views/screens/add_video_screen.dart';
import 'package:project1/views/screens/profile_screen.dart';
import 'package:project1/views/screens/search_screen.dart';
import 'package:project1/views/screens/video_screen.dart';

List pages=[
  VideoScreen(),
  SearchScreen(),
const  AddVideoScreen(),
  Text("messages Screen"),
  ProfileScreen(uid: authController.user.uid),

];

//
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// firebase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;