import 'package:cloud_firestore/cloud_firestore.dart';

class Comment{
  String Username;
  String comment;
  final datePublished;
  List likes;
  String profilePhoto;
  String uid;
  String id;
  Comment({
    required this.Username,
    required this.comment,
    required this.datePublished,
    required this.likes,
    required this.profilePhoto,
    required this.uid,
    required this.id,
  });
  Map<String,dynamic> toJson ()=>{
    "Username":Username,
    "comment":comment,
    "datePublished":datePublished,
    "likes":likes,
    "profilePhoto":profilePhoto,
    "uid":uid,
    "id":id,
  };
  static Comment fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;
    return Comment(Username: snapshot["Username"], comment: snapshot["comment"], datePublished: snapshot["datePublished"], likes: snapshot["likes"], profilePhoto: snapshot["profilePhoto"], uid: snapshot["uid"], id: snapshot["id"]);
  }
}