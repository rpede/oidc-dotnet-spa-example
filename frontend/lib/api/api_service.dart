import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web/web.dart';

import '../models/user_info.dart';

class ApiService {
  Future<UserInfo> getUserInfo() async {
    final response = await http.get(Uri.parse("/Auth/UserInfo"));
    final map = jsonDecode(response.body);
    final userInfo = UserInfo.fromMap(map);
    return userInfo;
  }

  void login() {
    document.location?.href = "/Auth/Login";
  }
}
