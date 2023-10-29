import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project1/constants.dart';
import 'package:project1/models/user.dart';

class SearchControllerUser extends GetxController{
  final Rx<List<User>> _searchUsers = Rx<List<User>>([]);
  List<User> get searchedUsers => _searchUsers.value;

  searchUser(String typeUser) async{
    _searchUsers.bindStream(firestore.collection("users").where("name",isGreaterThanOrEqualTo: typeUser).snapshots().map((QuerySnapshot query) {
      List<User> retVal = [];
      for(var elem in query.docs){
        retVal.add(User.fromSnap(elem));
      }
      return retVal;
    }));
  }
}