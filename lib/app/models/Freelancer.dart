// ignore_for_file: file_names, constant_identifier_names

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:raw/app/models/BadTypeException.dart';
import 'package:raw/app/models/Package.dart';
import 'package:raw/app/models/user.dart';

enum WorkArea { INDOOR, OUTDOOR }

enum FreelancerTypes { PHOTOGRAPHER, VIDEOGRAPHER, STUDIO, NONE }

class Freelancer {
  List<FreelancerTypes>? freelancerTypes;
  List<Package>? packages;
  int? yearsExperience;
  int? numberOfCustomers;
  double? rating;
  String? aboutFreelancer;
  List<String>? portfolios;
  User? user;
  List<WorkArea>? workAreas;
  String? description;

  Freelancer({
    this.freelancerTypes,
    this.packages,
    this.yearsExperience,
    this.numberOfCustomers,
    this.rating,
    this.aboutFreelancer,
    this.portfolios,
    this.user,
    this.workAreas,
    this.description,
  });

  Freelancer copyWith({
    String? email,
    String? name,
    String? image,
    List<FreelancerTypes>? freelancerTypes,
    List<Package>? packages,
    int? yearsExperience,
    int? numberOfCustomers,
    double? rating,
    String? aboutFreelancer,
    List<String>? portfolios,
    User? user,
    List<WorkArea>? workAreas,
    String? description,
  }) =>
      Freelancer(
        freelancerTypes: freelancerTypes ?? this.freelancerTypes,
        packages: packages ?? this.packages,
        yearsExperience: yearsExperience ?? this.yearsExperience,
        numberOfCustomers: numberOfCustomers ?? this.numberOfCustomers,
        rating: rating ?? this.rating,
        aboutFreelancer: aboutFreelancer ?? this.aboutFreelancer,
        portfolios: portfolios ?? this.portfolios,
        user: user ?? this.user,
        workAreas: workAreas ?? this.workAreas,
        description: description ?? this.description,
      );

  Map<String, dynamic> toMap() => {
        'freelancerTypes': freelancerTypes,
        'packages': packages,
        'yearsExperience': yearsExperience,
        'numberOfCustomers': numberOfCustomers,
        'rating': rating,
        'aboutFreelancer': aboutFreelancer,
        'portfolios': portfolios,
        'user': user,
        'workAreas': workAreas,
        'description': description,
      };

  String toJson() => json.encode(toMap());

  factory Freelancer.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return Freelancer();

    List<dynamic> ft = map['freelancerTypes'] as List<dynamic>;
    List<FreelancerTypes> fl2 = [];

    ft.forEach((dynamic element) => fl2.add(FreelancerTypes.values.firstWhere((e) => describeEnum(e) == element.toUpperCase())));

    List<FreelancerTypes>? allowedTypes = map['allowedTypes'];

    if (allowedTypes != null &&
        !(allowedTypes.any((FreelancerTypes item) => fl2.contains(item)))) {
      throw BadTypeException();
    }

    for (var element in ft) {
      FreelancerTypes type = FreelancerTypes.values.firstWhere((e) => describeEnum(e) == element.toUpperCase());

      fl2.add(type);
    }

    List<dynamic> was = map['workAreas'] as List<dynamic>;
    List<WorkArea> was2 = [];
    for (var element in was) {
      was2.add(WorkArea.values.firstWhere((e) => describeEnum(e) == element.toUpperCase()));
    }

    List<String> portfolios = [];
    map['portfolios'].forEach((element) {
      portfolios.add(element);
    });

    return Freelancer(
      aboutFreelancer: map['aboutFreelancer'],
      freelancerTypes: fl2,
      numberOfCustomers: map['numberOfCustomers'],
      packages: map['packages'],
      portfolios: portfolios,
      rating: map['rating'].toDouble(),
      yearsExperience: map['yearsExperience'],
      user: map['user'],
      workAreas: was2,
      description: map['description'],
    );
  }
  factory Freelancer.fromJson(String source) => Freelancer.fromMap(json.decode(source));
}
