import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:luxury_project/widget/bottom_navigation_bar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../service/loader.dart';
import '../service/service.dart';
import '../widget/constant.dart';
import 'package:http/http.dart' as http;
import 'animated_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          AnimatedGradientScreen(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset("asset/image/luxury_logo.png")),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Proceed with your",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xff767977),
                                fontSize: 20,
                                fontWeight: FontWeight.w200),
                          ),
                          Text(
                            "Log in",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: blackColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Phone Number",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xff767977),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          TextFormField(
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            controller: _phoneNumberController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^1+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^2+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^3+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^4+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^5+')),
                            ],
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              ),
                              suffixIcon: Icon(Icons.mail_outline,
                                  color: primaryColor, size: 20),
                              hintStyle: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Password",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xff767977),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          TextFormField(
                            cursorColor: Colors.black,
                            obscureText: !isPasswordVisible,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  size: 20,
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: primaryColor,
                                ),
                                onPressed: () {
                                  try {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  } catch (e) {
                                    print(
                                        "Error toggling password visibility: $e");
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Forget Password ?",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: Color(0xff767977),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (_phoneNumberController.text.isEmpty ||
                                  _passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Both phone number and password are required.'),
                                  ),
                                );
                              } else {
                                _login(context, _phoneNumberController.text, _passwordController.text);

                              }
                            },
                            child: Center(
                              child: _isLoading
                                  ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                          Color(0xffEACF97)),
                                    )
                                  : Container(
                                      width: 167,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: const Color(0xff1C1B1F),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Log in",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              color: whiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  _login(BuildContext context,String phoneNumber,String password) async {
    // networkStatus().then((isReachable) {
    // if (isReachable!) {

    startLoader();

    Webservice().callLoginService(context,phone: phoneNumber, password: password)
        .then((onResponse) async {
      stopLoader();
      if (kDebugMode) {
        print(onResponse!.status);
        print("authorization${onResponse.authorization?.token}");
      }
      if (onResponse!.status == "success") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('phone', phoneNumber);
                await prefs.setString('password', password);
                await prefs.setString('authorization', onResponse.authorization?.token ??'');

        await Future.delayed(const Duration(milliseconds: 800));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigationBarScreen()),
        );
      } else {
        Fluttertoast.showToast(msg: "Failed to Login");
      }
    }).catchError((error) async {
      Fluttertoast.showToast(msg: "Time Out");
      stopLoader();
      if (kDebugMode) {
        print(error);
      }
    });
  }

  startLoader() {
    LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  }

  stopLoader() {
    Navigator.of(context).pop();
  }

  // Future<String?> LogOut(
  //     BuildContext context,) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('authorization');
  //   try {
  //     final response = await http.post(
  //       Uri.parse('https://luxuryderm.in/api/logout'),
  //       body: {'token': token},
  //     );
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print('User created at: ${data['user']['created_at']}');
  //       var accessToken = data['authorization']['token'];
  //       print("accessToken $accessToken");
  //       print(data);
  //       if (data['status'] == 'success') {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => SignInScreen()),
  //         );
  //         return data['token'];
  //       }
  //     }
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Login Failed Please check your credentials.'),
  //       ),
  //     );
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



}
