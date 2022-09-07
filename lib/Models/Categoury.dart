class Categoury {
  late int id;
  late String name;
  Categoury({
    required this.id,
    required this.name,
  });

  // from json

  Categoury.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  // to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
