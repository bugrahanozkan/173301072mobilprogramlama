
import 'package:flutter/material.dart';

import 'package:vizesinav/home.dart';

Widget bottomNavigationBar(String page){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(

      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(0,-3),
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10)
      ],
        color: const Color(0xFFEFF5FB),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavIcon(iconData: Icons.home_filled , active:page=="home"),
          buildNavIcon(iconData: Icons.search , active:page=="home"),
          buildNavIcon(iconData: Icons.shopping_cart , active: page=="home"),
          buildNavIcon(iconData: Icons.person, active:page=="home"),

        ],
      ),
    ),
  );

}
Widget buildNavIcon({ @required IconData iconData ,  @required bool active,} ) {
  return Icon(iconData, size: 20,
      color: Color(active ? 0xFF0001FC : 0xFFA1034));
}