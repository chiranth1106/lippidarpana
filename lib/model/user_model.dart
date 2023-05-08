import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  String name;
  String email;
  String bio;
  String profilePic;
  String createdAt;
  String phoneNumber;
  String uid;
  //String inputUrl;

  UserModel({
    required this.name,
    required this.email,
    required this.bio,
    required this.profilePic,
    required this.createdAt,
    required this.phoneNumber,
    required this.uid,
   // required this.inputUrl,
  });

  //from
  factory UserModel.fromMap(Map<String, dynamic>map){
    return UserModel(
        name:  map['name'] ?? '',
        email: map['email'] ?? '',
        bio: map['bio'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        createdAt: map['createdAt']  ?? '',
        profilePic: map['profilePic'] ?? '',
        uid: map['uid'] ?? '',
        //inputUrl:map['inputUrl']?? '',
    );

    }

  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "email":email,
      "uid":uid,
      "bio":bio,
      "profilePic":profilePic,
      "phoneNumber":phoneNumber,
      "createdAt":createdAt,
      //"inputUrl":inputUrl,
    };

  }
  }
