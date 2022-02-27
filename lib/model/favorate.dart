import 'package:flutter/material.dart';

class FavsAttr {
  String id;
  String title;
  double price;
  String imageUrl;

  FavsAttr({this.id, this.title, this.price, this.imageUrl});
  FavsAttr.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    imageUrl = json['imageUrl'];
  }
}
