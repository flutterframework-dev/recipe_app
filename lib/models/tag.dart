import 'dart:convert';

Tag tagFromJson(String str) => Tag.fromJson(json.decode(str));

String tagToJson(Tag data) => json.encode(data.toJson());

class Tag {
  Tag({
    this.name,
    this.image,
  });

  String name;
  dynamic image;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
