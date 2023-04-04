import 'package:flutter/material.dart';
import 'package:grain/models/facilityclass.dart';
import 'package:grain/screens/facilitypages/facilities.dart';
import 'package:grain/screens/farmerspages/farmersCorner.dart';
import 'package:grain/screens/services.dart';
import '../utilities/colors.dart';

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
          FarmersCorner(),
          StorageFacilities(),
          Services(),
        ],
      ),

// bottom nav
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: deepGreen,
        unselectedItemColor: lightGrey,
        elevation: 0,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.rice_bowl_outlined), label: "Farmer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.house_siding_outlined), label: "Facilities"),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services_outlined), label: "Services")
        ],
        onTap: (value) => setState(() => _currentIndex = value),
      ),
    );
  }
}
