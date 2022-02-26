import 'package:flutter/material.dart';
import 'package:sallaty/Screen/CategoriesFeedsScreen.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({Key key, this.index}) : super(key: key);
  final int index;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Sweets',
      'categoryImagesPath': 'assets/images/card.jpg',
    },
    {
      'categoryName': 'health',
      'categoryImagesPath': 'assets/images/card.jpg',
    },
    {
      'categoryName': 'Emprodary',
      'categoryImagesPath': 'assets/images/card.jpg',
    },
    {
      'categoryName': 'Salt',
      'categoryImagesPath': 'assets/images/card.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoriesFeedsScreen.routeName,
          arguments: categories[widget.index]['categoryName'],
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              categories[widget.index]['categoryImagesPath'],
            ),
            radius: 40,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            categories[widget.index]['categoryName'],
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // child: Container(
      //   color: Colors.red[50],
      //   height: 40,
      //   width: 85,
      //   child: Stack(
      //     alignment: Alignment.bottomCenter,
      //     children: [
      //       Align(
      //         alignment: Alignment.center,
      //         child: Container(
      //           height: 70,
      //           width: 70,
      //           child: Image.asset(
      //             categories[widget.index]['categoryImagesPath'],
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         width: 85,
      //         child: Text(
      //           categories[widget.index]['categoryName'],
      //           style: TextStyle(
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 15,
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //         color: Colors.black.withOpacity(0.4),
      //       ),
      //     ],
      //   ),
      // ),
    );

    // Stack(
    //   alignment: Alignment.bottomCenter,
    //   children: [
    //     InkWell(
    //       onTap: () {
    //         // Navigator.of(context).pushNamed(CategoriesFeedsScreen.routeName,
    //         //     arguments: '${categories[widget.index]['categoryName']}');
    //       },
    //       child: Container(
    //         decoration: BoxDecoration(
    //           color: Colors.red[100],
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //         child: Image.asset(
    //           categories[widget.index]['categoryImagesPath'],
    //           fit: BoxFit.cover,
    //         ),
    //         margin: EdgeInsets.symmetric(horizontal: 3),

    //         width: 33,
    //         height: 33,
    //       ),
    //     ),
    //     Container(
    //       width: 90,
    //       padding: EdgeInsets.symmetric(horizontal: 6.0),
    //       color: Colors.green,
    //       child: Text(
    //         categories[widget.index]['categoryName'],
    //         style: TextStyle(
    //           fontWeight: FontWeight.w500,
    //           fontSize: 13,
    //           color: Colors.white,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
