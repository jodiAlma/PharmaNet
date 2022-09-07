import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharma_net/Classes/pharmacy.dart';
import 'package:pharma_net/Classes/product.dart';
import 'package:pharma_net/data/proddata.dart';

List<product> productlist = [
  //child1
  new product(
      image: "images/product1.png",
      category: "images/delivery1.jpg",
      price: 1500,
      prescription: false,
      engname: "product1",
      caliber: "500",
      formula: "asrdg hubn lliivm ",
      details: "details details details details",
      company_id: " the syrian company",
      phamacological_form: " cream ",
      pharm: pharmacy(name: "pharm1", location: Position(), phone: 44),
      added: false),
//child2
  new product(
      image: "images/product1.png",
      category: "images/delivery1.jpg",
      price: 1000,
      prescription: false,
      engname: "product2",
      caliber: "500",
      formula: "asrdg hubn lliivm ",
      details: "details details details details",
      company_id: " the syrian company",
      phamacological_form: " cream ",
      pharm: pharmacy(name: "pharm1", location: Position(), phone: 11),
      added: false),
//child3
  new product(
      image: "images/product1.png",
      category: "images/delivery1.jpg",
      price: 1250000,
      prescription: false,
      engname: "product3",
      caliber: "500",
      formula: "asrdg hubn lliivm ",
      details: "details details details details",
      company_id: " the syrian company",
      phamacological_form: " cream ",
      pharm: pharmacy(name: "pharm1", location: Position(), phone: 11),
      added: false),
];
