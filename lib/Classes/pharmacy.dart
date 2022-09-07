import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class pharmacy {
  String name;
  Position location;
  double phone;
  pharmacy({required this.name, required this.location, required this.phone});
  int distance(Position p) {
    int d = 0;
    return d;
  }
}
