import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/Screen/CategoriesFeedsScreen.dart';
import 'package:sallaty/data/Salla/sallaapp_cubit.dart';

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SallaappCubit, SallaappState>(
        listener: (context, state) {},
        builder: (context, state) {
          var productsList = SallaappCubit.get(context).products;
          return Scaffold(
            body: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 240 / 420,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(productsList.length, (index) {
                return CategoriesFeedsScreen();
              }),
            ),
          );
        });
  }
}
