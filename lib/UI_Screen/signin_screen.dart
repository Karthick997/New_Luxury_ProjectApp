import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luxury_project/widget/bottom_navigation_bar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../widget/constant.dart';
import 'package:http/http.dart' as http;

import 'animated_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

Future<void>_performLogin(
    BuildContext context, String phone, String password) async {
  try {
    final response = await http.post(
      Uri.parse('https://luxuryderm.in/api/login'),
      body: {
        'phone': phone,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      if (data['status'] == 'success') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('phone', phone);
        await prefs.setString('password', password);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()),
        );
        return;
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login Failed Please check your credentials'),
      ),
    );
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred Please try again later'),
      ),
    );
  }
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
                                setState(() {
                                  _isLoading = true; // Show loader
                                });
                                try {
                                  await _performLogin(
                                    context,
                                    _phoneNumberController.text,
                                    _passwordController.text,
                                  );
                                } finally {
                                  setState(() {
                                    _isLoading = false; // Hide loader
                                  });
                                }
                              }
                            },
                            child: Center(
                              child: _isLoading
                                  ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
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
}
