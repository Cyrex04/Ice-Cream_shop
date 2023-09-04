import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../components/product_tile.dart';
import '../model/cofee.dart';
import '../model/icecream_shop.dart';

class cartpage extends StatefulWidget {
  const cartpage({super.key});

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  double price = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<icecream_shop>(
      builder: (context, value, child) {
        // Calculate the total price when the widget builds
        price = 0;
        for (IceCream item in value.usercart) {
          price += double.parse(item.price);
        }

        return Scaffold(
          backgroundColor: Color(0xFFF2E3C1), // Beige background color
          appBar: AppBar(
            backgroundColor:
                Color(0xFF294C60), // App bar color matching your color scheme
            title: const Text(
              "Cart",
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
          extendBody: true,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.usercart.length,
                      itemBuilder: (context, index) {
                        IceCream eachicecream = value.usercart[index];
                        return ProductTile(
                          onTap: () {
                            value.removeitem(eachicecream);
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Item removed succesfully!"),
                                    )); // Update cart via the provider
                          },
                          iceCream: eachicecream,
                          icon: Icon(Icons.delete),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20), // Add spacing
                  Text(
                    "Total Price: \$${price.toStringAsFixed(2)}", // Format price with 2 decimal places
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Add spacing
                  ElevatedButton(
                    onPressed: () {
                      if (price > 0) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("payment done succsesfully!"),
                                ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Change the button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                    ),
                    child: Text(
                      "Pay",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
