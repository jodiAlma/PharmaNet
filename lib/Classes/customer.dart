import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class customer {
  String email;
  String password;
  Position location;
  String phone;
  customer(
      {required this.email,
      required this.password,
      required this.phone,
      required this.location});
  int distance(Position p) {
    int d = 0;
    return d;
  }
}
