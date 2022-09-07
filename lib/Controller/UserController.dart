import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharma_net/Models/PharmacyModel.dart';
import 'package:pharma_net/Models/user_model.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user_model.dart';
import '../Network/api.dart';
import '../Screens/homepage.dart';

class UserController {
  Future<String> add_user(UserModel userModel) async {
    var res = await Network().auth(userModel.toJson(), '/add_user');
    print(res.statusCode);
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      return 'success';
    }
    return '';
  }

  Future<String> login(String email, String password, String type) async {
    var data = {"email": email, "password": password, "type": type};
    print('res.statusCode');
    var res = await Network().auth(data, '/login');
    print(res.statusCode);
    var body = json.decode(res.body);

    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // localStorage.setString('token', json.encode(body['token']));
    // localStorage.setString('user', json.encode(body['user']));

    if (res.statusCode == 200) {
      print(body);
      return 'success';
    } else {
      print(body);
    }

    return "kk";
  }

  Future<String> forgetPassword(String email) async {
    var res = await Network().auth('/forget_password', email);

    var body = json.decode(res.body);

    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // localStorage.setString('token', json.encode(body['token']));
    // localStorage.setString('user', json.encode(body['user']));

    if (res.statusCode == 200) {
      print(body);
      return 'success';
    } else {
      print(body);
    }

    return "kk";
  }

  Future<String> code(double code) async {
    var res = await Network().auth('/code', code);

    var body = json.decode(res.body);

    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // localStorage.setString('token', json.encode(body['token']));
    // localStorage.setString('user', json.encode(body['user']));

    if (res.statusCode == 200) {
      print(body);
      return 'success';
    } else {
      print(body);
    }

    return "kk";
  }

  Future<String> resetPassword(String password) async {
    var res = await Network().auth('/change_password', password);

    var body = json.decode(res.body);

    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // localStorage.setString('token', json.encode(body['token']));
    // localStorage.setString('user', json.encode(body['user']));

    if (res.statusCode == 200) {
      print(body);
      return 'success';
    } else {
      print(body);
    }

    return "kk";
  }

  Future<List<PharmacyModel>> getAllPharmacies() async {
    var res = await Network().getData('/all_pharmacy');

    if (res.statusCode == 200) {
      print("jj");
      var json = jsonDecode(res.body);
      print(json);
      List pharmacies = json;
      // return pharmacies.map((pharmacy) => PharmacyModel.fromJson(product)).toList();
    }
    return [];
  }
}
