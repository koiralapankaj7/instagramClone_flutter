import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';

import 'package:insta_clone/src/utils/ui_image_data.dart';

class InstaSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: Icon(CustomIcons.search_fill),
              backgroundColor: Colors.grey[50],
              snap: true,
              floating: true,
              titleSpacing: 0.0,
              elevation: 0.0,
              title: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 24.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextStyle(),
              ),
              actions: <Widget>[
                Icon(FontAwesomeIcons.qrcode),
                SizedBox(width: 16.0),
              ],
            ),

            SliverPersistentHeader(
              delegate: CustomSliverDelegate(),
              pinned: true,
            ),

            //
            GalleryStaggeredGridView(),

            //
            // Similarly we can add more scroll types
          ],
        ),
      ),
    );
  }
}

class GalleryStaggeredGridView extends StatelessWidget {
  int videoCount = 1;
  int videoIndex = 1;
  List<int> videosIndex = [];
  List<String> images = UIImageData.gallery;

  GalleryStaggeredGridView() {
    videosIndex.add(1);
    for (var i = 0; i <= images.length; i++) {
      if ((i == videoIndex + 8 && videoCount.isOdd) ||
          (i == videoIndex + 10 && videoCount.isEven)) {
        videoCount++;
        videoIndex = i;
        videosIndex.add(i);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SliverStaggeredGrid.countBuilder(
      itemCount: images.length,
      crossAxisCount: 3, // Horizontal
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 4.0,

      itemBuilder: (BuildContext context, int index) {
        //
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
            // image: DecorationImage(
            //   image: AssetImage(images[index]),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Image.asset(
            UIImageData.man2,
            fit: BoxFit.cover,
            frameBuilder: (BuildContext context, Widget child, int frame,
                bool wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                return child;
              }
              return AnimatedOpacity(
                child: child,
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
              );
            },
          ),
        );
      },

      staggeredTileBuilder: (int index) {
        return videosIndex.contains(index)
            ? StaggeredTile.count(2, 2)
            : StaggeredTile.count(1, 1);
      },
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5,
          ),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int imndex) {
          return Container(
            margin: EdgeInsets.only(right: 8.0),
            child: Chip(
              label: Text('IGTV'),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(
                  color: Colors.black12,
                  width: 0.5,
                ),
              ),
              backgroundColor: Colors.white,
            ),
          );
        },
        padding: EdgeInsets.only(left: 8.0),
        itemCount: 20,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return null;
  }
}
