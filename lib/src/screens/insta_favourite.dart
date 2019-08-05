import 'package:flutter/material.dart';

class InstaFavourite extends StatefulWidget {
  @override
  _InstaFavouriteState createState() => _InstaFavouriteState();
}

class _InstaFavouriteState extends State<InstaFavourite>
    with SingleTickerProviderStateMixin {
  //
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverPersistentHeader(
                delegate: CustomSliverDelegate(_tabController),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Center(
                child: Text('Tab 1'),
              ),
              Center(
                child: Text('Tab 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tab bar
class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  TabController _tabController;
  CustomSliverDelegate(this._tabController);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.grey[50],
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.black,
        unselectedLabelColor: Colors.black38,
        tabs: <Widget>[
          Tab(
            child: Text(
              'Following'.toUpperCase(),
            ),
          ),
          Tab(
            child: Text(
              'You'.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
