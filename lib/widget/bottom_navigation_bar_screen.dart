import 'package:flutter/material.dart';
import 'package:luxury_project/widget/profile_screen.dart';
import '../UI_Screen/patients_screen/patient_list_screen.dart';
import 'home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
       HomeScreen(),
      PatientListScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(39),
          child: BottomNavigationBar(
            backgroundColor: Color(0xffFFF0CA),
            currentIndex: _currentIndex,
            selectedItemColor: Color(0xff172D2B),
            unselectedItemColor: Color(0xff6F6F6F),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300), curve: Curves.ease);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_outlined),
                label: 'Patient',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),

    );
  }
}
