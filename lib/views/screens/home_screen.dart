import 'package:flutter/material.dart';
import 'package:project1/constants.dart';
import 'package:project1/views/widgets/custome_icon.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int  pageIndx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      BottomNavigationBar(onTap: (value) {
        setState(() {
          pageIndx = value;
        });
      },currentIndex: pageIndx,backgroundColor: backgroundColor,type: BottomNavigationBarType.fixed,selectedItemColor: Colors.white,unselectedItemColor: Colors.grey,items: [
        BottomNavigationBarItem(icon: const Icon(Icons.home,size: 30,),label: "Home"),
        BottomNavigationBarItem(icon: const Icon(Icons.search,size: 30,),label: "Search"),
        BottomNavigationBarItem(icon: const CustomeIcon(),label: ""),
        BottomNavigationBarItem(icon: const Icon(Icons.message,size: 30,),label: "Message"),
        BottomNavigationBarItem(icon: const Icon(Icons.person,size: 30,),label: "Profile"),
      ],),
      body:  pages[pageIndx],
    );
  }
}