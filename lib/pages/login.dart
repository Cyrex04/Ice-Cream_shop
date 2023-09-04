import 'package:flutter/material.dart';
import 'package:flutter_trial/pages/Homepage.dart';
import 'package:flutter_trial/pages/cartpage.dart';
import 'package:flutter_trial/pages/guest_shop.dart';
import 'package:flutter_trial/pages/shoppage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../method.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E3C1), // Light beige background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Image.asset(
                "assets/images/ice-cream.png", // Updated image path
                height: 300, // Larger image size
              ),
              SizedBox(height: 50),
              Text(
                "Creamy Cravings",
                style: GoogleFonts.fredokaOne(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF294C60), // Dark blue color for the text
                ),
              ),
              SizedBox(height: 20), // Increased spacing
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => guest()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF001B2E), // Dark blue color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        50), // Rounded edges with more curve
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60, // Increased horizontal padding for width
                    vertical: 20,
                  ),
                  elevation: 5, // Add elevation for a luxurious look
                ),
                child: Text(
                  "Join as a Guest",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageBox(
                    imagepath: "assets/images/google.png",
                    onTap: () {
                      GoogleSignInHelper().signInWithGoogle();
                      bool signedin = true;
                    },
                    innerpadding: 0,
                  ),
                  SizedBox(width: 20), // Add spacing between buttons
                  ImageBox(
                    imagepath: "assets/images/apple.png",
                    onTap: () {
                      GoogleSignInHelper().signInWithGoogle();
                      bool signedin = true;
                    },
                    innerpadding: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
