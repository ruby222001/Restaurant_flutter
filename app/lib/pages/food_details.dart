import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fluttered/components/button.dart';
import 'package:fluttered/models/shop.dart';
import 'package:fluttered/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity
  int quantityCount = 0;

  //decrement quatity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //increment quantity
  void incrementQuantity() {
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

  void addToCart() {
    //only if there is something
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();
//add to cart
      shop.addToCart(widget.food, quantityCount);
      //let the user know it was successful
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Succesfully added to cart"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(children: [
        //listview of food details
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                //image
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),
                const SizedBox(height: 25),
                //rating
                Row(
                  children: [
                    //star icon
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //rating number
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),
                const SizedBox(height: 25),
                //description
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "hsdscdfdfhdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
        //price quantity+add to card button
        Container(
          color: primarycolor,
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
//price quantity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
//price

                  Text(
                    "\$" + widget.food.price,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  //quantity

                  Row(
                    children: [
                      //minus button
                      Container(
                        decoration: BoxDecoration(
                            color: secondarycolor, shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: decrementQuantity,
                        ),
                      ),
//quantity count

                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            quantityCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      //plus button
                      Container(
                        decoration: BoxDecoration(
                            color: secondarycolor, shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: incrementQuantity,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //add to cart
                  MyButton(text: "Add To Cart", onTap: addToCart),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
