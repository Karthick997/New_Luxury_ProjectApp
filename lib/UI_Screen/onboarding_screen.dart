import 'package:flutter/material.dart';
import 'package:luxury_project/UI_Screen/signin_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widget/constant.dart';
import 'intro_page/intro_screen1.dart';
import 'intro_page/intro_screen2.dart';
import 'intro_page/intro_screen3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int currentIndexPage = 0;
  bool onlastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.5,2.5],
                colors: [primaryColor, Colors.white,],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  onlastPage = (index == 2);
                });
              },
              children: const [
                IntroScreen1(),
                IntroScreen2(),
                IntroScreen3(),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Positioned(
            bottom: 20,
            left: 30,
            right: 30,
            child: Container(
                alignment: const Alignment(0, 0.80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignInScreen()),
                        );
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            fontFamily: "Poppins",color: blackColor,
                            fontSize: 16,fontWeight: FontWeight.w400

                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                         dotHeight: 7,
                        dotWidth: 7,
                        activeDotColor:
                            Colors.black, // Set the color of active dot
                        dotColor: Colors.black, // Set the color of inactive dot
                      ),
                    ),
                    onlastPage
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         SignInScreen()),
                              );
                            },
                            child:Text(
                              "done",
                              style: TextStyle(
                                  fontFamily: "Poppins",color: blackColor,
                                  fontSize: 16,fontWeight: FontWeight.w400

                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Text(
                              "next",
                              style: TextStyle(
                                  fontFamily: "Poppins",color: blackColor,
                                  fontSize: 16,fontWeight: FontWeight.w400

                              ),
                            ),),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
