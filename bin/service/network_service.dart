import 'dart:convert';
import 'package:http/http.dart';

class NetworkService{

  static final String baseUrl = "6566569764fcff8d730eb48f.mockapi.io";

  static final String apiFood = "/food";
  static final String apiDeleteFood = "/food"; //id

  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Future<String>getData(String api)async{
    Uri url = Uri.https(baseUrl, api);
    Response response = await get(url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return "Something went wrong at ${response.statusCode}";
    }
  }

  static Future<String> postData(Map<String, dynamic> body) async {
    Uri url = Uri.https(NetworkService.baseUrl, NetworkService.apiFood);
    Response response = await post(url, body: jsonEncode(body), headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return "Successfully posted: ${response.body}";
    } else {
      return "Something went wrong at ${response.statusCode}"; }
    }

  static Future<String> deleteData(String id) async {
    Uri url = Uri.https(baseUrl, "$apiDeleteFood/$id");
    Response response = await delete(url, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201){
      return "${response.statusCode}";
    } else {
      return "Something went wrong at ${response.statusCode}";
    }
  }
}