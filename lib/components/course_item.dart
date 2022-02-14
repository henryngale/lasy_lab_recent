import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CourseItem extends StatefulWidget {
  final String courseName;
  final HexColor backgroundColor;
  final String image;
  final double progression;

  const CourseItem({
    Key? key,
    required this.courseName,
    required this.backgroundColor,
    required this.image,
    required this.progression,
  }) : super(key: key);

  @override
  State<CourseItem> createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
  //late PopupMenu menu;
  GlobalKey btnKey = GlobalKey();
  GlobalKey btnKey2 = GlobalKey();
  GlobalKey btnKey3 = GlobalKey();

  @override
  void initState() {
    super.initState();
  }
  //   menu = PopupMenu(
  //       items: [
  //         // MenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
  //         // MenuItem(title: 'Home', image: Icon(Icons.home, color: Colors.white,)),
  //         MenuItem(
  //           title: 'Mail',
  //           image: Icon(
  //             Icons.mail,
  //             color: Colors.white,
  //           ),
  //           textAlign: TextAlign.center,
  //           textStyle: TextStyle(),
  //         ),
  //         MenuItem(
  //           title: 'Power',
  //           image: Icon(
  //             Icons.power,
  //             color: Colors.white,
  //           ),
  //           textAlign: TextAlign.center,
  //           textStyle: TextStyle(),
  //         ),
  //         MenuItem(
  //           title: 'Setting',
  //           image: Icon(
  //             Icons.settings,
  //             color: Colors.white,
  //           ),
  //           textAlign: TextAlign.center,
  //           textStyle: TextStyle(),
  //         ),
  //         MenuItem(
  //           title: 'PopupMenu',
  //           image: Icon(
  //             Icons.menu,
  //             color: Colors.white,
  //           ),
  //           textAlign: TextAlign.center,
  //           textStyle: TextStyle(),
  //         )
  //       ],
  //       onClickMenu: onClickMenu,
  //       onDismiss: onDismiss,
  //       maxColumn: 4,
  //       context: context);
  // }

  // void stateChanged(bool isShow) {
  //   print('menu is ${isShow ? 'showing' : 'closed'}');
  // }

  // void onClickMenu(MenuItemProvider item) {
  //   print('Click menu -> ${item.menuTitle}');
  // }

  // void onDismiss() {
  //   print('Menu is dismiss');
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    //PopupMenu.context = context;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: screenSize.width * 0.21,
                height: screenSize.width * 0.21,
                child: CircularProgressIndicator(
                  strokeWidth: screenSize.width * 0.20 > 90 ? 10 : 8,
                  backgroundColor: HexColor("#D2E4E8"),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    HexColor("#FFD900"),
                  ),
                  value: widget.progression,
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.20 - 14,
                height: screenSize.width * 0.20 - 14,
                child: CircleAvatar(
                  backgroundColor: widget.backgroundColor,
                  child: SizedBox(
                    height: screenSize.width * 0.20 > 90 ? 50 : 25,
                    width: screenSize.width * 0.20 > 90 ? 50 : 25,
                    child: Image.asset(widget.image),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          widget.courseName,
          style: GoogleFonts.openSans(
            color: Colors.black,
            textStyle: TextStyle(
              fontSize: screenSize.width * 0.20 > 90 ? 16 : 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // void maxColumn() {
  //   PopupMenu menu = PopupMenu(
  //       // backgroundColor: Colors.teal,
  //       // lineColor: Colors.tealAccent,
  //       maxColumn: 3,
  //       items: [
  //         // MenuItem(
  //         //   title: 'Copy',
  //         //   image: Image.asset('assets/copy.png'),
  //         //   textAlign: TextAlign.center,
  //         //   textStyle: TextStyle(),
  //         // ),
  //         // MenuItem(
  //         //     title: 'Home',
  //         //     // textStyle: TextStyle(fontSize: 10.0, color: Colors.tealAccent),
  //         //     image: Icon(
  //         //       Icons.home,
  //         //       color: Colors.white,
  //         //     )),
  //         // MenuItem(
  //         //     title: 'Mail',
  //         //     image: Icon(
  //         //       Icons.mail,
  //         //       color: Colors.white,
  //         //     )),
  //         MenuItem(
  //           title: 'Power',
  //           image: Icon(
  //             Icons.power,
  //             color: Colors.white,
  //           ),
  //           textAlign: TextAlign.center,
  //           textStyle: TextStyle(),
  //         ),
  //         MenuItem(
  //           title: 'Setting',
  //           image: Icon(
  //             Icons.settings,
  //             color: Colors.white,
  //           ),
  //           textAlign: TextAlign.center,
  //           textStyle: TextStyle(),
  //         ),
  //         MenuItem(
  //           title: 'PopupMenu',
  //           image: Icon(
  //             Icons.menu,
  //             color: Colors.white,
  //           ),
  //           textAlign: TextAlign.center,
  //           textStyle: TextStyle(),
  //         )
  //       ],
  //       onClickMenu: onClickMenu,
  //       stateChanged: stateChanged,
  //       onDismiss: onDismiss,
  //       context: context);
  //   menu.show(widgetKey: btnKey);
  // }
}
