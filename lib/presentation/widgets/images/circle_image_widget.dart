import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double size;
  final String imageUrl;

  const CircleImage({
    Key key,
    @required this.size,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          )),
      width: size,
      height: size,
    );
  }
}
