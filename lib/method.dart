import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ImageBox extends StatelessWidget {
  final String imagepath;
  final void Function()? onTap;
  final double innerpadding;

  const ImageBox(
      {Key? key,
      required this.imagepath,
      required this.onTap,
      required this.innerpadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 65, // Adjusted size for better visibility
        height: 65,
        padding: EdgeInsets.all(innerpadding),
        decoration: BoxDecoration(
          color: Colors.white, // White color for the inside
          borderRadius: BorderRadius.circular(20), // Rounded edges
          boxShadow: [
            BoxShadow(
              color: Color(0xFFADB6C4).withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagepath,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}

class GoogleSignInHelper {
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return FirebaseAuth.instance.signInWithCredential(credential);
    }

    return null;
  }
}
