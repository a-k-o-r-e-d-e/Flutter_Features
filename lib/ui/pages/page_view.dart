import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  int currentPage = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PageView Demo',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              _pageController.animateToPage(--currentPage,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.bounceInOut);
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              _pageController.animateToPage(++currentPage,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.bounceInOut);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              pageSnapping: true, // if not specified, it defaults to true
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                Container(
                  color: Colors.indigo,
                ),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.brown,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
