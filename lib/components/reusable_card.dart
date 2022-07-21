import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {//by extraction
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Color colour; //final can be used for creation of widgets after code is compiled
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(//to make rounded boxes
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
//const if something is created after code is compiled then it should'nt be set to const
//use final