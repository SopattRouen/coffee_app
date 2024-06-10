import 'dart:convert';
import 'dart:developer';
import 'package:coffee_test_1/api/model_rest_api.dart';
import 'package:coffee_test_1/const/const.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  static Future<List<model_rest_api>> getUrl() async {
    try {
      var url = Uri.parse(product);
      final res = await http.get(url);
      final data = jsonDecode(res.body);
      return data
          .map<model_rest_api>((e) => model_rest_api.fromJson(e))
          .toList();
    } catch (e) {
      log("error:$e");
      return [];
    }
  }
}
