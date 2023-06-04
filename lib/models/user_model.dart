

import '../data_provider/db_helper.dart';

class UserModel{
  int? id;
  String? name;
  String? email;
  String? pass;
  String? number;

  UserModel({this.id, this.name, this.email, this.pass, this.number});

  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      id: map[DbHelper.USER_ID],
      name: map[DbHelper.USER_NAME],
      email: map[DbHelper.USER_EMAIL],
      pass: map[DbHelper.USER_PASS],
      number: map[DbHelper.USER_MOBILE_NO],
    );
  }

  Map<String, dynamic> toMap(){
    return{
      DbHelper.USER_ID : id,
      DbHelper.USER_NAME : name,
      DbHelper.USER_EMAIL : email,
      DbHelper.USER_PASS : pass,
      DbHelper.USER_MOBILE_NO : number
    };
  }
}