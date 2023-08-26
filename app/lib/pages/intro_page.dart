import 'package:flutter/material.dart';
import 'package:fluttered/components/button.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 130, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment:MainAxisAlignment.spaceEvenly,
           children: [
          const SizedBox(height: 25),
          //shop name
          Text(
            "RESTAURANT",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 25),

          // icon
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Image.asset('lib/images/burger.png',
              width: 200,
              height: 200,),
            ),
          ),
          //title
          const SizedBox(height: 10),

          Text(
            "THE TASTE OF DELICIOUS FOOD",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 40,
              color: Colors.white,
            ),
          ),

          //subtitle
          Text(
            "Feel the taste of the most popular food from anywhere and anytime",
            style: TextStyle(
              color: Colors.grey[200],
              height: 2,
            ),
          ),
                    const SizedBox(height: 15),
//button
MyButton(text: "Get Started",
onTap: () {
  Navigator.pushNamed(context, '/menupage');
},
)
        ],
        ),
      ),
    );
  }
}
