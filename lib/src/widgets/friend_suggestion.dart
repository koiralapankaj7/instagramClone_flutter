import 'package:flutter/material.dart';
import 'package:insta_clone/src/utils/ui_image_data.dart';

class FriendSuggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: BorderDirectional(
          top: BorderSide(color: Colors.grey[200]),
          bottom: BorderSide(color: Colors.grey[200]),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Suggested for You',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 240.0,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(right: 6.0),
                  width: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey[200],
                      width: 1.0,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: <Widget>[
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Top Padding
                          SizedBox(height: 16.0),
                          Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              border: Border.all(
                                color: Colors.black45,
                                width: 0.5,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(UIImageData.child),
                              ),
                            ),
                          ),
                          // Top Padding
                          SizedBox(height: 16.0),
                          Text(
                            'Suman Shrestha',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Top Padding
                          SizedBox(height: 2.0),
                          Text(
                            'Follows you',
                            style: TextStyle(color: Colors.black87),
                          ),
                          // Top Padding
                          Expanded(child: SizedBox()),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Follow Back',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Bottom Padding
                          SizedBox(height: 16.0),
                        ],
                      ),
                      // Close icon
                      Positioned(
                        right: 6.0,
                        top: 6.0,
                        child: Icon(
                          Icons.close,
                          color: Colors.black26,
                          size: 20.0,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
