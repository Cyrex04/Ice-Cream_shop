import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../components/product_tile.dart';
import '../model/cofee.dart';
import '../model/icecream_shop.dart';

class guest extends StatelessWidget {
  const guest({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<icecream_shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color(0xFFF2E3C1), // Beige background color
        appBar: AppBar(
          backgroundColor: const Color(
              0xFF294C60), // App bar color matching your color scheme
          title: const Text(
            "Shop",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ),
        extendBody: true, // Fix white box issue
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.icecreamshop.length,
                    itemBuilder: (context, index) {
                      IceCream eachicecream = value.icecreamshop[index];
                      return ProductTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                    title: Text(
                                        "You cant add an item until you login!"),
                                  ));
                        },
                        iceCream: eachicecream,
                        icon: const Icon(Icons.add),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
