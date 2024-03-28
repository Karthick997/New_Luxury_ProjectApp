import 'package:flutter/material.dart';
import 'package:luxury_project/widget/string.dart';

class AddPrescriptionScreen extends StatefulWidget {
  AddPrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<AddPrescriptionScreen> createState() => _AddPrescriptionScreenState();
}

class _AddPrescriptionScreenState extends State<AddPrescriptionScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<String> items = [
    'Salyzap daytime gel(Acne)',
    'Salyzap daytime gel',
    'Salyzap',
    'Salyzap daytime gel',
    'Salyzap daytime gel(Acne)',
    'Salyzap daytime gel',
    'Salyzap',
  ];

  bool _showList = false;
  String _selectedItem = '';
  String _notesAndDescription = '';
  List<Map<String, String>> _amRoutineItems = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Container(
                height: 3,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Prescription",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "AM",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    width: 31,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "PM",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
            controller: _controller,
            cursorColor: Colors.blue,
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
              hintText: "Select the items here",
              hintStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Color(0xff8E8D8D),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15), // Adjust the vertical padding here
            ),
            onTap: () {
              setState(() {
                _showList = !_showList;
              });
            },
          ),
          if (_showList)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(items[index],
                        style: TextStyle(fontFamily: MyStrings.poppins)),
                    onTap: () {
                      setState(() {
                        _selectedItem = items[index];
                        _controller.text = _selectedItem;
                        _showList = false;
                      });
                    },
                  );
                },
              ),
            ),
          SizedBox(
            height: 15,
          ),
          TextField(
            cursorColor: Colors.blue,
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
                color: Color(0xff8E8D8D),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 15), // Adjust the vertical padding here
            ),
            onChanged: (value) {
              _notesAndDescription = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      print(
                          'Clear button tapped'); // Check if this message is printed
                      _selectedItem = '';
                      _notesAndDescription = '';
                      _controller.clear();
                    });
                  },
                  child: Center(
                    child: Text(
                      'Clear',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  if (_selectedItem.isNotEmpty &&
                      _notesAndDescription.isNotEmpty) {
                    setState(() {
                      _amRoutineItems.add({
                        'item': _selectedItem,
                        'notes': _notesAndDescription,
                      });
                      _selectedItem = '';
                      _notesAndDescription = '';
                    });
                  } else {
                    _controller
                        .clear(); // Clear the text field only if both fields are not added
                  }
                },
                child: Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'AM Routine',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffFFEFC6),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: _amRoutineItems.reversed.map((item) {
                    final int index = _amRoutineItems.indexOf(item);
                    return Dismissible(
                      key: Key(index.toString()),
                      onDismissed: (direction) {
                        setState(() {
                          _amRoutineItems.removeAt(index);
                        });
                      },
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['item']!,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item['notes']!,
                                overflow: TextOverflow.fade,
                                maxLines: 5,
                                softWrap: false,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.cancel_outlined),
                            onPressed: () {
                              setState(() {
                                _amRoutineItems.removeAt(index);
                              });
                            },
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
