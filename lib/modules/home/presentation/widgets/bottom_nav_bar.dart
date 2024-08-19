import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/assets/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.05),
        boxShadow: const [],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      height: 70,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconSize: 35,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.point_of_sale,
                color: Colors.transparent,
              ),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: AppColour.textColor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class HexagonBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double width = rect.width;
    final double height = rect.height;
    final double hexagonWidth = width * 0.5;
    final double hexagonHeight = height * 0.5;

    return Path()
      ..moveTo(rect.left + hexagonWidth * 0.5, rect.top)
      ..lineTo(rect.left + hexagonWidth * 1.5, rect.top)
      ..lineTo(rect.left + hexagonWidth * 2, rect.top + hexagonHeight)
      ..lineTo(rect.left + hexagonWidth * 1.5, rect.top + hexagonHeight * 2)
      ..lineTo(rect.left + hexagonWidth * 0.5, rect.top + hexagonHeight * 2)
      ..lineTo(rect.left, rect.top + hexagonHeight)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => HexagonBorder();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }
}
