// import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:ar_app/ardemo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AP Demo',
      home: ChooseAR(),
    );
  }
}

class ChooseAR extends StatefulWidget {
  @override
  _ChooseARState createState() => _ChooseARState();
}

class _ChooseARState extends State<ChooseAR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Demo App Flutter'),
        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width-50.0,
              child: FlatButton(
                color: Colors.cyan,
                textColor: Colors.white,
                child: Text('AR Sphere'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ARDemo(choice: 's',),));
                },
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width-50.0,
              child: FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('AR Box'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ARDemo(choice: 'b',),));
                },
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width-50.0,
              child: FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('AR Cylinder'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ARDemo(choice: 'c',),));
                },
              ),
            ),
          )
      ],),
    );
  }
}