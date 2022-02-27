import 'package:flutter/material.dart';
import 'package:sallaty/helper/icon.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconBroken.Arrow___Left_2),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.asset('assets/images/logo.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About the app',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'It is an electronic platform for selling all kinds of food products that the customer needs.And it aims to connect the owners of food projects to the customer,And therefore he can track his order from A to Z and send the user to the seller to find out more details about the product.It also enables the user to get all the nearby offers and provides him with the advantage of a free gift through a set of points he gets whenever he evaluates a product.  also provides the seller with several Features that enable him to add his goods and display them to the user.This application has an easy-to-use user interface, which ensures the integrity of the purchasing process for both parties.',
                    style: TextStyle(height: 2, fontSize: 16),
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
