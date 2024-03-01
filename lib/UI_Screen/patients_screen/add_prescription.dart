import 'package:flutter/material.dart';
import 'package:luxury_project/widget/constant.dart';
import 'package:luxury_project/widget/small_text.dart';
import 'package:luxury_project/widget/string.dart';

class AddPrescriptionScreen extends StatelessWidget {
  const AddPrescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Center(
            child: Container(
              height: 3,
              width: 80,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),
        ),
        SizedBox(height: 30,),
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
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 15), // Adjust the vertical padding here
          ),
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
            hintText: "Notes and Description",
            hintStyle: const TextStyle(
                fontFamily: MyStrings.poppins,
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Color(0xff8E8D8D)),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 15), // Adjust the vertical padding here
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                      child: SmallText(
                          text: MyStrings.clear,
                          fontFamily: MyStrings.poppins,
                          fontWeight: FontWeight.w600,
                          size: 10)),
                  width: 63,
                  height: 33,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Color(0xffDFDFDF))),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  child: Center(
                      child: SmallText(
                          text: MyStrings.add,
                          fontFamily: MyStrings.poppins,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          size: 10)),
                  width: 110,
                  height: 33,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Color(0xffDFDFDF))),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SmallText(
                  text: MyStrings.aMRoutine,
                  fontFamily: MyStrings.poppins,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  size: 16),
              width: MediaQuery.of(context).size.width,
              height: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xffFFEFC6)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SmallText(
                  text: MyStrings.pMRoutine,
                  fontFamily: MyStrings.poppins,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  size: 16),
              width: MediaQuery.of(context).size.width,
              height: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xffFFEFC6)),
            ),
          ],
        )
      ],
    );
  }
}
