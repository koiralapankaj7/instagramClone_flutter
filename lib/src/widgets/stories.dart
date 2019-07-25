import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_clone/src/utils/ui_image_data.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      child: ListView.builder(
        itemCount: UIImageData.storiesList.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 4.0),
        itemBuilder: (BuildContext context, int index) {
          return story(index);
        },
      ),
    );
  }

  Widget story(int index) {
    return Column(
      children: <Widget>[
        index == 0 ? createStory() : storyContent(index),
        Expanded(
          child: Text(index == 0 ? 'Your Story' : 'Name'),
        ),
      ],
    );
  }

  Widget createStory() {
    return Stack(
      children: <Widget>[
        Container(
          height: 90.0,
          width: 90.0,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(UIImageData.storiesList[0]),
            ),
          ),
        ),
      ],
    );
  }

  Widget storyContent(int index) {
    // Gradient background container
    return Container(
      height: 90.0,
      width: 90.0,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: SweepGradient(
          colors: [
            Colors.cyan,
            Colors.red,
            Colors.amber,
            Colors.grey,
            Colors.green,
          ],
        ),
      ),

      // White background container between image and gradient
      child: Container(
        margin: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),

        // Image container
        child: FittedBox(
          child: Container(
            margin: EdgeInsets.all(4.0),
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(50.0),
              shape: BoxShape.circle,
              image: DecorationImage(
                // Instgram is using BoxFit.contain but we are using cover for better look
                fit: BoxFit.cover,
                image: AssetImage(
                  UIImageData.storiesList[index],
                ),
              ),
            ),
          ),
        ),
        // Image container
        //
      ),
    );
  }
}
