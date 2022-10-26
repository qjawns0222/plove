import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserModel {
  Future<Response> LoginUri(id, pass) async {
    Response uri = await http.get(Uri.parse(
        "http://192.168.0.116:8080/hi?id=${id.text}&pass=${pass.text}"));
    return uri;
  }
}
