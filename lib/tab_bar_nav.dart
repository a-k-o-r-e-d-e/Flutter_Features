import 'package:flutter/material.dart';

import 'Utils/drawer_util.dart';

// Tab navigation layout in app bar with
class TabBarNav extends StatefulWidget {
  @override
  _TabBarNavState createState() => _TabBarNavState();
}

class _TabBarNavState extends State<TabBarNav>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Tab Bar"),
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.camera_alt),
                text: "Tab 1",
              ),
              Tab(
                text: "Tab 2",
              ),
              Tab(
                text: "Tab 3",
              ),
              Tab(
                text: "Tab 4",
              ),
            ]),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 3.5)),
          Icon(Icons.more_vert)
        ],
      ),
      drawer: DrawerUtil(),
      body: TabBarView(controller: _tabController, children: <Widget>[
        Center(
          child: Text(
            "Page 1",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Center(
          child: Text(
            "Page 2",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Center(
          child: Text(
            "Page 3",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Center(
          child: Text(
            "Page 4",
            style: TextStyle(fontSize: 18.0),
          ),
        )
      ]),
    );
  }
}
