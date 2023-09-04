import 'package:flutter/material.dart';
import 'package:flutter_trial/model/cofee.dart';
import 'package:flutter_trial/pages/cartpage.dart';
import 'package:flutter_trial/pages/shoppage.dart';

class icecream_shop extends ChangeNotifier {
  //list of the items
  List<IceCream> list = [
    IceCream(
        imagepath: "assets/images/triple bowl.png",
        name: "Triple Bowl",
        price: "5.99"),
    IceCream(
        imagepath: "assets/images/triple biscuit.png",
        name: "Triple Biscuit",
        price: "6.49"),
    IceCream(
        imagepath: "assets/images/stick.png",
        name: "Ice Cream Stick",
        price: "2.99"),
    IceCream(
        imagepath: "assets/images/single biscuit.png",
        name: "Single Biscuit",
        price: "3.49"),
    IceCream(
        imagepath: "assets/images/large single bowel.png",
        name: "Single Large Bowl",
        price: "4.99"),
    IceCream(
        imagepath: "assets/images/sundae.png", name: "Sundae", price: "6.99"),
    IceCream(
        imagepath: "assets/images/chips and biscuit.png",
        name: "Chocolate Chips & Biscuit",
        price: "5.49"),
  ];
  //users cart
  List<IceCream> usercart = [];

  List<IceCream> get icecreamshop => list;
  List<IceCream> get cart => usercart;
  double totalPrice = 0; // Initialize total price to zero

  void calculateTotalPrice() {
    totalPrice = 0; // Reset total price
    for (IceCream item in usercart) {
      totalPrice += double.parse(
          item.price); // Parse the price as a double and add it to the total
    }
    notifyListeners(); // Notify listeners when the total price is updated
  }

  void additem(IceCream) {
    usercart.add(IceCream);
    notifyListeners();
  }

  void removeitem(IceCream) {
    usercart.remove(IceCream);
    notifyListeners();
  }
}
