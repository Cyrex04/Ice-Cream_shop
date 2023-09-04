import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class goognavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  goognavbar({super.key, required this.onTabChange});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        backgroundColor: Color(0xFFF2E3C1), // Light beige background color
        onTabChange: (value) => onTabChange!(value),
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBorderRadius: 24,
        tabs: [
          const GButton(icon: Icons.home, text: "Shop"),
          const GButton(icon: Icons.shopping_bag_outlined, text: "Cart"),
        ],
      ),
    );
  }
}
