import 'package:flutter/material.dart';
import 'package:flutter_trial/components/goognavbar.dart';
import 'package:flutter_trial/pages/shoppage.dart';
import 'package:flutter_trial/pages/cartpage.dart'; // Import the cartpage

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected_index = 0;

  void navigateToPage(int index) {
    setState(() {
      selected_index = index;
    });
  }

  final List<Widget> pages = [
    const shoppage(),
    const cartpage()
  ]; // Instantiate ShopPage and CartPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E3C1), // Light beige background color
      bottomNavigationBar: goognavbar(
        onTabChange: (index) => navigateToPage(index),
      ),
      body: pages[selected_index], // Display the selected page
    );
  }
}
