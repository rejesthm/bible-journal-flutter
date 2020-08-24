import 'package:flutter/material.dart';

class ShadowWidget extends StatelessWidget {
  final Widget child;
  final bool isSmall;

  const ShadowWidget({Key key, this.child, this.isSmall = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06),
            spreadRadius: 0.01,
            blurRadius: 15,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
