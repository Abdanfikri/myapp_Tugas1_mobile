import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/tripplan/views/tripplan_view.dart';
import 'app/modules/favorite/views/favorite_view.dart';
import 'app/modules/profile/views/profile_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final RxInt _selectedIndex = 0.obs;

  final List<Widget> _pages = [
    HomeView(),
    TripplanView(),
    FavoriteView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(142, 19, 44, 207),
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          title: const Center(
            child: Text(
              'Hotel Booking App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => _pages[_selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(142, 19, 44, 207),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: _selectedIndex.value,
              onTap: _onItemTapped,
              selectedItemColor: const Color.fromARGB(218, 133, 120, 120),
              unselectedItemColor: Colors.white,
              selectedFontSize: 16,
              unselectedFontSize: 14,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'Trip plan',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}