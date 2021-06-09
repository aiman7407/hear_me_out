import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/views/test_screen.dart';

class AppRoot extends StatelessWidget {
 final List<CameraDescription> cameras;

 AppRoot({this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestScreen(cameras: cameras,),
    );
  }
}
