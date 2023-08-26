import 'package:flutter/material.dart';
import 'package:fluttered/components/button.dart';
import 'package:fluttered/models/food.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //food menu
  List foodMenu = [
    Food(
      name: "burger",
      price: "350",
      imagePath: "lib/images/burger.png",
      rating: "4.3",
    ),
    //pizza
    Food(
      name: "pizza",
      price: "350",
      imagePath: "lib/images/pizza.png",
      rating: "4.3",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 207, 207),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          "MOMO",
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),

      //body portion
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//promo banner
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primarycolor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
//promo message
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get 30% Promo',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      //redeem button
                      MyButton(
                        text: "Redeem",
                        onTap: () {},
                      ),
                    ],
                  ),

//image

                  Image.asset(
                    'lib/images/pizza.png',
                    height: 100,
                  )
                ]),
          ),
          //search bar
          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 10),

          //popular food
        ],
      ),
    );
  }
}
