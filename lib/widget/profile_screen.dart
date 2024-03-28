import 'package:flutter/material.dart';
import 'package:luxury_project/widget/constant.dart';
import 'package:luxury_project/widget/small_text.dart';
import 'package:luxury_project/widget/string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFBF3),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xffFFFBF3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    Image.asset("asset/image/profilepicture.png"),
                    SmallText(
                      text: MyStrings.drAaronFinch,
                      size: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: MyStrings.poppins,
                      color: Colors.black,
                    ),
                    SmallText(
                      text: MyStrings.dermatologist,
                      size: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: MyStrings.poppins,
                      color: Color(0xfff8B8E8C),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          elevation: 4,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SmallText(
                                    color: blackColor,
                                    text: MyStrings.noOfExperience,
                                    fontFamily: MyStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    size: 16),
                                SmallText(
                                    color: Color(0xfff8B8E8C),
                                    text: MyStrings.experience,
                                    fontFamily: MyStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    size: 12),
                              ],
                            ),
                            width: 130,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xffFFFFFF)),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SmallText(
                                    color: blackColor,
                                    text: MyStrings.noOfAwards,
                                    fontFamily: MyStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    size: 16),
                                SmallText(
                                    color: Color(0xfff8B8E8C),
                                    text: MyStrings.awards,
                                    fontFamily: MyStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    size: 12),
                              ],
                            ),
                            width: 130,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xffFFFFFF)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  color: Color(0xffFFF4B7),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: MyStrings.biography,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyStrings.poppins,
                      color: blackColor,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text.rich(
                      TextSpan(
                        text:
                            "Dr. Aaron Finch, a renowned dermatologist, has dedicated her career to advancing skin health. Graduating top of her class from Harvard Medical School. With a passion for..",
                        style: TextStyle(
                          fontFamily: MyStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xfff8B8E8C),
                        ),
                        children: [
                          TextSpan(
                            text: " Read more",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: MyStrings.poppins,
                              color: Color(0xffEACF97),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SmallText(
                      text: MyStrings.contactInfo,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                      fontFamily: MyStrings.poppins,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.email_outlined,
                                          color: secondaryColor, size: 18),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SmallText(
                                        text: MyStrings.email,
                                        size: 13,
                                        color: secondaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: MyStrings.poppins,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SmallText(
                                    text: MyStrings.gmail,
                                    size: 10,
                                    fontFamily: MyStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff8B8E8C),
                                  )
                                ],
                              ),
                              height: 74,
                              width: 150,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffE7D682),
                                      blurRadius: 0.8,
                                      spreadRadius: 0.8,
                                      offset: Offset(
                                        0.5,
                                        0.5,
                                      ),
                                    )
                                  ],
                                  border: Border.all(color: primaryColor, width: 0.3),
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffFFFFFF)),
                            ),
                            // SizedBox(width: 30,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.celebration,
                                          color: secondaryColor, size: 18),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SmallText(
                                        text: MyStrings.birthday,
                                        size: 13,
                                        color: secondaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: MyStrings.poppins,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SmallText(
                                    text: MyStrings.date,
                                    size: 10,
                                    fontFamily: MyStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff8B8E8C),
                                  )
                                ],
                              ),
                              height: 74,
                              width: 150,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffE7D682),
                                      blurRadius: 0.8,
                                      spreadRadius: 0.8,
                                      offset: Offset(
                                        0.5,
                                        0.5,
                                      ),
                                    )
                                  ],
                                  border: Border.all(color: primaryColor, width: 0.3),
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffFFFFFF)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffE7D682),
                                  blurRadius: 1,
                                  spreadRadius:1,
                                  offset: Offset(
                                    0.5,
                                    0.5,
                                  ),
                                )
                              ],
                              border: Border.all(color: primaryColor, width: 1),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffFFFFFF)),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SmallText(
                                          text: MyStrings.registration,
                                          color: secondaryColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: MyStrings.poppins,
                                          size: 13),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "-NA-",
                                        style: TextStyle(
                                            fontFamily: MyStrings.poppins,
                                            color: Color(0xff8B8E8C),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SmallText(
                                        text: MyStrings.phone,
                                        size: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: MyStrings.poppins,
                                        color: secondaryColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SmallText(
                                        color: Color(0xff8B8E8C),
                                        text: MyStrings.phoneNo,
                                        size: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: MyStrings.poppins,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SmallText(
                                        text: MyStrings.postalCode,
                                        size: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: MyStrings.poppins,
                                        color: secondaryColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SmallText(
                                        color: Color(0xff8B8E8C),
                                        text: MyStrings.postalCodeNo,
                                        size: 10,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SmallText(
                                              text: MyStrings.city,
                                              color: secondaryColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: MyStrings.poppins,
                                              size: 13),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          SmallText(
                                              text: MyStrings.chennai,
                                              color: Color(0xff8B8E8C),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: MyStrings.poppins,
                                              size: 13),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SmallText(
                                            text: MyStrings.state,
                                            size: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: MyStrings.poppins,
                                            color: secondaryColor,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SmallText(
                                            color: Color(0xff8B8E8C),
                                            text: MyStrings.tamilNadu,
                                            size: 10,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: MyStrings.poppins,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SmallText(
                                            text: MyStrings.country,
                                            size: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: MyStrings.poppins,
                                            color: secondaryColor,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SmallText(
                                            color: Color(0xff8B8E8C),
                                            text: MyStrings.india,
                                            size: 10,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: MyStrings.poppins,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SmallText(
                                        text: MyStrings.address,
                                        size: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: MyStrings.poppins,
                                        color: secondaryColor,
                                      ),
                                      SmallText(
                                        text: MyStrings.addressForProfile,
                                        size: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: MyStrings.poppins,
                                        color: Color(0xff8B8E8C),
                                      ),
                                      SmallText(
                                        text: MyStrings.addressForProfile2,
                                        size: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: MyStrings.poppins,
                                        color: Color(0xff8B8E8C),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                          ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
