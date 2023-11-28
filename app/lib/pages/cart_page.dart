import 'package:flutter/material.dart';
import 'package:fluttered/components/button.dart';
import 'package:fluttered/theme/colors.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primarycolor,
        appBar: AppBar(
          title: const Text("My Cart"),
          elevation: 0,
          backgroundColor: primarycolor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Food food = value.cart[index];
                  final String foodName = food.name;
                  final String foodPrice = food.price;
                  return Container(
                    decoration: BoxDecoration(
                        color: secondarycolor,
                        borderRadius: BorderRadius.circular(8)),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(foodPrice,
                          style: TextStyle(
                            color: Colors.grey[200],
                          )),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(food, context),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Pay Now",
                onTap: () {
                  payWithKhaltiInApp(context); // Pass context here
                },
              ),
            )
          ],
        ),
      ),
    );
  }

void payWithKhaltiInApp(BuildContext context) {
  void specificOnSuccess(dynamic success) {
    if (success is PaymentSuccessModel) {
      onSuccess(context, success);
    }
  }    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: 1000,
        productIdentity: "Product id",
        productName: "Product Name",
      ),
      preferences: [PaymentPreference.khalti],
      onSuccess: specificOnSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
  }

  void onSuccess(BuildContext context, success) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Payment successful"),
          actions: [
            SimpleDialogOption(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(failure.toString());
  }

  void onCancel() {
    debugPrint("cancel");
  }
}
