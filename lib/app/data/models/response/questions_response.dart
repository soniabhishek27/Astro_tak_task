import 'dart:convert';

class AskQuestionsResponse {
  AskQuestionsResponse({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  String? httpStatus;
  num? httpStatusCode;
  bool? success;
  String? message;
  String? apiName;
  List<AskQuestionData>? data;

  factory AskQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      AskQuestionsResponse(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: List<AskQuestionData>.from(
            json["data"].map((x) => AskQuestionData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class AskQuestionData {
  AskQuestionData({
    this.id,
    this.name,
    this.description,
    this.price,
    this.suggestions,
  });

  num? id;
  String? name;
  String? description;
  num? price;
  List<String>? suggestions;

  factory AskQuestionData.fromJson(Map<String, dynamic> json) =>
      AskQuestionData(
        id: json["id"],
        name: json["name"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"],
        suggestions: List<String>.from(json["suggestions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description == null ? null : description,
        "price": price,
        "suggestions": List<dynamic>.from(suggestions?.map((x) => x) ?? []),
      };
}
