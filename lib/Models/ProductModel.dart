import 'package:pharma_net/Models/Categoury.dart';
import 'package:pharma_net/Models/Classification_m.dart';
import 'package:pharma_net/Models/Company.dart';

class ProductModel {
  late int id;
  late String arabName;
  late String engName;
  late List<Classification_m> classifications;
  late List<Company> company;
  late List<Categoury> categoury;
  late int pharmacological_form;
  late String formula;
  late String drug_details;
  late String prescription;
  late String image;
  String? token;
  ProductModel({
    required this.id,
    required this.arabName,
    required this.engName,
    required this.classifications,
    required this.company,
    required this.categoury,
    required this.pharmacological_form,
    required this.formula,
    required this.drug_details,
    required this.prescription,
    required this.image,
  });

  // from json

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arabName = json['arabName'];
    engName = json['engName'];
    pharmacological_form = json['pharmacological_form'];
    formula = json['formula'];
    drug_details = json['drug_details'];
    prescription = json['prescription'];
    image = json['image'];

    List<Classification_m> Classification_id = [];
    for (int i = 0; i < json['Classification_id'].length; i++) {
      Classification_id.add(Classification_m.fromJson(json['id']));
    }
    classifications = Classification_id;

    List<Company> company_id = [];
    for (int i = 0; i < json['company_id'].length; i++) {
      company_id.add(Company.fromJson(json['id']));
    }
    company = company_id;

    List<Categoury> categoury_id = [];
    for (int i = 0; i < json['categoury_id'].length; i++) {
      categoury_id.add(Categoury.fromJson(json['id']));
    }
    categoury = categoury_id;
  }

  // to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'arabName': arabName,
        'engName': engName,
        'classifications_id': classifications,
        'company_id': company,
        'categoury_d': categoury,
        'pharmacological_form': pharmacological_form,
        'formula': formula,
        'drug_details': drug_details,
        'prescription': prescription,
        'image': image,
      };
}
