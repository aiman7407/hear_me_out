import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/views/chat_list_screen.dart';
import 'package:hear_me_out/views/login_screen.dart';
import 'package:hear_me_out/views/on_boarding.dart';
import 'package:hear_me_out/views/signup_screen.dart';
import 'package:hear_me_out/views/test_screen.dart';

class AppRoot extends StatelessWidget {
 final List<CameraDescription> cameras;

 AppRoot({this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      home:
     // ChatListScreen()
      SignupScreen()
      //TestScreen(cameras: cameras,),
    );
  }
}
