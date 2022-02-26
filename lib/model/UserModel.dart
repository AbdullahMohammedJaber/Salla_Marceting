import 'package:flutter/cupertino.dart';

class UserModel {
  String email;
  String uId;

  UserModel({
    @required this.email,
    @required this.uId,
  });
  UserModel.fromjson(Map<String, dynamic> json) {
    email = json['email'];
    uId = json['uId'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'email': email,
    };
  }
}
