import 'package:flutter/material.dart';

import '../../widget/small_text.dart';
import '../../widget/string.dart';

class patientInfoScreen extends StatefulWidget {
  const patientInfoScreen({Key? key}) : super(key: key);

  @override
  State<patientInfoScreen> createState() => _patientInfoScreenState();
}

class _patientInfoScreenState extends State<patientInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 40, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(
            text: MyStrings.patientInfo,
            size: 16,
            fontWeight: FontWeight.w500,
            fontFamily: MyStrings.poppins,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    text: MyStrings.gender,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.poppins,
                    color: Color(0xffBAB2B2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SmallText(
                    text: MyStrings.person,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.poppins,
                  ),
                ],
              ),
              Column(
                children: [
                  SmallText(
                    text: MyStrings.dateOfBirth,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.poppins,
                    color: Color(0xffBAB2B2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SmallText(
                    text: MyStrings.date,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.poppins,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    text: MyStrings.registeredOn,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.poppins,
                    color: Color(0xffBAB2B2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SmallText(
                    text: MyStrings.date,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.poppins,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    text: MyStrings.lastApp,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.poppins,
                    color: Color(0xffBAB2B2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SmallText(
                    text: MyStrings.date,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.poppins,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmallText(
                    text: MyStrings.totalInvoice,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.poppins,
                    color: Color(0xffBAB2B2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SmallText(
                    text: MyStrings.amount,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.poppins,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmallText(
                    text: MyStrings.due,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: MyStrings.poppins,
                    color: Color(0xffBAB2B2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 60,
                    height: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xffFFCDCD)),
                    child: Center(
                      child: SmallText(
                        text: MyStrings.dueAmount,
                        size: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: MyStrings.poppins,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SmallText(
            text: MyStrings.referredKnownBy,
            size: 13,
            fontWeight: FontWeight.w400,
            fontFamily: MyStrings.poppins,
            color: Color(0xffBAB2B2),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "-NA-",
            style: TextStyle(
                fontFamily: MyStrings.poppins,
                fontSize: 13,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20,
          ),
          SmallText(
            text: MyStrings.address,
            size: 13,
            fontWeight: FontWeight.w400,
            fontFamily: MyStrings.poppins,
            color: Color(0xffBAB2B2),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "-NA-",
            style: TextStyle(
                fontFamily: MyStrings.poppins,
                fontSize: 13,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20,
          ),
          SmallText(
            text: MyStrings.MedicationAllergies,
            size: 13,
            fontWeight: FontWeight.w400,
            fontFamily: MyStrings.poppins,
            color: Color(0xffBAB2B2),
          ),
        ],
      ),
    );
  }
}
