import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/Screen/search.dart';
import 'package:sallaty/data/Auth/sallaauth_cubit.dart';
import 'package:sallaty/data/Salla/sallaapp_cubit.dart';
import 'package:sallaty/helper/const.dart';
import 'package:sallaty/helper/icon.dart';
import 'package:sallaty/lenyar/category_widget.dart';
import 'package:sallaty/lenyar/product_widget.dart';
import 'package:sallaty/model/carousar.dart';
import 'package:sallaty/model/product.dart';

class Home extends StatelessWidget {
  var searchController = TextEditingController();
  List<corsar> panners = [
    corsar(
      color: Colors.green[700],
      image: 'assets/images/panners1.png',
      text: 'More than 20% discountfor the first order',
    ),
    corsar(
      color: Colors.blue[700],
      image: 'assets/images/panners1.png',
      text: 'More than 20% discountfor the first order',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SallaappCubit, SallaappState>(
        listener: (context, state) {},
        builder: (context, state) {
          var products = SallaappCubit.get(context).products;
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEmailTF(context),
                    SizedBox(
                      height: 10,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        disableCenter: true,
                        scrollPhysics: BouncingScrollPhysics(),
                        height: 150,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 1),
                        autoPlayAnimationDuration: Duration(milliseconds: 400),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: panners
                          .map(
                            (item) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: item.color,
                              ),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100,
                                        child: Text(
                                          item.text,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    item.image,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Categoryies',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: 120,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 5,
                          );
                        },
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctx, int index) {
                          // return CategoryWidget(
                          //   index: index,
                          // );
                          return CategoryWidget(
                            index: index,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Latest Offers',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildHome(context, index, products),
                        itemCount: products.length,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildHome(context, index, products),
                        itemCount: products.length,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        disableCenter: true,
                        scrollPhysics: BouncingScrollPhysics(),
                        height: 150,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 1),
                        autoPlayAnimationDuration: Duration(milliseconds: 400),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: panners
                          .map(
                            (item) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: item.color,
                              ),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100,
                                        child: Text(
                                          item.text,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    item.image,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Popular Products',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildHome(context, index, products),
                        itemCount: products.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildEmailTF(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Search()));
          },
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(IconBroken.Search),
                SizedBox(
                  width: 20,
                ),
                Text('Search any product'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHome(BuildContext context, int index, List<Product> products) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                products[index].imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 30,
                  width: 70,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/Vector.png',
                        height: 50,
                        width: 20,
                      ),
                      Image.asset(
                        'assets/images/Vector.png',
                        height: 50,
                        width: 20,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products[index].title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${products[index].price}\$',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Thai Restaurant',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
