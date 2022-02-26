import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/Screen/ProductDetails.dart';
import 'package:sallaty/data/Salla/sallaapp_cubit.dart';
import 'package:sallaty/model/product.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SallaappCubit, SallaappState>(
      builder: (context, state) {
        List<Product> product = SallaappCubit.get(context).products;
        return Scaffold(
          body: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 420,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: List.generate(
              product.length,
              (index) {
                return InkWell(
                  onTap: () {
                    onTap:
                    () => Navigator.pushNamed(context, ProductDetails.routeName,
                        arguments: product[index].id);
                  },
                  child: Container(
                    width: 250,
                    height: 290,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).backgroundColor),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(2),
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Image.asset(
                                      product[index].imageUrl,
                                      //   fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                // Positioned(
                                //   // bottom: 0,
                                //   // right: 5,
                                //   // top: 5,
                                //   child: Badge(
                                //     alignment: Alignment.center,
                                //     toAnimate: true,
                                //     shape: BadgeShape.square,
                                //     badgeColor: Colors.pink,
                                //     borderRadius: BorderRadius.only(
                                //         bottomRight: Radius.circular(8)),
                                //     badgeContent: Text('New',
                                //         style: TextStyle(color: Colors.white)),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              // Text(
                              //   product[index].description,
                              //   overflow: TextOverflow.ellipsis,
                              //   maxLines: 1,
                              //   style: TextStyle(
                              //       fontSize: 15,
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.w600),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  '\$ ${product[index].price}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${product[index].quantity}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () async {
                                          // showDialog(
                                          //   context: context,
                                          //   builder: (BuildContext context) =>
                                          //       FeedDialog(
                                          //     productId: productsAttributes.id,
                                          //   ),
                                          // );
                                        },
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        child: Icon(
                                          Icons.more_horiz,
                                          color: Colors.grey,
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
