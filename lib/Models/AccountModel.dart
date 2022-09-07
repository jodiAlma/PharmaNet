class AccountModel {
  int? id;
  late String email;
  int? phone;
  late String password;
  late String type;
  String? token;
  AccountModel(
      {this.id,
      required this.email,
      required this.password,
      this.phone,
      required this.type});

  // from json

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    type = json['type'];
    token = json['token'];
  }

  // to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'type': type,
        'phone': phone,
        'token': token,
      };
}
