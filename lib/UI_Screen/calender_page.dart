import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/constant.dart';
import '../widget/string.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  ScrollController? _scrollController;
  DateTime? _selectedDate;
  List<int> _selectedIndices = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    _selectedDate ??= DateTime.now();
    return Scaffold(
      backgroundColor: Color(0xffFFFBF3),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Appointments",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Remainder",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff172D2B),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${DateFormat('MMMM, yyyy').format(_selectedDate!)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff172D2B),
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: _selectedDate!,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null && picked != _selectedDate) {
                            setState(() {
                              _selectedDate = picked;
                              _selectedIndices.clear();
                              _scrollToSelectedDate(-1);
                            });
                          }
                        },
                        child: Icon(Icons.calendar_month),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 55,
                child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                  DateTime(_selectedDate!.year, _selectedDate!.month + 1, 0)
                      .day,
                  itemBuilder: (BuildContext context, int index) {
                    DateTime dateTime = DateTime(
                        _selectedDate!.year, _selectedDate!.month, index + 1);
                    String dayName = DateFormat('EEE').format(dateTime);
                    String day = (index + 1).toString();
                    Color color = _selectedIndices.contains(index)
                        ? Color(0xffFFE5A1)
                        : Color(0xffE6E6E6);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedIndices.contains(index)) {
                            _selectedIndices.remove(index);
                          } else {
                            _selectedIndices.add(index);
                          }
                        });
                        _scrollToSelectedDate(index);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 50,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: color,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dayName,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "$day",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _selectedIndices.map((index) {
                  DateTime selectedDateTime = DateTime(
                      _selectedDate!.year, _selectedDate!.month, index + 1);
                  return Container(
                    margin: EdgeInsets.all(8),
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor,
                            blurRadius: 2,
                            spreadRadius: 0.5,
                            offset: Offset(
                              0.5,
                              0.5,
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
                                child: Text(
                                  DateFormat('EEE').format(selectedDateTime),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  DateFormat('dd').format(selectedDateTime),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
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
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollToSelectedDate(int index) {
    double offset = index * 60.0;
    _scrollController!.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}