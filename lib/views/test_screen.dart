import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/components/bounding_box.dart';
import 'package:hear_me_out/services/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;


String ssd='SSD MobileNet';

class TestScreen extends StatefulWidget {

   final List<CameraDescription>cameras;


   TestScreen({this.cameras});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  List<dynamic> _recognitions;
  int _imgHeight=0;
  int _imgWidth=0;
  String _model='';



  @override
  Widget build(BuildContext context) {
    print(_recognitions.toString());
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.camera_alt_outlined) ,
        onPressed:(){
          onSelectModel(ssd);
        } ,

      ),
      body: _model==''
          ?Container()
          :Stack(
        children: [

          Camera(widget.cameras, _model, setRecognitions),

          // BoundingBox(
          //   _recognitions==null? [] :_recognitions,
          //   math.max(_imgHeight, _imgWidth),
          //   math.min(_imgHeight, _imgWidth),
          //   screenSize.width,
          //   screenSize.height,
          //   _model
          // )
          
        ],
      ),
    );
  }



  onSelectModel(model)
  {
    setState(() {
      _model=model;
    });
    loadModel();
  }

  loadModel()
  async{

    String result;
    if(_model==ssd)
      {
        result=await Tflite.loadModel(
          labels: 'assets/models/ssd_mobilenet.txt',
            model: 'assets/models/ssd_mobilenet.tflite');
      }

    print(result);

  }

  setRecognitions(recognitions,imgHeight,imgWidth)
  {
    setState(() {
      _recognitions=recognitions;
      _imgHeight=imgHeight;
      _imgWidth=imgWidth;
    });
  }

}
