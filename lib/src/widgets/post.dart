import 'package:flutter/material.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/utils/ui_image_data.dart';
import 'package:insta_clone/src/widgets/circle_image.dart';

class Post extends StatelessWidget {
  //
  // Instance variables
  // Post index
  final int index;

  // To display use icons who liked the post along with like counts (below action icons)
  int likeCount = -1;

  // Post caption
  final String caption =
      '''Styling text in Flutter #something, Styling text in Flutter. #Another, #nepal, Styling text in Flutter. #ktm, #love, #newExperiance Styling text in Flutter. Styling text in Flutter. Styling text in Flutter.''';

  Post(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // User profile, name and more option
        userInfoRow(),
        // Single or collection of images/videos
        gallery(),
        // For padding
        SizedBox(height: 8.0),
        // Different icon buttons and image slider indicator
        actions(),
        // For padding
        SizedBox(height: 10.0),
        // People liked information with icon
        likeCounts(),
        // For padding
        SizedBox(height: 8.0),
        //Caption
        galleryCaption(),
        // For padding
        SizedBox(height: 4.0),
        // View all comments
        comments(),
        // For padding
        SizedBox(height: 4.0),
        // Add comment section
        addComment(),
        // Uploaded time
        uploadedTime(),
        // For padding
        SizedBox(height: 24.0),
      ],
    );
  }

  // User profile, name and more option
  Widget userInfoRow() => Row(
        children: <Widget>[
          CircleImage(
            UIImageData.child,
            imageSize: 36.0,
            whiteMargin: 2.0,
            imageMargin: 6.0,
          ),
          Text('_mark_official_'),
          Expanded(child: SizedBox()),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      );

  // Single or collection of images/videos
  Widget gallery() => Container(
        constraints: BoxConstraints(
          maxHeight: 400.0, // changed to 400
          minHeight: 200.0, // changed to 200
          maxWidth: double.infinity,
          minWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          //color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey[200],
              width: 1.0,
            ),
          ),
        ),
        child: Image.asset(UIImageData.storiesList[index]),
      );

  // Different icon buttons and image slider indicator
  Widget actions() => Row(
        children: <Widget>[
          SizedBox(width: 12.0), // For padding
          Icon(CustomIcons.like_lineal),
          SizedBox(width: 16.0), // For padding
          Icon(CustomIcons.comment),
          SizedBox(width: 16.0), // For padding
          Transform.rotate(
            angle: 0.4,
            child: Icon(CustomIcons.paper_plane),
          ),
          Expanded(child: SizedBox()),
          Icon(CustomIcons.bookmark_lineal),
          SizedBox(width: 10.0), // For padding
        ],
      );

  // People liked information with icon
  Widget likeCounts() => Row(
        children: <Widget>[
          SizedBox(width: 12.0), // For padding
          Stack(
            fit: StackFit.loose,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              // Spread elements
              // I am using this method just for illustration purpose.
              // This is not the best way to implement
              // Better way would be creating list of widget and assign that list to childeren property
              ...UIImageData.storiesList.take(3).map((image) {
                //likeCount++;
                if (likeCount == 2) {
                  likeCount = 0;
                } else {
                  likeCount++;
                }

                return Container(
                  height: 22.0,
                  width: 22.0,
                  margin: EdgeInsets.only(right: likeCount * 14.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(width: 8.0), // For padding
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Liked by ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextSpan(
                    text: '_mark_official_ ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'and ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextSpan(
                    text: '67,324 others ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  //Caption
  Widget galleryCaption() => Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 16),
        child: RichText(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: '_mark_official_ ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ..._processCaption(
                caption,
                '#',
                TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      );

  // View all comments
  Widget comments() => Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(
          'View all 40 comments',
          style: TextStyle(color: Colors.black45),
        ),
      );

  // Add comment section
  Widget addComment() => Row(
        children: <Widget>[
          CircleImage(
            UIImageData.child,
            imageSize: 30.0,
            whiteMargin: 2.0,
            imageMargin: 6.0,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                border: InputBorder.none,
              ),
            ),
          ),
          Text('🤗', style: TextStyle(fontSize: 14.0)),
          SizedBox(width: 10.0),
          Text('😘', style: TextStyle(fontSize: 14.0)),
          SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Icon(
              Icons.add_circle_outline,
              size: 15.0,
              color: Colors.black26,
            ),
          ),
          SizedBox(width: 12.0),
        ],
      );

  // Uploaded time
  Widget uploadedTime() => Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(
          '1 hours ago ',
          style: TextStyle(color: Colors.black45),
        ),
      );

  // Function which will colour all hash tag items from the caption
  List<TextSpan> _processCaption(
      String caption, String matcher, TextStyle style) {
    List<TextSpan> spans = [];

    caption.split(' ').forEach((text) {
      if (text.toString().contains(matcher)) {
        spans.add(TextSpan(text: text + ' ', style: style));
      } else {
        spans.add(TextSpan(text: text + ' '));
      }
    });

    return spans;
  }
}
