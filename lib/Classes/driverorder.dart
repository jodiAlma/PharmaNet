import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/pharmacy.dart';
import 'package:pharma_net/Classes/customer.dart';

class driverorder {
  pharmacy pharma;
  customer c;
  double earning;
  double distance;
  driverorder(
      {required this.pharma,
      required this.c,
      required this.earning,
      required this.distance});
}
