import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model_class/logout_model.dart';
import '../model_class/signin_model.dart';
import '../utilities/api_constant.dart';
import '../widget/constant.dart';

String? accessToken = prefs!.getString('accesstoken');
String? refreshToken = prefs!.getString('refreshtoken');

class Resource<T> {
  final String url;
  T Function(Response response) parse;
  Resource({required this.url, required this.parse});
}

class Webservice {
  static const storage = FlutterSecureStorage();

  // Login Service
  Future<LogInModel?> callLoginService(BuildContext context,
      {required String phone, required String password}) async {
    final url = Uri.parse(ApiConstants.login);
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({'phone': phone, 'password': password});
    try {
      final response = await http
          .post(
            url,
            headers: headers,
            body: body,
          )
          .timeout(const Duration(seconds: 30));
      if (kDebugMode) {
        print(headers);
        print(body);
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        print("statuscode:${response.statusCode}");
        var data = jsonDecode(response.body.toString());
        print('User created at: ${data['user']['created_at']}');
        var accessToken = data['authorization']['token'];
        print("accessToken $accessToken");
        print(data);
        if (data['status'] == 'success') {
          // final prefs = await SharedPreferences.getInstance();
          // await prefs.setString('phone', phone);
          // await prefs.setString('password', password);
          // await prefs.setString('authorization', accessToken);
          return LogInModel.fromJson(
              data); // Assuming you have a model class to parse the response
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Failed Please check your credentials.'),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred Please try again later.'),
        ),
      );
    }
    return null;
  }

  // Logout Service
  // Future<LogOutModel?> callLogOutService(BuildContext context,
  //     ) async {
  // final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('authorization');
  //   final url = Uri.parse(ApiConstants.logout);
  //   final headers = {
  //     'Content-Type': 'application/json',
  //   };
  //   final body = jsonEncode({'token': token});
  //   try {
  //     final response = await http
  //         .get(
  //       url,
  //       headers: headers,
  //       body: body,
  //     )
  //         .timeout(const Duration(seconds: 30));
  //     if (kDebugMode) {
  //       print(headers);
  //       print(body);
  //       print(response.statusCode);
  //     }
  //
  //     if (response.statusCode == 200) {
  //       print("statuscode:${response.statusCode}");
  //       var data = jsonDecode(response.body.toString());
  //       print('User created at: ${data['user']['created_at']}');
  //       var accessToken = data['authorization']['token'];
  //       print("accessToken $accessToken");
  //       print(data);
  //       if (data['status'] == 'success') {
  //         // final prefs = await SharedPreferences.getInstance();
  //         // await prefs.setString('phone', phone);
  //         // await prefs.setString('password', password);
  //         // await prefs.setString('authorization', accessToken);
  //         return LogInModel.fromJson(data); // Assuming you have a model class to parse the response
  //       }
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Login Failed Please check your credentials.'),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('An error occurred Please try again later.'),
  //       ),
  //     );
  //   }
  //   return null;
  // }
  Future<LogOutModel?> callLogOutService(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authorization');

    if (token == null) {
      return null;
    }

    final url = Uri.parse(ApiConstants.logout);
    final body = {
      'token': token,
    };

    try {
      final response = await http.post(
        url,
        body: body,
      ).timeout(const Duration(seconds: 30));

      if (kDebugMode) {
        print(response.statusCode);
      }

      print(response.body);

      if (response.statusCode == 200) {
        print("welcome");
        var data = jsonDecode(response.body.toString());
        if (data['status'] == true) {
          return LogOutModel.fromJson(data);
        }
      }
    else {
    throw Exception('Logout Failed');
    }
  } catch (e) {
  throw Exception('Logout Failed $e');
  }
    return null;
  }

}
