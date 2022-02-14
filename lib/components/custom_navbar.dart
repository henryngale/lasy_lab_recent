library custom_line_indicator_bottom_navbar;

import 'package:flutter/material.dart';

enum IndicatorType { Top, Bottom }

class CustomLineIndicatorBottomNavbar1 extends StatelessWidget {
  final Color? backgroundColor;
  final List<CustomBottomBarItems1> customBottomBarItems;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unselectedFontSize;
  final Color? splashColor;
  final int currentIndex;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType1;
  final Function(int) onTap;
  final double selectedFontSize;
  final LinearGradient? gradient;

  CustomLineIndicatorBottomNavbar1({
    this.backgroundColor,
    this.selectedColor,
    required this.customBottomBarItems,
    this.unSelectedColor,
    this.unselectedFontSize = 11,
    this.selectedFontSize = 12,
    this.splashColor,
    this.currentIndex = 0,
    required this.onTap,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType1 = IndicatorType.Top,
    this.gradient,
  });
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme =
        BottomNavigationBarTheme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? bottomTheme.backgroundColor,
        gradient: gradient,
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < customBottomBarItems.length; i++) ...[
              Expanded(
                child: CustomLineIndicatorBottomNavbarItems1(
                  selectedColor: selectedColor,
                  unSelectedColor: unSelectedColor,
                  child: customBottomBarItems[i].child,
                  label: customBottomBarItems[i].label,
                  unSelectedFontSize: unselectedFontSize,
                  selectedFontSize: selectedFontSize,
                  splashColor: splashColor,
                  currentIndex: currentIndex,
                  enableLineIndicator: enableLineIndicator,
                  lineIndicatorWidth: lineIndicatorWidth,
                  indicatorType: indicatorType1,
                  index: i,
                  onTap: onTap,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class CustomBottomBarItems1 {
  //final IconData? icon;
  final String label;
  final Widget child;

  CustomBottomBarItems1({
    required this.child,
    //this.icon,
    required this.label,
  });
}

class CustomLineIndicatorBottomNavbarItems1 extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final Widget? child;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unSelectedFontSize;
  final double selectedFontSize;
  final Color? splashColor;
  final int? currentIndex;
  final int index;
  final Function(int) onTap;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType;

  CustomLineIndicatorBottomNavbarItems1({
    this.icon,
    this.label,
    this.selectedColor,
    this.unSelectedColor,
    this.unSelectedFontSize = 11,
    this.selectedFontSize = 12,
    this.splashColor,
    this.currentIndex,
    required this.onTap,
    required this.index,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.Top,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme =
        BottomNavigationBarTheme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: splashColor ?? Theme.of(context).splashColor,
            onTap: () {
              onTap(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: enableLineIndicator
                    ? Border(
                        bottom: indicatorType == IndicatorType.Bottom
                            ? BorderSide(
                                color: currentIndex == index
                                    ? selectedColor ??
                                        bottomTheme.selectedItemColor!
                                    : Colors.transparent,
                                width: lineIndicatorWidth,
                              )
                            : BorderSide(color: Colors.transparent),
                        top: indicatorType == IndicatorType.Top
                            ? BorderSide(
                                color: currentIndex == index
                                    ? selectedColor ??
                                        bottomTheme.selectedItemColor!
                                    : Colors.transparent,
                                width: lineIndicatorWidth,
                              )
                            : BorderSide(color: Colors.transparent),
                      )
                    : null,
              ),
              padding: EdgeInsets.symmetric(vertical: 7.0),
              // width: 70,
              // height: 60,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 30,
                    child: child,
                  ),
                  // Icon(
                  //   icon,
                  // color: currentIndex == index
                  //     ? selectedColor ?? bottomTheme.unselectedItemColor
                  //     : unSelectedColor,
                  // ),
                  SizedBox(height: 5.0),
                  Text(
                    '$label',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: currentIndex == index
                          ? selectedFontSize
                          : unSelectedFontSize,
                      color: currentIndex == index
                          ? selectedColor ?? bottomTheme.unselectedItemColor
                          : unSelectedColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
