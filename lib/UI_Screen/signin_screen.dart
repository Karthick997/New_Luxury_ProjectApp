import 'package:flutter/material.dart';
import 'dart:async';
import '../widget/bottom_navigation_bar_screen.dart';
import '../widget/constant.dart';

class AnimatedGradientScreen extends StatefulWidget {
  @override
  _AnimatedGradientScreenState createState() => _AnimatedGradientScreenState();
}

class _AnimatedGradientScreenState extends State<AnimatedGradientScreen> {
  List<List<Color>> colorLists = [
    [const Color(0xffF8EAD7), const Color(0xffFAFEFF)],
    [const Color(0xffFAFEFF), const Color(0xffF8EAD7)],
  ];
  int index = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        index = (index + 1) % colorLists.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: colorLists[index],
        ),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordVisible = false;

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
                            "Email",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xff767977),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          TextFormField(
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
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
                            cursorColor: primaryColor,
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
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                              hintStyle: const TextStyle(color: Colors.white),
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
                            onTap: () {
                              if (_emailController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please enter your email and password')),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomNavigationBarScreen()),
                                );
                              }
                            },
                            child: Center(
                              child: Container(
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
