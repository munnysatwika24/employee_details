import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../app_log.dart';
import '../events/food_court_event.dart';
import '../model_class/food_court_update.dart';
import '../model_class/list_of_food_courts.dart';
import '../model_class/post_request.dart';
import '../model_class/post_response.dart';
import '../model_class/update_user_request.dart';
class FoodCourtRepository{
String endPoint = 'https://reqres.in/api/users?page=2';
String endPoint2 = 'https://reqres.in/api/users/2';
String endPoint3 = 'https://reqres.in/api/users/';


Future <List<Foodcourt>> getFoodCourtList() async{

    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200|| response.statusCode==200){
      final List result = jsonDecode(response.body)['data'];

      return result.map(((e) => Foodcourt.fromJson(e))).toList();
    }else {

      print("${response.reasonPhrase}");
      throw Exception(response.reasonPhrase);

    }

}

Future<List<UpdateResponseModel>> getFoodCourt(UpdateNewUser request) async{

  Response response1 = await put(Uri.parse(endPoint2),body: request.toJson());
  if (response1.statusCode == 200){
    final List results = jsonDecode(response1.body);

    return results.map(((e) => UpdateResponseModel.fromJson(e))).toList();
  }else {

    print("${response1.reasonPhrase}");
    throw Exception(response1.reasonPhrase);

  }

}
Future<PostRespondModel> postList(PostRequestModel request) async{

  Response res = await post(Uri.parse(endPoint3),body:request.toJson());
  print('Statuscode::${res.statusCode}');
  if (res.statusCode == 201){
     var results = jsonDecode(res.body);
     AppLog.d("Response::${results.toString()}");
    return PostRespondModel.fromJson(results);


  }else {

    print("${res.reasonPhrase}");
    throw Exception(res.reasonPhrase);

  }

}
Future deleteEmployees()async{
 http.Response resp = await http.delete(Uri.parse("https://reqres.in/api/users/2"));
  print("statusCode::${resp.statusCode}");
  if (resp.statusCode == 204){
    // AppLog.d("Response::${resp.StreamedResponse}");
    var result = resp.body;
    print("dell::${result}");
    return result;
  }else{
    throw Exception(resp.reasonPhrase);
  }

}
}