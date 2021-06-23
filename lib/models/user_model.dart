import 'dart:convert';

class UserModel {
  final String name;
  final String? imageUrl;

  UserModel({
    required this.name,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() => {
        "name": name,
        "imageURL": imageUrl,
      };

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map["name"], imageUrl: map["imageURL"]);
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));
}
