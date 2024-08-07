import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String Name;

  const UserModel({
    required this.id,
    required this.Name,
  });

  toJson(){
    return {
      "Name": Name,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
        id: document.id,
        Name: data["Name"]);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserModel &&
              runtimeType == other.runtimeType &&
              Name == other.Name &&
              id == other.id;

  @override
  // TODO: implement hashCode
  int get hashCode => id.hashCode ^ Name.hashCode;
}