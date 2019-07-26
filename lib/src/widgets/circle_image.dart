import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  //
  final String image;
  final double imageSize;
  final double whiteMargin;
  final double imageMargin;
  CircleImage(
    this.image, {
    this.imageSize = 70.0,
    this.whiteMargin = 2.5,
    this.imageMargin = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    // Gradient background container
    return Container(
      height: this.imageSize,
      width: this.imageSize,
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
        margin: EdgeInsets.all(whiteMargin),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),

        // Image container
        child: FittedBox(
          child: Container(
            margin: EdgeInsets.all(imageMargin),
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(50.0),
              shape: BoxShape.circle,
              image: DecorationImage(
                // Instgram is using BoxFit.contain but we are using cover for better look
                fit: BoxFit.cover,
                image: AssetImage(image),
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
