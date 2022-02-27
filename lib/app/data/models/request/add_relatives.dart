import 'dart:convert';

import 'package:aaj_tak/app/data/models/request/birth_details.dart';
import 'package:aaj_tak/app/data/models/response/relatives_response.dart';

class AddRelatives {
  AddRelatives({
    required this.birthDetails,
    required this.birthPlace,
    this.firstName,
    this.lastName,
    this.relationId,
    this.gender,
  });

  BirthDetails birthDetails;
  BirthPlace birthPlace;
  String? firstName;
  String? lastName;
  int? relationId;
  String? gender;

  factory AddRelatives.fromJson(Map<String, dynamic> json) => AddRelatives(
        birthDetails: BirthDetails.fromJson(json["birthDetails"]),
        birthPlace: BirthPlace.fromJson(json["birthPlace"]),
        firstName: json["firstName"],
        lastName: json["lastName"],
        relationId: json["relationId"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "birthDetails": birthDetails.toJson(),
        "birthPlace": birthPlace.toJson(),
        "firstName": firstName,
        "lastName": lastName,
        "relationId": relationId,
        "gender": gender,
      };
}



/*class BirthPlace {
  BirthPlace({
    this.placeName,
    this.placeId,
  });

  String? placeName;
  String? placeId;

  factory BirthPlace.fromJson(Map<String, dynamic> json) => BirthPlace(
        placeName: json["placeName"],
        placeId: json["placeId"],
      );

  Map<String, dynamic> toJson() => {
        "placeName": placeName,
        "placeId": placeId,
      };
}*/
