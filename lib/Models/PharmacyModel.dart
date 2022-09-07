import 'AccountModel.dart';

class PharmacyModel {
  int? id;
  AccountModel? account;
  String? active;
  String? address;
  String? address_latitude;
  String? address_longitude;

  ////////
  PharmacyModel(
      {this.id,
      required this.account,
      this.active,
      this.address,
      this.address_latitude,
      this.address_longitude});

  PharmacyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    account = json['account'];
    active = json['active'];
    address = json['address'];
    address_latitude = json['address_latitude'];
    address_longitude = json['address_longitude'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'account': account,
        'active': active,
        'address': address,
        'address_latitude': address_latitude,
        'address_longitude': address_longitude,
      };
}
