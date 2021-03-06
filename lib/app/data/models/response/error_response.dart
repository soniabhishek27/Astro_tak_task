class ErrorResponse {
  late String message;

  ErrorResponse({required this.message});

  ErrorResponse.fromJson(Map<String, dynamic>? json) {
    message = json == null ? "" : json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
