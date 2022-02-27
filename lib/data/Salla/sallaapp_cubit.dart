import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/Admin/Screens/chat.dart';
import 'package:sallaty/Admin/Screens/feeds.dart';
import 'package:sallaty/Admin/Screens/homeAdmin.dart';
import 'package:sallaty/Admin/Screens/myFeed.dart';
import 'package:sallaty/Admin/Screens/setAdmin.dart';
import 'package:sallaty/Screen/CategoriesFeedsScreen.dart';
import 'package:sallaty/Screen/Map.dart';
import 'package:sallaty/Screen/category.dart';
import 'package:sallaty/Screen/gift.dart';
import 'package:sallaty/Screen/home.dart';
import 'package:sallaty/Screen/product_feeds_screen.dart';
import 'package:sallaty/Screen/settings.dart';
import 'package:sallaty/helper/const.dart';
import 'package:sallaty/model/favorate.dart';
import 'package:sallaty/model/product.dart';

part 'sallaapp_state.dart';

class SallaappCubit extends Cubit<SallaappState> {
  SallaappCubit() : super(SallaappInitial());
  static SallaappCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> Screen = [
    Home(),
    ProductFeedsScreen(),
    MapScreen(),
    GiftScreen(),
    Setting(),
  ];
  List<Widget> Admin = [
    homeAdmin(),
    feedAdmin(),
    muFeeds(),
    chat(),
    setAdmin(),
  ];
  void ChangeNav(int index) {
    currentIndex = index;
    emit(SallaappChangeBottomNav());
  }

  // List<Product> products = [
  //   Product(
  //     id: '1',
  //     isFavorite: false,
  //     imageUrl: 'assest/images/card.jpg',
  //     isPopular: true,
  //     price: 15,
  //     quantity: 22,
  //     title: 'SalateFood',
  //     productCategoryName: 'health',
  //   ),
  //   Product(
  //     id: '1',
  //     isFavorite: false,
  //     imageUrl: 'assest/images/card.jpg',
  //     isPopular: true,
  //     price: 15,
  //     quantity: 22,
  //     title: 'SalateFood',
  //     productCategoryName: 'health',
  //   ),
  // ];

  // List<Product> get productList {
  //   return [...products];
  // }

  // List<Product> productCategory(String categoryName) {
  //   List categoryList = productList
  //       .where((element) => element.productCategoryName
  //           .toLowerCase()
  //           .contains(categoryName.toLowerCase()))
  //       .toList();
  //   return categoryList;
  // }

  // // ignore: missing_return
  // Future addProduct() {
  //   products.add(
  //     Product(
  //       id: '2',
  //       imageUrl: 'assets/images/logo.png',
  //       isFavorite: true,
  //       isPopular: true,
  //       quantity: 22,
  //       price: 22,
  //       title: 'helath',
  //       productCategoryName: 'health',
  //     ),
  //   );

  //   emit(SallaappaddProductSucces());
  // }

  // Product findById(String productId) {
  //   return products.firstWhere((element) => element.id == productId);
  // }

  // List<Product> searchQuery(String searchText) {
  //   List _searchList = products
  //       .where((element) =>
  //           element.title.toLowerCase().contains(searchText.toLowerCase()))
  //       .toList();
  //   return _searchList;
  // }

  // List<Product> get popularProducts {
  //   return products.where((element) => element.isPopular).toList();
  // }
  List<Product> _products = [];
  List<Product> _Myproducts = [];

  List<Product> get products {
    return [..._products];
  }

  List<Product> get Myproducts {
    return [..._Myproducts];
  }

  Future<void> fetchProducts() async {
    emit(SalaaGetDataLoaded());
    return await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot productsSnapshot) {
      _products = [];
      productsSnapshot.docs.forEach((element) {
        // print('element.get(productBrand), ${element.get('productBrand')}');

        _products.insert(
          0,
          Product(
              id: element.get('productId'),
              title: element.get('productTitle'),
              descreption: element.get('productDescription'),
              price: double.parse(
                element.get('price'),
              ),
              imageUrl: element.get('productImage'),
              productCategoryName: element.get('productCategory'),
              quantity: int.parse(
                element.get('price'),
              ),
              isPopular: true),
        );
      });
      emit(SalaaGetDataSucces());
    }).catchError((onError) {
      emit(SalaaGetDataError());
    });
  }

  //***************************** */

  //************************************ */
  List<Product> get popularProducts {
    return _products.where((element) => element.isPopular).toList();
  }

  Product findById(String productId) {
    return _products.firstWhere((element) => element.id == productId);
  }

  List<Product> searchProduct = [];
  List<Product> findByCategory(String categoryName) {
    List _categoryList = _products
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  // List<Product> searchList = [];
  // void SearchProduct(String searchText) {
  //   searchList = [];
  //   searchList = _products
  //       .where((element) =>
  //           element.title.toLowerCase().contains(searchText.toLowerCase()))
  //       .toList();
  // }
  List<Product> searchQuery(String searchText) {
    searchProduct = _products
        .where((element) =>
            element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return searchProduct;
  }

  //***************************** */
  List<Product> _favsItems = [];

  List<Product> get getFavsItems {
    return [..._favsItems];
  }

  void addAndRemoveFromFav(
      String productId, String name, String image, double price) {
    Product p =
        Product(id: productId, title: name, imageUrl: image, price: price);

    _favsItems.add(p);
    print(_favsItems.length);
  }

  void removeItem(String productId) {
    _favsItems.remove(productId);
  }

  void clearFavs() {
    _favsItems.clear();
    ChangeNotifier();
  }

  List<Product> ss = [];
  void SearchOfProduct(text) {
    ss = products
        .where((character) => character.title.toLowerCase().contains(text))
        .toList();
  }

  List<Product> _catItems = [];

  List<Product> get getCatItems {
    return [..._catItems];
  }

  void addAndRemoveFromCat(
      String productId, String name, String image, double price) {
    Product p =
        Product(id: productId, title: name, imageUrl: image, price: price);

    _catItems.add(p);
    print(_catItems.length);
  }

  void removeCatItem(String productId) {
    _catItems.remove(productId);
  }
}
