import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firnum;
  int secnum;
  String disp = "";
  String operand;
  String res;

  void click(String val) {
    if (val == "C") {
      disp = "";
      firnum = 0;
      secnum = 0;
      res = "";
    }
    else if (val == "+" || val == "-" || val == "*" || val == "/") {
      firnum = int.parse(disp);
      res = "";
      operand = val;
    }
    else if (val == "=") {
      secnum = int.parse(disp);
      res = "";
      if (operand == "+") {
        res = (firnum + secnum).toString();
      }
      if (operand == "-") {
        res = (firnum - secnum).toString();
      }
      if (operand == "*") {
        res = (firnum * secnum).toString();
      }
      if (operand == "/") {
        res = (firnum ~/ secnum).toString();
      }
    }
    else{
      res=int.parse(disp+ val).toString();
    }
    setState(() {
      disp=res;
    });
  }

Widget custombutton(String bt) {
  return Expanded(
    child: OutlineButton(
      padding: EdgeInsets.all(25.0),
      onPressed: () => click(bt),
      child: Text(
        bt,
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
    ),
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "Calculator",
      ),
    ),
    body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$disp",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              custombutton("9"),
              custombutton("8"),
              custombutton("7"),
              custombutton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("6"),
              custombutton("5"),
              custombutton("4"),
              custombutton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("3"),
              custombutton("2"),
              custombutton("1"),
              custombutton("*"),
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("C"),
              custombutton("0"),
              custombutton("="),
              custombutton("/"),
            ],
          ),
        ],
      ),
    ),
  );
}}

