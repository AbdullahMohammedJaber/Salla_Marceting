import 'package:flutter/material.dart';
import 'package:sallaty/Screen/porder.dart';

class SplashScreenState extends StatefulWidget {
  @override
  State<SplashScreenState> createState() => _SplashScreenStateState();
}

class _SplashScreenStateState extends State<SplashScreenState> {
  // ignore: prefer_final_fields
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return BorderPage();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
