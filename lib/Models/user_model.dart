import 'package:pharma_net/Models/AccountModel.dart';

class UserModel {
  int? id;
  AccountModel? account;
  String? age;
  String? gender;

  ////////
  UserModel({this.id, required this.account, this.age, this.gender});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    account = json['account'];
    age = json['age'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'account': account,
        'age': age,
        'gender': gender,
      };
}
