import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/pharmacy.dart';

class product {
  String image;
  String engname;
  String category;
  bool prescription;
  String caliber;
  String formula;
  String details;
  String company_id;
  String phamacological_form;
  double price;
  pharmacy pharm;
  bool added;

  product(
      {required this.image,
      required this.engname,
      required this.category,
      required this.prescription,
      required this.caliber,
      required this.formula,
      required this.details,
      required this.company_id,
      required this.phamacological_form,
      required this.price,
      required this.pharm,
      required this.added});
}
