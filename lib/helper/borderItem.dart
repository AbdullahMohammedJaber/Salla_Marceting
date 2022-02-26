// ignore: file_names
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget BorderItem(param0, int index, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Image.asset(
          param0[index].image,
          fit: BoxFit.contain,
        ),
      ),
      Text(param0[index].title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )),
      const SizedBox(
        height: 30,
      ),
      Text(
        param0[index].descreption,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 60,
      ),
    ],
  );
}
