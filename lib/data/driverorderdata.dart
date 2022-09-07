import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharma_net/Classes/driverorder.dart';
import 'package:pharma_net/Classes/pharmacy.dart';
import 'package:pharma_net/Classes/customer.dart';
import 'package:pharma_net/data/driverorderdata.dart';

List<driverorder> driverorderslist = [
  //child1
  new driverorder(
    pharma: pharmacy(name: "pharm1", location: Position(), phone: 00),
    c: customer(
        email: "YaraAlAli@gmail.com",
        password: "123456",
        location: Position(),
        phone: "101010"),
    earning: 25.5,
    distance: 25,
  ),
//child2
  new driverorder(
    pharma: pharmacy(name: "pharm1", location: Position(), phone: 11),
    c: customer(
        email: "YaraAlAli@gmail.com",
        password: "123456",
        location: Position(),
        phone: "101010"),
    earning: 25.5,
    distance: 25,
  ),
//child3
  new driverorder(
    pharma: pharmacy(name: "pharm1", location: Position(), phone: 11),
    c: customer(
        email: "YaraAlAli@gmail.com",
        password: "123456",
        location: Position(),
        phone: "101010"),
    earning: 25.5,
    distance: 25,
  ),
];
