import 'dart:io';
import 'package:flutter/material.dart';
import 'package:luxury_project/widget/constant.dart';
import 'package:luxury_project/widget/string.dart';

class CheckPhotoScreen extends StatelessWidget {
  final String imagePath;

  const CheckPhotoScreen({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF3),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Check photo',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: MyStrings.poppins,
                color: blackColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            const Center(
              child: Text("Make sure that the photo is clear and the skin",
                  style: TextStyle(
                      fontFamily: MyStrings.poppins,
                      color: Color(0xff333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ),
            const Center(
              child: Text("Condition is not covered by hair or clothing.",
                  style: TextStyle(
                      fontFamily: MyStrings.poppins,
                      color: Color(0xff333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(File(imagePath),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: 250)),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, true);
                },
                child: Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text("Continue",
                        style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: MyStrings.poppins)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, false);
              },
              child: const Text(
                "Retake Photo",
                style: TextStyle(
                    fontFamily: MyStrings.poppins,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff172D2B)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
