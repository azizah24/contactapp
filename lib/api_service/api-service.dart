import 'dart:convert';

import 'package:contactapp/model/model_user.dart';

import 'package:http/http.dart' as http;

class APIService {
  var url = 'https://reqres.in';

  Future<List<ModelUsers>?> getListUsers() async {
    final requestUrl = '$url/api/users';
    final response = await http.get(
      Uri.parse(requestUrl),
    );

    if (response.statusCode == 200) {
      if (json.decode(response.body)["data"] != null) {
        List data = json.decode(response.body)["data"];
        (data);
        return data.map((e) {
          return ModelUsers.fromJson(e);
        }).toList();
      }
      return [];
    }

    if (response.statusCode != 200) {
      throw Exception('error retrieving weather: ${response.statusCode}');
    }
  }

  Future addEmployee(name, job) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    var body = {"name": name, "job": job};

    var rdata = await http.post(
      Uri.parse('$url/api/users'),
      headers: headers,
      body: jsonEncode(body),
    );
    var res = json.decode(rdata.body);
  }
}
