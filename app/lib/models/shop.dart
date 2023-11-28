import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
//food menu
  final List<Food> _foodMenu = [
    Food(
      name: "burger",
      price: " Rs.350",
      imagePath: "lib/images/burger.png",
      rating: "4.3",
    ),
    //pizza
    Food(
      name: "pizza",
      price: "Rs.350",
      imagePath: "lib/images/pizza.png",
      rating: "4.3",
    ),
    //sandwich
    Food(
      name: "sandwich",
      price: "RS.350",
      imagePath: "lib/images/sandwich.png",
      rating: "4.3",
    ),
  ];
  //customer cart
  final List<Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
        notifyListeners();

  }
}
