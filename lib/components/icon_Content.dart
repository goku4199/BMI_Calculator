import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {// by extraction

  IconContent({@required this.font, @required this.text});

  final IconData font;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          font, //male symbol
          size: 80.0,
        ),

        SizedBox(
          height: 15.0,
        ),

        Text(
          text,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
//const if something is created after code is compiled then it should'nt be set to const
//use final