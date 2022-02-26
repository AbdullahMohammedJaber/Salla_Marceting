import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/Screen/ProductDetails.dart';
import 'package:sallaty/data/Salla/sallaapp_cubit.dart';
import 'package:sallaty/helper/const.dart';
import 'package:sallaty/helper/icon.dart';
import 'package:sallaty/model/product.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController;
  // final FocusNode _node = FocusNode();
  // void initState() {
  //   super.initState();
  //   searchController = TextEditingController();
  //   searchController.addListener(() {
  //     setState(() {});
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _node.dispose();
  //   searchController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final productsData = SallaappCubit.get(context);
    List<Product> searchList = [];
    var searchItem = productsData.searchProduct;

    return BlocConsumer<SallaappCubit, SallaappState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        height: 60.0,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'search is null';
                            }
                            return '';
                          },
                          // focusNode: _node,
                          keyboardType: TextInputType.text,
                          controller: searchController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                          ),
                          onChanged: (value) {
                            searchController.text.toLowerCase();
                            setState(() {
                              searchList = productsData.searchQuery(value);
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(top: 14.0),
                            prefixIcon: IconButton(
                              onPressed: () {
                                searchList = productsData
                                    .searchQuery(searchController.text);
                              },
                              icon: Icon(
                                IconBroken.Search,
                              ),
                              color: Colors.black,
                            ),
                            hintText: 'enter your search',
                            hintStyle: kHintTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: searchList.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              return Column(
                                children: [Text(searchItem[index].title)],
                              );
                              // return GridView.count(
                              //   crossAxisCount: 2,
                              //   childAspectRatio: 240 / 400,
                              //   crossAxisSpacing: 8,
                              //   mainAxisSpacing: 8,
                              //   children:
                              //       List.generate(searchList.length, (index) {
                              //     return Column(
                              //       children: [
                              //         Text('${searchList[index].title}')
                              //       ],
                              //     );
                              //   }),
                              // );
                            },
                            itemCount: searchItem.length,
                          ),
                  ),
                ],
              ),
            ),
            // body: CustomScrollView(
            //   slivers: <Widget>[
            //     SliverPersistentHeader(
            //       floating: true,
            //       pinned: true,
            //       delegate: SearchByHeader(
            //         stackPaddingTop: 175,
            //         titlePaddingTop: 50,
            //         title: RichText(
            //           text: TextSpan(
            //             children: [
            //               TextSpan(
            //                 text: "Search",
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: ColorsConsts.title,
            //                   fontSize: 24,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         stackChild: Container(
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.all(
            //               Radius.circular(10),
            //             ),
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.black12,
            //                 spreadRadius: 1,
            //                 blurRadius: 3,
            //               ),
            //             ],
            //           ),
            //           margin: EdgeInsets.symmetric(horizontal: 16),
            //           child: TextField(
            //             controller: _searchTextController,
            //             minLines: 1,
            //             focusNode: _node,
            //             decoration: InputDecoration(
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //                 borderSide: BorderSide(
            //                   width: 0,
            //                   style: BorderStyle.none,
            //                 ),
            //               ),
            //               prefixIcon: Icon(
            //                 Icons.search,
            //               ),
            //               hintText: 'Search',
            //               filled: true,
            //               fillColor: Theme.of(context).cardColor,
            //               suffixIcon: IconButton(
            //                 onPressed: _searchTextController.text.isEmpty
            //                     ? null
            //                     : () {
            //                         _searchTextController.clear();
            //                         _node.unfocus();
            //                       },
            //                 icon: Icon(IconBroken.Search,
            //                     color: _searchTextController.text.isNotEmpty
            //                         ? Colors.red
            //                         : Colors.grey),
            //               ),
            //             ),
            //             onChanged: (value) {
            //               _searchTextController.text.toLowerCase();
            //               setState(() {
            //                 _searchList = productsData.searchQuery(value);
            //               });
            //             },
            //           ),
            //         ),
            //       ),
            //     ),
            //     SliverToBoxAdapter(
            //       child: _searchTextController.text.isNotEmpty && _searchList.isEmpty
            //           ? Column(
            //               children: [
            //                 SizedBox(
            //                   height: 50,
            //                 ),
            //                 Icon(
            //                   Icons.search,
            //                   size: 60,
            //                 ),
            //                 SizedBox(
            //                   height: 50,
            //                 ),
            //                 Text(
            //                   'No results found',
            //                   style: TextStyle(
            //                       fontSize: 30, fontWeight: FontWeight.w700),
            //                 ),
            //               ],
            //             )
            //           : GridView.count(
            //               physics: NeverScrollableScrollPhysics(),
            //               shrinkWrap: true,
            //               crossAxisCount: 2,
            //               childAspectRatio: 240 / 420,
            //               crossAxisSpacing: 8,
            //               mainAxisSpacing: 8,
            //               children: List.generate(
            //                   _searchTextController.text.isEmpty
            //                       ? productsList.length
            //                       : _searchList.length, (index) {
            //                 return ChangeNotifierProvider.value(
            //                   value: _searchTextController.text.isEmpty
            //                       ? productsList[index]
            //                       : _searchList[index],
            //                   child: FeedProducts(),
            //                 );
            //               }),
            //             ),
            //     ),
            //   ],
            // ),
          );
        });
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
