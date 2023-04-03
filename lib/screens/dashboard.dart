import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // current idex
  int _currentIndex = 0;

  List<String> imgs = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0H7wMwB5cvA2-aYOJxNz8Mwcc-261iAOK9Q&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP0Vrm4WekKaiP1Qf21TdOSc1p2hl9nt624g&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUCCjH3ARHq4E9TidyxvP2QhnqBj4xyeduQ73d7CW6E7cQklo_4Vn0LQdE05bkbdZyw_E&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUvqSnB2DVgg2JFQUdY0TQQ5rYLukB4XTZEQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCc-KjfPTMdmfFl7xyRgmEFUi5jWQ3zAd-lw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1XiJ6CA0VOgqDnK1DpLnGXbWwDLk3_XSL2A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwY5L3OrIMWp8PoheS2rrIkda4xqn4CTNyeGiaUHKNs3xW5VljM6KojT1p0E5PL7WkFj4&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKzA3WqRhw6wojQGJZaNp9EPXLyLxITBLa8Q&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAA4DjqjbtVWTcsh7X0BqCcapFgIME-DFd8w&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIJn7-pUXVOWv2oohfk8fJtsos2RHo47gzYQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFIizR6zknB1WarIkcxs87kCj4VYUARA5kSg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0H7wMwB5cvA2-aYOJxNz8Mwcc-261iAOK9Q&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP0Vrm4WekKaiP1Qf21TdOSc1p2hl9nt624g&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUCCjH3ARHq4E9TidyxvP2QhnqBj4xyeduQ73d7CW6E7cQklo_4Vn0LQdE05bkbdZyw_E&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUvqSnB2DVgg2JFQUdY0TQQ5rYLukB4XTZEQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCc-KjfPTMdmfFl7xyRgmEFUi5jWQ3zAd-lw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1XiJ6CA0VOgqDnK1DpLnGXbWwDLk3_XSL2A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwY5L3OrIMWp8PoheS2rrIkda4xqn4CTNyeGiaUHKNs3xW5VljM6KojT1p0E5PL7WkFj4&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKzA3WqRhw6wojQGJZaNp9EPXLyLxITBLa8Q&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAA4DjqjbtVWTcsh7X0BqCcapFgIME-DFd8w&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIJn7-pUXVOWv2oohfk8fJtsos2RHo47gzYQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFIizR6zknB1WarIkcxs87kCj4VYUARA5kSg&usqp=CAU"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar section
      appBar: customeAppBar("Famers Corner"),

      // body section
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: ListView.separated(
          separatorBuilder: (context, i) => const Divider(),
          itemCount: 22,
          itemBuilder: (context, i) => Container(
            height: 300,
            width: double.infinity,
            // color: bgGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    imgs[i],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      font1("Basmatic Rice"),
                      font2("N0_10,Success Estate,Lagos,Nigeria"),
                      const SizedBox(height: 10),
                      // font1("Main grain title"),
                      Align(
                        alignment: Alignment.topRight,
                        child: font3("20/20/2023"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),

      // flaoting button
      floatingActionButton: FloatingActionButton(
        backgroundColor: deepGreen,
        onPressed: () {},
        child: const Icon(Icons.edit),
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
