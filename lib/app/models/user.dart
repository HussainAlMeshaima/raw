// ignore_for_file: file_names

import 'dart:convert';

class User {
  final String? name;
  final String? email;
  final String? image;
  final bool? isAdmin;

  User({
    this.email,
    this.name,
    this.image,
    this.isAdmin = false,
  });

  User copyWith({
    String? email,
    String? name,
    String? image,
    bool isAdmin = false,
  }) =>
      User(
        email: email ?? this.email,
        name: name ?? this.name,
        image: image ?? this.image,
        isAdmin: isAdmin,
      );

  Map<String, dynamic> toMap() => {
        'email': email,
        'name': name,
        'image': image,
        'isAdmin': isAdmin,
      };

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic>? map) => User(
        email: map?['email'] ?? '',
        name: map?['name'] ?? '',
        image: map?['image'] ?? '',
        isAdmin: (map?['isAdmin'] ?? '') as bool?,
      );
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(email: $email, name: $name, image: $image, isAdmin: $isAdmin)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.email == email &&
        other.name == name &&
        other.isAdmin == isAdmin &&
        other.image == image;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode;
}
