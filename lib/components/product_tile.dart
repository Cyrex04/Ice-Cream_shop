import 'package:flutter/material.dart';
import 'package:flutter_trial/model/cofee.dart';
import '../model/cofee.dart';

class ProductTile extends StatelessWidget {
  final void Function()? onTap;
  final IceCream iceCream;
  final Widget icon;

  ProductTile({
    Key? key,
    required this.onTap,
    required this.iceCream,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(8),
          child: ListTile(
            onTap: onTap,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            tileColor: Colors.white, // Background color for the tile
            title: Text(
              iceCream.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black, // Text color
              ),
            ),
            leading: Image.asset(
              iceCream.imagepath,
              fit: BoxFit.cover,
            ),
            subtitle: Text(
              "\$${iceCream.price}", // Format price with 2 decimal places
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey, // Subtitle text color
              ),
            ),
            trailing: icon, // Icon or widget to be displayed on the right side
          ),
        ),
      ),
    );
  }
}
