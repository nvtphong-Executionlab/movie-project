
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'custom_exception.dart';

class ApiProvider {
  static const url = 'https://api.themoviedb.org/3';
  ApiProvider();
  Future<Map<String, dynamic>> get(String endPoint) async{
    try{
      final response = await http.get(Uri.parse(url + endPoint));
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    }
    catch(err){
      print("err");
      throw FetchDataException('internal Error');
    }
  }
  Future<Map<String, dynamic>> post(String endPoint, dynamic body) async {
    try{
      final response = await http.post(Uri.parse(url + endPoint), body: body);
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    }
    on CustomException {
      throw UnauthorisedException("invalid");
    }
  }
  Map<String, dynamic> classifyResponse(response){
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    switch(response.statusCode){
      case 200:
      case 201:
        return responseData;
      case 400:
      case 401:
        throw UnauthorisedException(responseData["status_message"].toString());
      case 500:
      default:
        throw FetchDataException('Error occured while communication with status code: ${response.statusCode}');
    }
  }
}