import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

class ARDemo extends StatefulWidget {
  final choice;

  const ARDemo({Key key, this.choice}) : super(key: key);

  @override
  _ARDemoState createState() => _ARDemoState();
}

class _ARDemoState extends State<ARDemo> {
  ArCoreController arc;

  addsphere(ArCoreController arCoreController){
    final material = ArCoreMaterial(color: Color.fromRGBO(155,255,255,1));
    final sphere = ArCoreSphere(materials: [material], radius: 0.2);
    final node = ArCoreNode(shape: sphere, position: Vector3(0,0,-0.5));
    arCoreController.addArCoreNode(node);
  }

  addBox(ArCoreController arCoreController){
    final material = ArCoreMaterial(color: Color.fromRGBO(255, 0, 0, 1));
    final cube = ArCoreCube(materials: [material],size: Vector3(1,1,1));
    final node = ArCoreNode(shape: cube,position: Vector3(-0.5,-0.5,-4));
    arCoreController.addArCoreNode(node);
  }

  addCylinder(ArCoreController arCoreController){
    final material = ArCoreMaterial(color: Color.fromRGBO(0, 255, 0, 1),reflectance: 1);
    final cylinder = ArCoreCylinder(materials: [material],radius: 0.8,height: 0.7);
    final node = ArCoreNode(shape: cylinder,position: Vector3(0,-0.5,-3.0));
    arCoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // arc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
      },
          child: Scaffold(
        appBar: AppBar(
          title: Text('ARDemo'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: (c){
            switch (widget.choice) {
              case 's':
                addsphere(c);
                break;
              case 'b':
                addBox(c);
                break;
              case 'c':
                addCylinder(c);
                break;
              default:
            }
          },
        ),
      ),
    );
  }
}