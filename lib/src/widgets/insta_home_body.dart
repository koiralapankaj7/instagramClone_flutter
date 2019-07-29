import 'package:flutter/material.dart';
import 'package:insta_clone/src/utils/ui_image_data.dart';
import 'package:insta_clone/src/widgets/friend_suggestion.dart';
import 'package:insta_clone/src/widgets/post.dart';
import 'package:insta_clone/src/widgets/story.dart';

class InstaHomeBody extends StatefulWidget {
  @override
  _InstaHomeBodyState createState() => _InstaHomeBodyState();
}

class _InstaHomeBodyState extends State<InstaHomeBody> {
  var listContent = UIImageData.postList;
  // Build function
  @override
  Widget build(BuildContext context) {
    listContent.insert(0, []);
    listContent.insert(2, []);

    return RefreshIndicator(
      child: ListView.builder(
        itemCount: listContent.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Story(); // story.dart from widgets package
          } else if (index == 2) {
            return FriendSuggestion();
          } else {
            return Post(
                UIImageData.postList[index]); // post.dart from widgets package
          }
        },
      ),
      onRefresh: () async {},
    );
  }
}
