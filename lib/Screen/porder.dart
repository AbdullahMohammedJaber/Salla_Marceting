import 'package:flutter/material.dart';
import 'package:sallaty/Authentecation/Login.dart';
import 'package:sallaty/helper/CashHelper.dart';
import 'package:sallaty/helper/borderItem.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BorderPage extends StatefulWidget {
  @override
  _BorderPageState createState() => _BorderPageState();
}

class PageRoute {
  final String image;
  final String title;
  final String descreption;

  PageRoute(this.image, this.title, this.descreption);
}

class _BorderPageState extends State<BorderPage> {
  var pageController = PageController();
  List<PageRoute> pageModel = [
    PageRoute('assets/images/porder1.png', 'Search',
        'The user searches for a store to buy his needs,He opens the App Store and searches among the applications for an application that achieves its goal'),
    PageRoute('assets/images/border2.png', 'Purchase',
        'He chooses the store, sees its details, then looks at all the sections inside it, searches for his order, then chooses it and adds it to the basket'),
    PageRoute('assets/images/border3.png', 'Evaluation',
        'He chooses the payment method and evaluates the product to get a number of points that will eventually helphim choose a free product as a gift to him'),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              CashHelper.setDataApp(value: true, key: 'onBorder');
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }),
                (route) => false,
              );
            },
            child: Text(
              'SKIP',
              style: TextStyle(
                fontSize: 17,
                color: Colors.green,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pageModel.length,
                onPageChanged: (index) {
                  if (index == 2) {
                    setState(() {
                      isLast = !isLast;
                    });
                  } else {
                    setState(() {
                      isLast == false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BorderItem(
                    pageModel,
                    index,
                    context,
                  );
                },
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: pageModel.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.green,
                    spacing: 4,
                    dotWidth: 20,
                    expansionFactor: 4,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      CashHelper.setDataApp(value: true, key: 'onBorder');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }),
                        (route) => false,
                      );
                    } else {
                      pageController.nextPage(
                        duration: const Duration(microseconds: 700),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
