// import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AP Demo',
      home: ARDemo(),
    );
  }
}

class ARDemo extends StatefulWidget {
  @override
  _ARDemoState createState() => _ARDemoState();
}

class _ARDemoState extends State<ARDemo> {
  ArCoreController arc;

  addsphere(ArCoreController arCoreController){
    final material=ArCoreMaterial(color: Color.fromRGBO(155,255,255,1));
    final sphere = ArCoreSphere(materials: [material],radius: 0.2);
    final node=ArCoreNode(shape: sphere,position: Vector3(0,0,-0.5));
    arCoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    arc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARDemo'),
      ),
      body: ArCoreView(
        onArCoreViewCreated: (c){
          arc=c;
          addsphere(arc);
        },
      ),
    );
  }
}