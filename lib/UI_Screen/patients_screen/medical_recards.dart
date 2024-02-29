import 'package:flutter/material.dart';

import 'image_upload_screen.dart';

class MedicalRecordsScreen extends StatefulWidget {
  const MedicalRecordsScreen({Key? key}) : super(key: key);

  @override
  State<MedicalRecordsScreen> createState() => _MedicalRecordsScreenState();
}

class _MedicalRecordsScreenState extends State<MedicalRecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      // child: Column(
      //   children: [
      //     Container(
      //         height: MediaQuery.of(context).size.height,
      //         child: Padding(
      //           padding: const EdgeInsets.all(15),
      //           child: ImageUploadScreen(),
      //         )),
      //   ],
      //   ),
    );
  }
}
