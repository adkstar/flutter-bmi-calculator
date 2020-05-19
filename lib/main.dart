import 'package:bmi_calculator/components/control_buttons.dart';
import 'package:bmi_calculator/components/custom_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'BMI Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _height = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(child: Text(widget.title.toUpperCase())),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              getCard('MALE', FontAwesomeIcons.mars),
              getCard('FEMALE', FontAwesomeIcons.venus),
            ],
          ),
          CustomCard(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: subTitleTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        _height.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: subTitleTextStyle,
                      ),
                    ],
                  ),
                  Container(
                    child: Slider(
                      activeColor: accentColor,
                      value: _height.toDouble(),
                      min: 0.0,
                      max: 330.0,
                      divisions: 330,
                      label: '$_height cm',
                      onChanged: (double newValue) {
                        setState(() {
                          _height = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()} dollars';
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              ControlButtons('Weight'),
              getControlButtons('Age'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: accentColor,
            height: 60,
            child: Center(
              child: Text(
                'CALCULATE',
                style: numberTextStyle.copyWith(fontSize: 22),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void buttonPressed() {
  print('Hello world');
}

Widget getControlButtons(String title) {
  return CustomCard(
    child: Column(
      children: <Widget>[
        Text(
          title,
          style: subTitleTextStyle,
        ),
        Text(
          "80",
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
                onPressed: () {},
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
                onPressed: () {},
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

void incrementWeight() {}

Widget getCard(String title, IconData icon) {
  return CustomCard(
    child: GestureDetector(
      onTap: () {
        print("h11");
      },
      child: Column(
        children: <Widget>[
          FaIcon(
            icon,
            size: 80,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: subTitleTextStyle,
          )
        ],
      ),
    ),
  );
}
