import 'package:flutter/material.dart';
import 'package:grain/screens/navbar/home.dart';
import 'package:grain/screens/navbar/services.dart';
import 'package:iconly/iconly.dart';
import '../utilities/colors.dart';
import 'navbar/profile.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // current idex
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomePage(),
          Services(),
          Services(),
          Profile(),
        ],
      ),

// bottom nav
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: appColor,
        unselectedItemColor: lightGrey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.ticket), label: "Services"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.bookmark), label: "Bookmark"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile), label: "Profile"),
        ],
        onTap: (value) => setState(() => _currentIndex = value),
      ),
    );
  }
}
