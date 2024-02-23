import 'package:flutter/material.dart';
import 'package:luxury_project/widget/constant.dart';
import 'package:luxury_project/widget/string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFBF3),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Add Prescription",
            style: TextStyle(
              color: blackColor,
              fontFamily: MyStrings.poppins,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Prescription",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: MyStrings.poppins),
                ),
                Row(
                  children: [
                    Container(
                      child: Center(
                        child: Text("AM",
                            style: TextStyle(
                                color: whiteColor,
                                fontFamily: MyStrings.poppins,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      ),
                      width: 31,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: blackColor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Center(
                        child: Text("PM",
                            style: TextStyle(
                                color: blackColor,
                                fontFamily: MyStrings.poppins,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      ),
                      width: 31,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffCCCCCC)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffF2F2F2),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffDADADA)),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffDADADA)),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Select the  items here",
                hintStyle: const TextStyle(
                    fontFamily: MyStrings.poppins,
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Color(0xff8E8D8D)),
                contentPadding: const EdgeInsets.only(left: 25),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffF2F2F2),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffDADADA)),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffDADADA)),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Select the  items here",
                hintStyle: const TextStyle(
                    fontFamily: MyStrings.poppins,
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Color(0xff8E8D8D)),
                contentPadding:
                    const EdgeInsets.only(left: 15, top: 25, bottom: 40),
              ),
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
