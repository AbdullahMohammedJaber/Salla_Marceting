import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/data/Salla/sallaapp_cubit.dart';
import 'package:sallaty/helper/icon.dart';
import 'package:sallaty/model/product.dart';

class Search extends StatelessWidget {
  var searchTextController = TextEditingController();
  List<Product> searchedForCharacters = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SallaappCubit, SallaappState>(
      builder: (context, state) {
        var ssssss = SallaappCubit.get(context).ss;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: searchTextController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          SallaappCubit.get(context)
                              .SearchOfProduct(searchTextController.text);
                          print(searchedForCharacters.length);
                          print(SallaappCubit.get(context).products.length);
                        },
                        icon: Icon(IconBroken.Search)),
                    hintText: 'Find a character...',
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 300,
                            color: Colors.blue,
                            child: Center(child: Text(ssssss[index].title)),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: ssssss.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget _buildSearchField(context) {
    return Column(
      children: [
        Container(
          child: TextFormField(
            controller: searchTextController,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: 'Find a character...',
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            style: TextStyle(color: Colors.grey, fontSize: 18),
            onChanged: (searchedCharacter) {
              addSearchedFOrItemsToSearchedList(
                searchedCharacter: searchedCharacter,
                context: context,
              );
            },
          ),
        ),
      ],
    );
  }

  void addSearchedFOrItemsToSearchedList(
      {String searchedCharacter, BuildContext context}) {
    searchedForCharacters = SallaappCubit.get(context)
        .products
        .where((character) =>
            character.title.toLowerCase().contains(searchedCharacter))
        .toList();
  }
}
