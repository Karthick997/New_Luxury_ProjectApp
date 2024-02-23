import 'package:flutter/material.dart';

import '../../widget/constant.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20), // Add spacing at the top
            Center(
              child: Text(
                "welcome to",
                style: TextStyle(
                    fontFamily: "Poppins",color: blackColor,
                    fontSize: 27,fontWeight: FontWeight.w400

                ),
              ),
            ),
            const SizedBox(height: 10),
            Image.asset("asset/image/luxury_logo.png"),
            Image.asset("asset/image/welcome_image.png"),
            const SizedBox(height: 20),
            const Text(
              "Analyze your skin condition and receive",
              style: TextStyle(
                  fontFamily: "Poppins",color: Color(0xff767977),
                  fontSize: 16,fontWeight: FontWeight.w400

              ),
            ), // Add spacing between images and text
            const Text(
              "instant results and recommendations",
              style: TextStyle(
                  fontFamily: "Poppins",color: Color(0xff767977),
                  fontSize: 16,fontWeight: FontWeight.w400

              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
  }
}
