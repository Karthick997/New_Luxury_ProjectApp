import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:luxury_project/UI_Screen/signin_screen.dart';
import 'package:luxury_project/widget/constant.dart';
import 'package:luxury_project/widget/string.dart';
import '../UI_Screen/calender_page.dart';
import '../service/loader.dart';
import '../service/service.dart';

class DoctorList {
  final String imagepath;
  final String name;

  DoctorList({
    required this.imagepath,
    required this.name,
  });
}

class AppointmentList {
  final String numberOfCases;
  final String disease;
  final String date;

  AppointmentList({
    required this.numberOfCases,
    required this.disease,
    required this.date,
  });
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<DoctorList> doctorList = [
    DoctorList(
      imagepath: "asset/image/doctor1.png",
      name: "Dr.Vinayak ",
    ),
    DoctorList(
      imagepath: "asset/image/doctor3.png",
      name: "Dr.Pooja ",
    ),
    DoctorList(
      imagepath: "asset/image/doctor1.png",
      name: "Dr.Perry  ",
    ),
    DoctorList(
      imagepath: "asset/image/doctor3.png",
      name: "Dr.Perry  ",
    ),
    DoctorList(
      imagepath: "asset/image/doctor1.png",
      name: "Dr.Perry  ",
    ),
    DoctorList(
      imagepath: "asset/image/doctor3.png",
      name: "Dr.Perry  ",
    ),
  ];

  final List<AppointmentList> appointmentList = [
    AppointmentList(
        numberOfCases: "Case 01",
        disease: "visit reason: Nevus ",
        date: "17 feb 2021"),
    AppointmentList(
      numberOfCases: "Case 02",
      disease: "visit reason: Chickenpox ",
      date: "1 dec 2023",
    ),
    AppointmentList(
      numberOfCases: "Case 03",
      disease: "visit reason: Giardiasis  ",
      date: "18 may 2024",
    ),
    AppointmentList(
      numberOfCases: "Case 04",
      disease: "visit reason: Diphtheria",
      date: "18 may 2024",
    ),
    AppointmentList(
      numberOfCases: "Case 05",
      disease: "visit reason: Influenza",
      date: "18 may 2024",
    ),
    AppointmentList(
      numberOfCases: "Case 06",
      disease: "visit reason: Malaria  ",
      date: "18 may 2024",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFBF3),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("asset/image/homeimage.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Dr.Martinez",
                              style: TextStyle(
                                  fontFamily: MyStrings.poppins,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff1C1B1F),
                              size: 25,
                            ),
                          ],
                        ),
                        Text(
                          "Medical profile",
                          style: TextStyle(
                              fontFamily: MyStrings.poppins,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xff8B8E8C)),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xffDADADA), width: 0.5),
                          borderRadius: BorderRadius.circular(6),
                          color: whiteColor,
                        ),
                        child: const Icon(
                          Icons.notification_add_outlined,
                          color: Color(0xff1C1B1F),
                          size: 25,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          _logOut(context);
                        },
                        icon: Icon(Icons.logout_outlined)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffFCFCFC),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffDADADA), width: 0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffDADADA), width: 0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 25,
                      color: Color(0xff8E8D8D),
                    ),
                    prefixIconConstraints: const BoxConstraints.tightFor(
                        width: 48), // Adjust the width as needed
                    suffixIcon: const Icon(
                      Icons.menu,
                      size: 25,
                      color: Color(0xff1C1B1F),
                    ),
                    suffixIconConstraints: const BoxConstraints.tightFor(
                        width: 48), // Adjust the width as needed
                    hintText: "Search for option",
                    hintStyle: const TextStyle(
                        fontFamily: MyStrings.poppins,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color(0xff8E8D8D)),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Current Appointment",
                  style: TextStyle(
                      color: Color(0xff172D2B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyStrings.poppins),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 98,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: appointmentList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 10),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 295,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xffDADADA), width: 0.5),
                            borderRadius: BorderRadius.circular(7),
                            color: const Color(0xffFFFFFF),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 73,
                                height: 68,
                                decoration: BoxDecoration(
                                  color: const Color(0xffD9D9D9),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    appointmentList[index].numberOfCases,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff172D2B),
                                      fontFamily: MyStrings.poppins,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    appointmentList[index].disease,
                                    style: const TextStyle(
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      fontFamily: MyStrings.poppins,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    appointmentList[index].date,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                      fontFamily: MyStrings.poppins,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffD9D9D9),
                                    ),
                                    child: Icon(
                                      Icons.work_history_outlined,
                                      size: 20,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upcoming Appointment",
                      style: TextStyle(
                          color: Color(0xff172D2B),
                          fontFamily: MyStrings.poppins,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          fontFamily: MyStrings.poppins,
                          color: Color(0xffEACF97)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalenderScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor,
                            blurRadius: 1.5, // soften the shadow
                            spreadRadius: 0.5, //extend the shadow
                            offset: Offset(
                              0.5, // Move to right 5  horizontally
                              0.5, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        border: Border.all(color: primaryColor, width: 0.3),
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffFFFFFF)),
                    child: Row(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: const Color(0xffEACF97)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text("21",
                                    style: TextStyle(
                                        color: blackColor,
                                        fontFamily: MyStrings.poppins,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600)),
                              ),
                              const Center(
                                child: Text(
                                  "Tue",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      fontFamily: MyStrings.poppins),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Vinoth Kumar",
                              style: TextStyle(
                                fontFamily: MyStrings.poppins,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Visit reason : 5th session GFC",
                              style: TextStyle(
                                fontFamily: MyStrings.poppins,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff333333),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: 55,
                              height: 16,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: const Color(0xff172D2D)),
                              child: Center(
                                child: Text("10:30 AM",
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 8,
                                        fontFamily: MyStrings.poppins)),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Color(0xff1C1B1F),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Doctors",
                  style: TextStyle(
                      color: Color(0xff172D2B),
                      fontFamily: MyStrings.poppins,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 130, // Set the height to constrain the ListView
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: doctorList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 10), // Adjust the spacing here
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Image.asset(
                                doctorList[index].imagepath,
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 26,
                                  width: 138,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: const BorderRadius.only(),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(doctorList[index].name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              fontFamily: MyStrings.poppins,
                                              color: Color(0xff000000))),
                                      const Icon(Icons.arrow_forward, size: 12)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _logOut(BuildContext context) async {
    startLoader();
    Webservice().callLogOutService(context).then((onResponse) async {
      stopLoader();
      if (onResponse != null) {
        if (kDebugMode) {
          print(onResponse.success);
        }
        if (onResponse.success == true) {
          await Future.delayed(const Duration(seconds: 2));
          Future.microtask(() {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const SignInScreen()),
                  (route) => false,
            );
          });
          Fluttertoast.showToast(msg: 'Logout Successfully');


        } else {
          Fluttertoast.showToast(msg: "Failed to logout");
        }
      }
    }).catchError((error) {
      stopLoader();
      if (kDebugMode) {
        print(error);
      }
    });
  }


  startLoader() {
    LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  }

  stopLoader() {
    Navigator.of(context).pop();
  }
}
