import 'package:flutter/material.dart';

class CustomCircleImage extends StatelessWidget {
  String image ;
  CustomCircleImage(
      {Key? key, required this.image, this.width = 50, this.height = 50})
      : super(key: key);
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipOval(
          child: FadeInImage.assetNetwork(
            placeholder: 'lib/images/profile.png',
            image: image,
            fit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'lib/images/profile.png',
                fit: BoxFit.fill,
              );
            },
          )),
    );

  }
}
