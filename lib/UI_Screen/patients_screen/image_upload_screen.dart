import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luxury_project/UI_Screen/patients_screen/patients_screen.dart';
import 'package:luxury_project/widget/constant.dart';
import 'package:luxury_project/widget/string.dart';
import '../../widget/bottom_navigation_bar_screen.dart';
import 'check_photo_screen.dart';
import 'patient_list_screen.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({Key? key}) : super(key: key);

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  bool _beforeChecked = false;
  bool _afterChecked = false;
  String? _beforeImagePath;
  String? _afterImagePath;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: primaryColor,
              ),
              title: const Text(
                'Camera',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: MyStrings.poppins,
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Dismiss the bottom sheet
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Column(
                        children: [
                          const Text("Take a close-up photo",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: MyStrings.poppins)),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Keep the phone around 10cm away",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: MyStrings.poppins)),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Kfrom the selected area",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: MyStrings.poppins)),
                          Image.asset("asset/image/tookcamera.png")
                        ],
                      ),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            _handleCamera(context);
                          },
                          child: Center(
                            child: Container(
                              width: 91,
                              height: 44,
                              decoration: BoxDecoration(
                                  color: const Color(0xff172D2B),
                                  borderRadius: BorderRadius.circular(9)),
                              child: Center(
                                child: Text("Got it",
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontFamily: MyStrings.poppins,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library, color: primaryColor),
              title: const Text('Gallery',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: MyStrings.poppins,
                      fontWeight: FontWeight.w400)),
              onTap: () {
                Navigator.pop(context); // Dismiss the bottom sheet
                _handleGallery(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _handleCamera(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        if (_beforeChecked) {
          _beforeImagePath = pickedFile.path;
        } else if (_afterChecked) {
          _afterImagePath = pickedFile.path;
        }
      });
      if (mounted) {
        _navigateToCheckScreen(context);
      }
    }
  }

  void _handleGallery(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (_beforeChecked) {
          _beforeImagePath = pickedFile.path;
        } else if (_afterChecked) {
          _afterImagePath = pickedFile.path;
        }
      });
      if (mounted) {
        _navigateToCheckScreen(context);
      }
    }
  }

  void _navigateToCheckScreen(BuildContext context) {
    String? imagePath = _beforeChecked ? _beforeImagePath : _afterImagePath;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckPhotoScreen(imagePath: imagePath!),
      ),
    ).then((value) {
      if (value != null && value is bool) {
        if (value) {
          Navigator.pop(context);
        } else {
          _handleCamera(context);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF3),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PatientListScreen()),
              );
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff1C1B1F),
              size: 20,
            )),
        backgroundColor: primaryColor,
        title: Text(
          "Upload",
          style: TextStyle(
              fontFamily: "Poppins",
              color: blackColor,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PatientDetailsPage(),
            const SizedBox(height: 10),
            const Text(
              "Please ensure the details",
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: Color(0xff172D2B),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _showBottomSheet(context);
                    setState(() {
                      _beforeChecked = true;
                      _afterChecked = false;
                    });
                  },
                  child: Column(
                    children: [
                      if (_beforeImagePath != null)
                        Column(
                          children: [
                            SizedBox(
                              height: 180,
                              width: 160,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  File(_beforeImagePath!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Before",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      else
                        Container(
                          height: 180,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color:
                                  _beforeChecked ? primaryColor : primaryColor,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: _beforeChecked
                                ? [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(0.5),
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                      offset: const Offset(0, 0),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _beforeChecked
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          right: 13, top: 12),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.check_circle_outline,
                                          color: primaryColor,
                                          size: 25,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              Image.asset(
                                "asset/image/beforeimage.png",
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Before",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showBottomSheet(context);
                    setState(() {
                      _afterChecked = true;
                      _beforeChecked = false;
                    });
                  },
                  child: Column(
                    children: [
                      _afterImagePath != null
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 180,
                                  width: 160,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.file(
                                      File(_afterImagePath!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "After",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          : Container(
                              height: 180,
                              width: 160,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: _afterChecked
                                      ? primaryColor
                                      : primaryColor,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: _afterChecked
                                    ? [
                                        BoxShadow(
                                          color: primaryColor.withOpacity(0.5),
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                          offset: const Offset(0, 0),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _afterChecked
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              right: 13, top: 12),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(
                                              Icons.check_circle_outline,
                                              color: primaryColor,
                                              size: 25,
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  Image.asset(
                                    "asset/image/recoverimage.png",
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "After",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: blackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  if (_beforeImagePath == null || _afterImagePath == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                        'Please upload both images',
                        style: TextStyle(fontFamily: MyStrings.poppins),
                      )),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BottomNavigationBarScreen()),
                    );
                  }
                },
                child: Container(
                  height: 44,
                  width: 121,
                  decoration: BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
