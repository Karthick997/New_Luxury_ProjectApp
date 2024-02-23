import 'package:flutter/material.dart';
import '../../widget/constant.dart';
import '../../widget/small_text.dart';
import '../../widget/string.dart';

class PatientDetails {
  final String name;
  final String gender;
  final String id;
  final String date;
  final String treatment;
  final String status;

  PatientDetails({
    required this.name,
    required this.gender,
    required this.id,
    required this.date,
    required this.treatment,
    required this.status,
  });
}

class PatientDetailsPage extends StatefulWidget {
  final List<PatientDetails> patientList = [
    PatientDetails(
        name: "Prem Anand",
        gender: "- Male",
        id: "ID : LD00010",
        date: "29 Aug 2023",
        treatment: 'Hydra facial',
        status: "Arrived"),
  ];
  PatientDetailsPage({Key? key}) : super(key: key);

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.patientList.length,
          itemBuilder: (BuildContext context, int index) {
            PatientDetails patient = widget.patientList[index];
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: const Color(0xffFDF5E5),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor),
              child: Row(
                children: [
                  Image.asset("asset/image/patientphoto.png"),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              SmallText(
                                text: patient.name,
                                size: 16,
                                fontFamily: MyStrings.poppins,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              SmallText(
                                text: patient.gender,
                                size: 8,
                                fontFamily: MyStrings.poppins,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xff464746),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SmallText(
                        text: patient.id,
                        size: 10,
                        fontFamily: MyStrings.poppins,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 90,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: const Color(0xffFBD179),
                              ),
                              child: Center(
                                child: SmallText(
                                  text: patient.date,
                                  size: 9,
                                  fontFamily: MyStrings.poppins,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor,
                                ),
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                              width: 90,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: const Color(0xffF3F1EF)),
                              child: Center(
                                child: SmallText(
                                  text: patient.treatment,
                                  size: 9,
                                  fontFamily: MyStrings.poppins,
                                  fontWeight: FontWeight.w500,
                                  color: blackColor,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                                // offset: Offset(
                                //   5.0, // Move to right 5  horizontally
                                //   5.0, // Move to bottom 5 Vertically
                                // ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffE8FEEA)),
                        child: Center(
                          child: SmallText(
                            text: patient.status,
                            size: 8,
                            fontFamily: MyStrings.poppins,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff38CF1F),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Icon(Icons.arrow_forward_ios, size: 15),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
