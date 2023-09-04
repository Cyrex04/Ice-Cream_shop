import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_trial/components/product_tile.dart';
import 'package:flutter_trial/model/cofee.dart';
import 'package:flutter_trial/model/icecream_shop.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class shoppage extends StatefulWidget {
  const shoppage({super.key});

  @override
  State<shoppage> createState() => _shoppageState();
}

class _shoppageState extends State<shoppage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  void addtocart(IceCream iceCream) {
    Provider.of<icecream_shop>(context, listen: false).additem(iceCream);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Item added to the cart!"),
            ));
  }

  double price = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<icecream_shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Color(0xFFF2E3C1), // Beige background color
        appBar: AppBar(
          backgroundColor:
              Color(0xFF294C60), // App bar color matching your color scheme
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
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              await _googleSignIn.disconnect();
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
                          addtocart(eachicecream);
                          setState(() {
                            price += double.parse(eachicecream
                                .price); // Parse the price as a double
                          });
                        },
                        iceCream: eachicecream,
                        icon: Icon(Icons.add),
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
