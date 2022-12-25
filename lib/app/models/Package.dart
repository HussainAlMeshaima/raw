// ignore_for_file: file_names

import 'dart:convert';

class Package {
  String? image;
  String? name;
  String? description;
  double price = 0.0;
  int count = 1;

  Package({
    this.image,
    this.name,
    this.description,
    this.price = 0.0,
    this.count = 1,
  });

  Package copyWith({
    String? image,
    String? name,
    String? description,
    double price = 0.0,
    int count = 1,
  }) =>
      Package(
        image: image ?? this.image,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price,
        count: count,
      );

  factory Package.fromMap(Map<String, dynamic>? map) => Package(
        image: map?['image'] ?? '',
        name: map?['name'] ?? '',
        description: map?['description'] ?? '',
        price: map?['price'] ?? 0,
        count: map?['count'] ?? 0,
      );
  factory Package.fromJson(String source) =>
      Package.fromMap(json.decode(source));
}
