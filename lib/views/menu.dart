import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/custom_navbar.dart';
import 'package:lasylab_mobile_app/views/activities.dart';
//import 'package:lasylab_mobile_app/views/chat_background.dart';
import 'package:lasylab_mobile_app/views/chat_page.dart';
import 'package:lasylab_mobile_app/views/home.dart';
import 'package:lasylab_mobile_app/views/research_page.dart';

import 'chat_background.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // final List screens = [
  //   HomePage(),
  //   ActivitiesPage(),
  //   ChatPage(), //ChatBackground(),
  //   ResearchPage(),
  // ];

  bool seen = false;
  int selectedIndex = 0;
  late PageController pageController;
  bool firstime = true;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          //screens[selectedIndex],
          PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomePage(),
          ActivitiesPage(),
          (firstime == true) ? ChatBackground() : ChatPage(),
          ResearchPage(),
        ],
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar1(
        selectedColor: HexColor("#58CC02"),
        unSelectedColor: HexColor("#AFAFAF"),
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          pageController.animateToPage(
            selectedIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutQuad,
          );
          if (index == 2) {
            Future.delayed(Duration(seconds: 3), () {
              setState(() {
                firstime = false;
              });
            });
          }
          print(firstime);
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType1: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems1(
            label: 'accueil',
            child: Image.asset("assets/images/studylogo.png"),
          ),
          CustomBottomBarItems1(
            label: 'Activités',
            child: Image.asset("assets/images/logodots.png"),
          ),
          CustomBottomBarItems1(
            label: 'Messages',
            child: Image.asset("assets/images/messagelogo.png"),
          ),
          CustomBottomBarItems1(
            label: 'Recherche',
            child: Image.asset("assets/images/Search.png"),
          ),
        ],
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 4,
      //   unselectedItemColor: Colors.grey,
      //   selectedItemColor: Colors.black87,
      //   backgroundColor: Colors.white,
      //   currentIndex: selectedIndex,
      //   onTap: (index) {
      //     setState(() {
      //       selectedIndex = index;
      //       print(selectedIndex);
      //     });
      //   },
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         child: Image.asset("assets/navimages/studylogo.png"),
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         child: Image.asset("assets/navimages/logodots.png"),
      //       ),
      //       label: 'Profile',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         child: Image.asset("assets/navimages/messagelogo.png"),
      //       ),
      //       label: 'Shop',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         child: Image.asset("assets/navimages/search.png"),
      //       ),
      //       label: 'Shop',
      //     ),
      //   ],
      //   iconSize: 30,
      // ),
    );
  }
}
