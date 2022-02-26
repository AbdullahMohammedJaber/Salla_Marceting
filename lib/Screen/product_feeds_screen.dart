import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/Screen/ProductDetails.dart';
import 'package:sallaty/data/Salla/sallaapp_cubit.dart';
import 'package:sallaty/model/product.dart';

class ProductFeedsScreen extends StatelessWidget {
  static const routeName = '/CategoriesFeedsScreen';

  ProductFeedsScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SallaappCubit, SallaappState>(
      builder: (context, state) {
        var product = SallaappCubit.get(context).products;
        return Scaffold(
          body: product.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: state is SalaaGetDataLoaded
                      ? Center(
                          child: LinearProgressIndicator(),
                        )
                      : GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 240 / 400,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          children: List.generate(product.length, (index) {
                            return buildHome(context, index, product);
                          }),
                        ),
                ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget buildHome(BuildContext context, int index, List<Product> products) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
          arguments: products[index].id),
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
      ),
    );
  }
}
