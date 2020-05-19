import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_card.dart';

class ControlButtons extends StatefulWidget {
  final String _title;
  // final ValueChanged<bool> onChanged;

  ControlButtons(this._title);

  @override
  _ControlButtonsState createState() => _ControlButtonsState();
}

class _ControlButtonsState extends State<ControlButtons> {
  double _weight = 50;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: <Widget>[
          Text(
            widget._title,
            style: subTitleTextStyle,
          ),
          Text(
            '$_weight',
            style: numberTextStyle,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 45,
                height: 45,
                child: RaisedButton(
                  onPressed: () => {},
                  child: Text(
                    '-',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  elevation: 5,
                  shape: CircleBorder(),
                  color: Color(0xff5d606e),
                ),
              ),
              Container(
                width: 45,
                height: 45,
                child: RaisedButton(
                  onPressed: _incrementWeight,
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  elevation: 5,
                  shape: CircleBorder(),
                  color: Color(0xff5d606e),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _incrementWeight() {
    setState(() {
      _weight++;
    });
  }
}
