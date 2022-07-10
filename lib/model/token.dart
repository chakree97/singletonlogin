import 'package:flutter/foundation.dart';

class TokenSingleTon{
  TokenSingleTon._internal();
  static final TokenSingleTon _instance = TokenSingleTon._internal();
  factory TokenSingleTon() => _instance;

  String _token = "";
  void setToken(String setToken){
    _token = setToken;
  }

  String get getToken => _token;
}

class ResponseApi{
  final String? token;
  final String? message;

  ResponseApi({
    this.token,
    this.message
  });

  factory ResponseApi.fromJson(Map<String,dynamic> json) => ResponseApi(
    token: json["token"],
    message: json["message"]
  );
}