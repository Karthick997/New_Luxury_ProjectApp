import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:luxury_project/UI_Screen/patients_screen/patientinfo.dart';
import 'package:luxury_project/UI_Screen/patients_screen/prescription_screen.dart';
import 'package:luxury_project/widget/constant.dart';
import 'package:luxury_project/widget/small_text.dart';
import 'package:luxury_project/widget/string.dart';
import 'add_prescription.dart';
import 'image_upload_screen.dart';
import 'medical_recards.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.black,
        animatedIcon: AnimatedIcons.add_event,
        foregroundColor: Colors.white,
        children: [
          SpeedDialChild(
            child: Icon(Icons.camera_alt),
            onTap: () {
              double screenHeight = MediaQuery.of(context).size.height;
              double bottomSheetHeight = screenHeight * 0.75;
              showModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text(
                          "Upload image",
                          style: TextStyle(
                              color: Color(0xff172D2B),
                              fontWeight: FontWeight.w400,
                              fontFamily: MyStrings.poppins,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Flexible(
                          child: ImageUploadScreen(),
                        ),
                        // ImageUploadScreen(),
                      ],
                    ),
                    height: bottomSheetHeight,
                  );
                },
              );
            },
          ),
          SpeedDialChild(
              child: Icon(Icons.file_copy_outlined),
              onTap: () {
                double screenHeight = MediaQuery.of(context).size.height;
                double bottomSheetHeight = screenHeight * 0.75;
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Container(
                        child: AddPrescriptionScreen(),
                        height: bottomSheetHeight,
                      ),
                    );
                  },
                );
              }),
        ],
      ),
      backgroundColor: Color(0xffFFF7E5),
      appBar: AppBar(
          title: SmallText(
            text: MyStrings.profile,
            size: 16,
            fontWeight: FontWeight.w400,
            fontFamily: MyStrings.poppins,
          ),
          actions: [
            Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFFF6D8),
                    border: Border.all(
                      color: Color(0xffD7D2D2),
                    )),
                child: Image.asset(
                  "asset/image/whatsimage.png",
                  height: 20,
                )),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFF6D8),
                      border: Border.all(
                        color: Color(0xffD7D2D2),
                      )),
                  child: Icon(
                    Icons.phone,
                    color: Color(0xff1C1B1F),
                    size: 15,
                  )),
            ),
          ],
        backgroundColor: Color(0xffFFF7E5),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width,
                height: 186,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffD7D2D2),
                    ),
                    borderRadius: BorderRadius.circular(32),
                    color: Color(0xffFFF6D8)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("asset/image/doctorprofile.png"),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: SmallText(
                            text: MyStrings.premAnand,
                            size: 20,
                            fontFamily: MyStrings.poppins,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Center(
                            child: SmallText(
                              text: MyStrings.id,
                              size: 13,
                              color: Colors.black,
                            ),
                          ),
                          width: 125,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xffFDEEC7)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                SmallText(
                                  text: MyStrings.no,
                                  fontFamily: MyStrings.poppins,
                                  fontWeight: FontWeight.w500,
                                  size: 16,
                                ),
                                SmallText(
                                    text: MyStrings.past,
                                    fontFamily: MyStrings.poppins,
                                    fontWeight: FontWeight.w400,
                                    size: 13,
                                    color: Color(0xffBAB2B2)),
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                SmallText(
                                  text: MyStrings.no2,
                                  fontFamily: MyStrings.poppins,
                                  fontWeight: FontWeight.w500,
                                  size: 16,
                                ),
                                SmallText(
                                    text: MyStrings.upComing,
                                    fontFamily: MyStrings.poppins,
                                    fontWeight: FontWeight.w400,
                                    size: 13,
                                    color: Color(0xffBAB2B2)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: DefaultTabController(
                length: 3,
                child: CustomScrollView(
                  // physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Color(0xffFFF7E5),
                      automaticallyImplyLeading: false,
                      expandedHeight: 0,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(),
                      bottom: TabBar(
                        dividerHeight: 0,
                        labelColor: primaryColor,
                        indicatorColor: primaryColor,
                        tabs: [
                          Tab(
                            child: Text(
                              'Patient Info',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: MyStrings.poppins,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Medical Records',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: MyStrings.poppins,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Prescription',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: MyStrings.poppins,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      child: TabBarView(
                        children: [
                          patientInfoScreen(),
                          MedicalRecordsScreen(),
                          PrescriptionScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
