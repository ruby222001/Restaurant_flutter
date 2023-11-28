import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/food.dart';


class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({super.key,
  required this.food,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap:onTap,
      child: Container(
      decoration: BoxDecoration(color: Colors.grey[100],
      borderRadius: BorderRadius.circular(20),
      ),
      margin:const EdgeInsets.only(left: 25.0),
      padding:const  EdgeInsets.all(10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
const SizedBox(height: 25),

          Image.asset(food.imagePath,
          height: 100,
          ),
const SizedBox(height: 20),
          //text
          Text(food.name,
          style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),
const SizedBox(height: 20),

          //price+rating
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              //price

              Text(food.price,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[700]),),
              //rating
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[800],),
                  Text(food.rating,style: const TextStyle(color: Colors.grey),),
                ],
              ),
            ],
            ),
          )
        ],
      ),
    ),
    );
  }
}
