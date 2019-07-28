import 'package:flutter/material.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/utils/ui_image_data.dart';
import 'package:insta_clone/src/widgets/circle_image.dart';

class Post extends StatefulWidget {
  //
  // Instance variables
  // Post index
  final int index;
  final List<String> galleryItems;

  Post(this.index, this.galleryItems);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  int pageViewActiveIndex = 0;

  int likeCount = -1;

  final String caption =
      '''Styling text in Flutter #something, Styling text in Flutter. #Another, #nepal, Styling text in Flutter. #ktm, #love, #newExperiance Styling text in Flutter. Styling text in Flutter. Styling text in Flutter.''';

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

  Widget gallery() => Container(
        constraints: BoxConstraints(
          maxHeight: 500.0, // changed to 400
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
        // child: Image.asset(
        //   UIImageData.storiesList[index],
        //   fit: BoxFit.contain,
        // ),
        child: widget.galleryItems.length > 1
            ? galleryPageView()
            : Image.asset(
                UIImageData.storiesList[widget.index],
                fit: BoxFit.contain,
              ),
      );

  Widget galleryPageView() {
    return PageView.builder(
      itemCount: widget.galleryItems.length,
      onPageChanged: (currentIndex) {
        setState(() {
          this.pageViewActiveIndex = currentIndex;
        });
        print('Current index $currentIndex : index : ${widget.index}');
      },
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          widget.galleryItems[index],
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget actions() => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Slider indicator
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...widget.galleryItems.map((s) {
                  return Container(
                    margin: EdgeInsets.only(right: 4.0),
                    height: widget.galleryItems.length <= 1 ? 0.0 : 6.0,
                    width: widget.galleryItems.length <= 1 ? 0.0 : 6.0,
                    decoration: BoxDecoration(
                      color:
                          pageViewActiveIndex == widget.galleryItems.indexOf(s)
                              ? Colors.blueAccent
                              : Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ],
            ),
          ),

          // Actions buttons/icons
          Row(
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
          ),
        ],
      );

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

  Widget comments() => Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(
          'View all 40 comments',
          style: TextStyle(color: Colors.black45),
        ),
      );

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

  Widget uploadedTime() => Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(
          '1 hours ago ',
          style: TextStyle(color: Colors.black45),
        ),
      );

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

  List<Widget> sliderIndicator(int totalItem, int currentItem) {
    return null;
  }
}
