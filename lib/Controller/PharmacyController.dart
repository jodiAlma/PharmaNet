import '../Models/ProductModel.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Network/api.dart';

class PharmacyController {
  Future<String> sale(double discount, int medicine_id) async {
    var data = {'discount': discount, 'medicine_id': medicine_id};

    var res = await Network().auth(data, '/sale');
    return "";
  }
}
