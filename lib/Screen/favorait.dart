import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/Screen/ProductDetails.dart';
import 'package:sallaty/data/Salla/sallaapp_cubit.dart';
import 'package:sallaty/helper/icon.dart';

class Favorait extends StatelessWidget {
  const Favorait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SallaappCubit, SallaappState>(
      listener: (context, state) {},
      builder: (context, state) {
        var fav = SallaappCubit.get(context).getFavsItems;
        return Scaffold(
          body: fav.length == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, ProductDetails.routeName,
                                  arguments: fav[index].id),
                              child: Card(
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
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Image.network(
                                                fav[index].imageUrl,
                                                fit: BoxFit.cover,
                                                height: 100,
                                                width: 200,
                                              ),
                                              Spacer(),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(IconBroken.Delete))
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              fav[index].title,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              '${fav[index].price}\$',
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
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: fav.length,
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
