/*
import 'dart:convert';

class RelativesData {
  RelativesData({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  String? apiName;
  RelativeData? data;

  factory RelativesData.fromJson(Map<String, dynamic> json) => RelativesData(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: RelativeData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": data?.toJson(),
      };
}

class RelativeData {
  RelativeData({
    this.pageNo,
    this.numberOfElements,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.allRelatives,
  });

  int? pageNo;
  int? numberOfElements;
  int? pageSize;
  int? totalElements;
  int? totalPages;
  List<AllRelative>? allRelatives;

  factory RelativeData.fromJson(Map<String, dynamic> json) => RelativeData(
        pageNo: json["pageNo"],
        numberOfElements: json["numberOfElements"],
        pageSize: json["pageSize"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        allRelatives: List<AllRelative>.from(
            json["allRelatives"].map((x) => AllRelative.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageNo": pageNo,
        "numberOfElements": numberOfElements,
        "pageSize": pageSize,
        "totalElements": totalElements,
        "totalPages": totalPages,
        "allRelatives":
            List<AllRelative>.from(allRelatives?.map((x) => x.toJson()) ?? []),
      };
}

class AllRelative {
  AllRelative({
    this.uuid,
    this.relation,
    this.relationId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.gender,
    this.dateAndTimeOfBirth,
    this.birthDetails,
    this.birthPlace,
  });

  String? uuid;
  String? relation;
  int? relationId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? fullName;
  String? gender;
  DateTime? dateAndTimeOfBirth;
  BirthDetails? birthDetails;
  BirthPlace? birthPlace;

  factory AllRelative.fromJson(Map<String, dynamic> json) => AllRelative(
        uuid: json["uuid"],
        relation: json["relation"],
        relationId: json["relationId"],
        firstName: json["firstName"],
        middleName: json["middleName"] == null ? null : json["middleName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        gender: json["gender"],
        dateAndTimeOfBirth: DateTime.parse(json["dateAndTimeOfBirth"]),
        birthDetails: BirthDetails.fromJson(json["birthDetails"]),
        birthPlace: BirthPlace.fromJson(json["birthPlace"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "relation": relation,
        "relationId": relationId,
        "firstName": firstName,
        "middleName": middleName == null ? null : middleName,
        "lastName": lastName,
        "fullName": fullName,
        "gender": gender,
        "dateAndTimeOfBirth": dateAndTimeOfBirth?.toIso8601String(),
        "birthDetails": birthDetails?.toJson(),
        "birthPlace": birthPlace?.toJson(),
      };
}

class BirthDetails {
  BirthDetails({
    this.dobYear,
    this.dobMonth,
    this.dobDay,
    this.tobHour,
    this.tobMin,
    this.meridiem,
  });

  int? dobYear;
  int? dobMonth;
  int? dobDay;
  int? tobHour;
  int? tobMin;
  String? meridiem;

  factory BirthDetails.fromJson(Map<String, dynamic> json) => BirthDetails(
        dobYear: json["dobYear"],
        dobMonth: json["dobMonth"],
        dobDay: json["dobDay"],
        tobHour: json["tobHour"],
        tobMin: json["tobMin"],
        meridiem: json["meridiem"],
      );

  Map<String, dynamic> toJson() => {
        "dobYear": dobYear,
        "dobMonth": dobMonth,
        "dobDay": dobDay,
        "tobHour": tobHour,
        "tobMin": tobMin,
        "meridiem": meridiem,
      };
}

class BirthPlace {
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
}
*/

// To parse this JSON data, do
//
//     final relativeData = relativeDataFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

RelativeData relativeDataFromJson(String str) =>
    RelativeData.fromJson(json.decode(str));

String relativeDataToJson(RelativeData data) => json.encode(data.toJson());

class RelativeData {
  RelativeData({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  String? apiName;
  Data? data;

  factory RelativeData.fromJson(Map<String, dynamic> json) => RelativeData(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.pageNo,
    this.numberOfElements,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.allRelatives,
  });

  num? pageNo;
  num? numberOfElements;
  num? pageSize;
  num? totalElements;
  num? totalPages;
  List<AllRelative>? allRelatives;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageNo: json["pageNo"],
        numberOfElements: json["numberOfElements"],
        pageSize: json["pageSize"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        allRelatives: List<AllRelative>.from(
            json["allRelatives"].map((x) => AllRelative.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageNo": pageNo,
        "numberOfElements": numberOfElements,
        "pageSize": pageSize,
        "totalElements": totalElements,
        "totalPages": totalPages,
        "allRelatives":
            List<dynamic>.from(allRelatives?.map((x) => x.toJson()) ?? []),
      };
}

class AllRelative {
  AllRelative({
    this.uuid,
    this.relation,
    this.relationId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.gender,
    this.dateAndTimeOfBirth,
    required this.birthDetails,
    this.birthPlace,
  });

  String? uuid;
  String? relation;
  num? relationId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? fullName;
  Gender? gender;
  DateTime? dateAndTimeOfBirth;
  BirthDetails birthDetails;
  BirthPlace? birthPlace;

  factory AllRelative.fromJson(Map<String, dynamic> json) => AllRelative(
        uuid: json["uuid"],
        relation: json["relation"],
        relationId: json["relationId"],
        firstName: json["firstName"],
        middleName: json["middleName"] == null ? null : json["middleName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        gender: genderValues.map[json["gender"]],
        dateAndTimeOfBirth: DateTime.parse(json["dateAndTimeOfBirth"]),
        birthDetails: BirthDetails.fromJson(json["birthDetails"]),
        birthPlace: BirthPlace.fromJson(json["birthPlace"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "relation": relation,
        "relationId": relationId,
        "firstName": firstNameValues.reverse![firstName],
        "middleName": middleName == null ? null : middleName,
        "lastName": lastNameValues.reverse![lastName],
        "fullName": fullName,
        "gender": genderValues.reverse![gender],
        "dateAndTimeOfBirth": dateAndTimeOfBirth?.toIso8601String(),
        "birthDetails": birthDetails.toJson(),
        "birthPlace": birthPlace?.toJson(),
      };
}

class BirthDetails {
  BirthDetails({
    @required this.dobYear,
    this.dobMonth,
    this.dobDay,
    this.tobHour,
    this.tobMin,
    this.meridiem,
  });

  num? dobYear;
  num? dobMonth;
  num? dobDay;
  num? tobHour;
  num? tobMin;
  String? meridiem;

  factory BirthDetails.fromJson(Map<String, dynamic> json) => BirthDetails(
        dobYear: json["dobYear"],
        dobMonth: json["dobMonth"],
        dobDay: json["dobDay"],
        tobHour: json["tobHour"],
        tobMin: json["tobMin"],
        meridiem: json["meridiem"],
      );

  Map<String, dynamic> toJson() => {
        "dobYear": dobYear,
        "dobMonth": dobMonth,
        "dobDay": dobDay,
        "tobHour": tobHour,
        "tobMin": tobMin,
        "meridiem": meridiem,
      };
}

enum Meridiem { AM }

final meridiemValues = EnumValues({"AM": Meridiem.AM});

class BirthPlace {
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
}

enum FirstName { NORA, HAHAHA, EMPTY }

final firstNameValues = EnumValues(
    {"": FirstName.EMPTY, "Hahaha": FirstName.HAHAHA, "Nora": FirstName.NORA});

enum Gender { MALE }

final genderValues = EnumValues({"MALE": Gender.MALE});

enum LastName { SINGH, EMPTY }

final lastNameValues =
    EnumValues({"": LastName.EMPTY, "Singh": LastName.SINGH});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
