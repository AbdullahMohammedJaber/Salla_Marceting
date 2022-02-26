import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/Authentecation/Login.dart';
import 'package:sallaty/Screen/CategoriesFeedsScreen.dart';
import 'package:sallaty/Screen/ProductDetails.dart';
import 'package:sallaty/Screen/homelayout.dart';
import 'package:sallaty/Screen/porder.dart';

import 'package:sallaty/Screen/splash.dart';
import 'package:sallaty/data/Auth/sallaauth_cubit.dart';
import 'package:sallaty/data/Salla/sallaapp_cubit.dart';
import 'package:sallaty/helper/CashHelper.dart';
import 'package:sallaty/helper/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CashHelper.init();
  uId = CashHelper.getDataApp(key: 'isLogin');
  bool onBorder = CashHelper.getDataApp(key: 'onBorder');

  print('the uId is ${uId}');
  print('thw onBorder is ${onBorder}');
  Widget testWidget;
  if (onBorder != null) {
    if (uId != null) {
      testWidget = HomeLayout();
    } else {
      testWidget = LoginScreen();
    }
  } else {
    testWidget = SplashScreenState();
  }
  runApp(MyApp(
    testWidget: testWidget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget testWidget;
  MyApp({
    @required this.testWidget,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SallaauthCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SallaappCubit()..fetchProducts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: testWidget,
        routes: {
          //   '/': (ctx) => LandingPage(),

          CategoriesFeedsScreen.routeName: (ctx) => CategoriesFeedsScreen(),
          ProductDetails.routeName: (ctx) => ProductDetails(),
        },
      ),
    );
  }
}
