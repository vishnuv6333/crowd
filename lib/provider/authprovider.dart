import 'dart:convert';

import 'package:crowd/Model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constant/constant.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String mobile = '';
  String password = '';
  String token = '';
  String Type="Android";

  Authentication userCredentials = Authentication(
      token: '', fullname: '', emailid: '', message: '', statuscode: '');

  bool isLoggedIn = false;

  userlogin([BuildContext? context]) async {

   
    _isLoading = true;
    notifyListeners();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
  print("user");
      final uri = Uri.parse(BaseUrl().baseUrl + '/login');
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {"phone_number": mobile, "password": password,"device_type":Type};
      String jsonBody = json.encode(body);

      Response response =
          await http.post(uri, headers: headers, body: jsonBody);
          print(response.body);
      if (response.statusCode == 200) {
        userCredentials = authenticationFromJson(response.body);
        if (userCredentials.statuscode == "01") {
          print("token");
          token = userCredentials.token.toString();
          prefs.setString("user_token", token);
          _isLoading = false;
          isLoggedIn = true;
          tosterMessage( userCredentials.message);
          notifyListeners();
        } else {
          _isLoading = false;
          tosterMessage( userCredentials.message);
        }
      } else {
        final msg = json.decode(response.body);
        tosterMessage( msg['message']);
      }
      notifyListeners();
      // ignore: empty_catches
    } catch (e) {}
  }

   void setMobile(String value) {
    mobile = value;
    notifyListeners();
    print(mobile);
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }
}
tosterMessage([String? string]) {
    Fluttertoast.showToast(
      msg: string.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }