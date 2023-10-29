import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controller/search_controller.dart';
import 'package:project1/models/user.dart';
import 'package:project1/views/screens/profile_screen.dart';

class SearchScreen extends StatelessWidget {
 SearchScreen({super.key});

 final SearchControllerUser searchControllerUser = Get.put(SearchControllerUser());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: TextFormField(
              decoration: const InputDecoration(
                filled: false,
                hintText: "search",
                hintStyle: TextStyle(fontSize: 18,color: Colors.white)
              ),
              onFieldSubmitted: (value) => searchControllerUser.searchUser(value),
            ),
          ),
          body: searchControllerUser.searchedUsers.isEmpty? const Center(
            child: Text("search for user",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
          ): ListView.builder(itemCount: searchControllerUser.searchedUsers.length,itemBuilder: (context,index){
            User user = searchControllerUser.searchedUsers[index];
           return InkWell(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(uid: user.uid))),child: ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(user.profilePhoto),),
            title: Text(user.name,style: const TextStyle(fontSize: 18,color: Colors.white),),
           ),);
          })
        );
      }
    );
  }
}