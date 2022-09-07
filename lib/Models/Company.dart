class Company {
  late int id;
  late String name;
  Company({
    required this.id,
    required this.name,
  });

  // from json

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  // to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
