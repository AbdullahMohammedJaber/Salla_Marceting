import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/data/Salla/sallaapp_cubit.dart';
import 'package:sallaty/helper/icon.dart';
import 'package:sallaty/model/product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key key}) : super(key: key);
  static const routeName = '/ProductDetails';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    final productsData = SallaappCubit.get(context);

    final prodAttr = productsData.findById(productId);
    var products = SallaappCubit.get(context).products;
    return BlocConsumer<SallaappCubit, SallaappState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(IconBroken.Arrow___Left_2),
                color: Colors.black),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 230,
                    width: double.infinity,
                    // child: Image.network(
                    //   '${prodAttr.imageUrl}',
                    // ),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        '${prodAttr.imageUrl}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        prodAttr.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Row(
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
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'chef abbod',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '${prodAttr.price}\$',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          SallaappCubit.get(context).addAndRemoveFromFav(
                            prodAttr.id,
                            prodAttr.title,
                            prodAttr.imageUrl,
                            prodAttr.price,
                          );
                        },
                        icon: Icon(Icons.favorite_border),
                        color: Colors.red,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(IconBroken.Buy),
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'The origins of pizza go back to Italy, as it is one of the most delicious and distinctive Italian foods. It is known that fast pizza has many types, and each type is characterized by a different flavor and taste. Pizza  is the favorite meal  for everyone, and women are looking for a way to make pizza that children love with easy ingredients.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Share your experience to help others   ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://img.freepik.com/free-photo/beautiful-shot-live-concert-performance-with-yellow-light-show-big-crowd-cheering_181624-55905.jpg?t=st=1645825677~exp=1645826277~hmac=01056248061e069b391109c7ac112c662bfa5fa4d8db8ceeb4f50284ca8d7a36&w=740'),
                            radius: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset('assets/images/v.jpg'),
                          Image.asset('assets/images/v.jpg'),
                          Image.asset('assets/images/v.jpg'),
                          Image.asset('assets/images/v.jpg'),
                          Image.asset('assets/images/v.jpg'),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ahmed Mohamed',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://img.freepik.com/free-photo/beautiful-shot-live-concert-performance-with-yellow-light-show-big-crowd-cheering_181624-55905.jpg?t=st=1645825677~exp=1645826277~hmac=01056248061e069b391109c7ac112c662bfa5fa4d8db8ceeb4f50284ca8d7a36&w=740'),
                            radius: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset('assets/images/Vector.png'),
                          Image.asset('assets/images/Vector.png'),
                          Image.asset('assets/images/v.jpg'),
                          Image.asset('assets/images/v.jpg'),
                          Image.asset('assets/images/v.jpg'),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'a month ago',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Text(
                        'The food tastes delicious and clean',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ahmed Mohamed',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://img.freepik.com/free-photo/beautiful-shot-live-concert-performance-with-yellow-light-show-big-crowd-cheering_181624-55905.jpg?t=st=1645825677~exp=1645826277~hmac=01056248061e069b391109c7ac112c662bfa5fa4d8db8ceeb4f50284ca8d7a36&w=740'),
                            radius: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset('assets/images/Vector.png'),
                          Image.asset('assets/images/Vector.png'),
                          Image.asset('assets/images/v.jpg'),
                          Image.asset('assets/images/v.jpg'),
                          Image.asset('assets/images/v.jpg'),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'a month ago',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Text(
                        'The food tastes delicious and clean',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Similar Offers',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildHome(index, context, products),
                          itemCount: products.length,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget buildHome(int index, BuildContext context, List<Product> products) {
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
