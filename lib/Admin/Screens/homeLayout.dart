import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/Screen/upload_product.dart';
import 'package:sallaty/data/Salla/sallaapp_cubit.dart';
import 'package:sallaty/helper/icon.dart';

class HomeLayoutAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SallaappCubit, SallaappState>(
        listener: (context, state) {},
        builder: (context, state) {
          var home = SallaappCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'Sallaty',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UploadProductForm()));
                  },
                  icon: Icon(IconBroken.Upload),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(IconBroken.Buy),
                  color: Colors.black,
                ),
              ],
            ),
            body: home.Admin[home.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.grey,
              onTap: (index) {
                home.ChangeNav(index);
              },
              currentIndex: home.currentIndex,
              selectedItemColor: Colors.pink,
              unselectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Category),
                  label: 'feeds',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Category),
                  label: 'my feeds',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Message),
                  label: 'chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting),
                  label: 'Setting',
                ),
              ],
            ),
          );
        });
  }
}
