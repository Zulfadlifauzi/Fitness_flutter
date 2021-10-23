import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:training/models/test_api.dart';

class APIServices {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = 'https://reqres.in/api/login';
    final response =
        await http.post(Uri.parse(url), body: requestModel.tojson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.statusCode);
      return LoginResponseModel.fromjson(json.decode(response.body));
    } else {
      throw Exception('Failed to send data');
    }
  }
}
