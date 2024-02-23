import 'package:flutter/material.dart';
import '../../widget/constant.dart';
import '../../widget/small_text.dart';
import '../../widget/string.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20), // Add spacing at the top
          const Center(
            child:  SmallText(
              size: 20,
              text: MyStrings.welcomeTo,
              fontFamily: MyStrings.poppins,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset("asset/image/luxury_logo.png"),
          Image.asset("asset/image/welcome_image.png"),
          const SizedBox(height: 20),
          const SmallText(
            size: 16,
            text: MyStrings.analyzeYourSkinConditionAndReceive,
            fontFamily: MyStrings.poppins,
            fontWeight: FontWeight.w400,
            color: Color(0xff767977),
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
