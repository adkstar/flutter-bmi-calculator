import 'package:flutter/material.dart';

import '../constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  CustomCard({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 1,
                color: Colors.grey.withOpacity(.2),
              ),
            ],
          ),
          child: child),
    );
  }
}
