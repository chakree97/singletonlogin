import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:singleton/model/token.dart';

Future<ResponseApi> login(String username,String password)async{
  try{
    var url = Uri.http("localhost:3000", "/login");
    var res = await http.post(url,body: {
      "username" : username,
      "password" : password
    });
    var result = ResponseApi.fromJson(json.decode(res.body));
    return result;
  }catch(err){
    rethrow;
  }
}