import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/widgets/user_image_with_plus_icon.dart';

import 'insta_search.dart';

class InstaProfile extends StatefulWidget {
  @override
  _InstaProfileState createState() => _InstaProfileState();
}

class _InstaProfileState extends State<InstaProfile>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            // sliverAppBar(),
            SliverToBoxAdapter(child: userInfo()),
            SliverPersistentHeader(
              delegate: CustomSliverDelegate(_tabController),
              pinned: true,
              floating: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            GridView.builder(
              itemCount: 50,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.blue,
                );
              },
            ),
            Center(
              child: Text('Tab 2'),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0.0,
      title: Row(
        children: <Widget>[
          Text(
            'koirala_pankaj_000',
            style: TextStyle(),
          ),
          SizedBox(width: 4.0),
          Icon(
            Icons.keyboard_arrow_down,
            size: 18.0,
          ),
        ],
      ),
      actions: <Widget>[
        Icon(Icons.menu),
        SizedBox(width: 16.0),
      ],
    );
  }

  Widget sliverAppBar() {
    return SliverAppBar(
      pinned: true,
      elevation: 0.0,
      title: Row(
        children: <Widget>[
          Text(
            'koirala_pankaj_000',
            style: TextStyle(),
          ),
          SizedBox(width: 4.0),
          Icon(
            Icons.keyboard_arrow_down,
            size: 18.0,
          ),
        ],
      ),
      actions: <Widget>[
        Icon(Icons.menu),
        SizedBox(width: 16.0),
      ],
      // bottom: TabBar(
      //   tabs: <Widget>[
      //     Tab(
      //       child: Icon(Icons.grid_on),
      //     ),
      //     Tab(
      //       child: Icon(Icons.contacts),
      //     ),
      //   ],
      //   controller: _tabController,
      // ),
    );
  }

  Widget userInfo() {
    Widget stats(String statName, int statCount) {
      return Column(
        children: <Widget>[
          Text(statCount.toString()),
          Text(statName),
        ],
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              UserImageWithPlusIcon(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    stats('Posts', 20),
                    stats('Followers', 111),
                    stats('Following', 203),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'Pankaj Koirala',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            '''Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun to program.''',
            style: TextStyle(),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black26,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget nestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          // App Bar
          // SliverAppBar(
          //   backgroundColor: Colors.blue,
          //   primary: true,
          //   pinned: true,
          //   bottom: TabBar(
          //     tabs: <Widget>[
          //       Icon(Icons.grid_on),
          //       Icon(Icons.contacts),
          //     ],
          //   ),
          // ),

          SliverToBoxAdapter(
            child: userInfo(),
          ),

          // SliverPersistentHeader(
          //   delegate: CustomSliverDelegate(),
          //   pinned: true,
          // ),
          //
        ];
      },
      body: TabBarView(
        children: <Widget>[
          Center(
            child: Text('Tab 1'),
          ),
          Center(
            child: Text('Tab 1'),
          )
        ],
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  TabController _tabController;
  CustomSliverDelegate(this._tabController);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 48.0,
      color: Colors.grey[50],
      child: TabBar(
        controller: _tabController,
        tabs: <Widget>[
          Icon(Icons.grid_on),
          Icon(Icons.contacts),
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

//  return SafeArea(
//       child: Scaffold(
//         appBar: appBar(),
//         backgroundColor: Colors.white,
//         body: DefaultTabController(
//           length: 2,
//           child: CustomScrollView(
//             slivers: <Widget>[
//               //sliverAppBar(),
//               SliverToBoxAdapter(
//                 child: userInfo(),
//               ),
//               SliverPersistentHeader(
//                 delegate: CustomSliverDelegate(),
//                 pinned: true,
//                 floating: true,
//               ),

//               // SliverStaggeredGrid.countBuilder(
//               //   itemCount: 40,
//               //   crossAxisCount: 2,
//               //   mainAxisSpacing: 4.0,
//               //   crossAxisSpacing: 4.0,
//               //   staggeredTileBuilder: (int index) {
//               //     return StaggeredTile.count(1, 1);
//               //   },
//               //   itemBuilder: (BuildContext context, int index) {
//               //     return Container(
//               //       color: Colors.green,
//               //     );
//               //   },
//               // ),
//               //

//               SliverFillRemaining(
//                 child: TabBarView(
//                   children: <Widget>[
//                     Center(
//                       child: GridView.builder(
//                         itemCount: 50,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 4.0,
//                           crossAxisSpacing: 4.0,
//                         ),
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                             color: Colors.blue,
//                           );
//                         },
//                       ),
//                     ),
//                     Center(
//                       child: Text('Tab 2'),
//                     )
//                   ],
//                 ),
//               ),

//               //
//               // Similarly we can add more scroll types
//             ],
//           ),
//         ),
//       ),
//     );
