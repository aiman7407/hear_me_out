import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/components/bounding_box.dart';
import 'package:hear_me_out/services/camera.dart';
import 'package:hear_me_out/src/const.dart';
import 'package:hear_me_out/src/const_function.dart';
import 'package:hear_me_out/views/conversation_screen.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import '../main.dart';

String ssd = 'SSD MobileNet';

class TestScreen extends StatefulWidget {
  final String chatRoomId;
  final String frindUsername;

  TestScreen({this.chatRoomId, this.frindUsername});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<dynamic> _recognitions;
  int _imgHeight = 0;
  int _imgWidth = 0;
  String _model = '';
  String currentText = '';
  String deafAndMuteMessageText = '';
  getCurrentText() {
    if (_recognitions == null) {
      print('صبح');
    } else {
      setState(() {
        currentText = _recognitions[0]['label'].toString();
      });
      print(_recognitions[0]['label'].toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    getCurrentText();
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt_outlined),
          onPressed: () {
            onSelectModel(ssd);
          },
        ),
        body: _model == ''
            ? Container()
            : Column(
                children: [
                  Container(
                      height: 300,
                      child: Camera(cameras, _model, setRecognitions)),

                  SizedBox(
                    height: 300,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Your Text is $currentText ',
                        style: TextStyle(fontSize: 40.0, color: kMainColor),
                      ),
                      TextButton(
                          onPressed: () {
                            deafAndMuteMessageText =
                                deafAndMuteMessageText + currentText;
                          },
                          child: Text(
                            'Press Here To Add',
                            style: TextStyle(
                              fontSize: 20,
                              color: kSecondColor,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                      Text(
                        'Your Text is $deafAndMuteMessageText',
                        maxLines: 2,
                        style: TextStyle(color: kMainColor, fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                            navigateAndFinish(
                                context: context,
                                screen: ConversationScreen(
                                  chatRoomId: widget.chatRoomId,
                                  frindUsername: widget.frindUsername,
                                  messageTranslated: deafAndMuteMessageText,
                                ));
                          },
                          child: Text(
                            'Send Message'.toUpperCase(),
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 30),
                          ))
                    ],
                  ),
                  // BoundingBox(
                  //     _recognitions == null ? [] : _recognitions,
                  //     math.max(_imgHeight, _imgWidth),
                  //     math.min(_imgHeight, _imgWidth),
                  //     screenSize.width,
                  //     screenSize.height,
                  //     _model),
                ],
              ),
      ),
    );
  }

  onSelectModel(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  loadModel() async {
    String result;
    if (_model == ssd) {
      result = await Tflite.loadModel(
          labels: 'assets/models/ssd_mobilenet.txt',
          model: 'assets/models/ssd_mobilenet.tflite');
    }
    print(result);
  }

  setRecognitions(recognitions, imgHeight, imgWidth) {
    setState(() {
      _recognitions = recognitions;
      _imgHeight = imgHeight;
      _imgWidth = imgWidth;
    });
  }
}
