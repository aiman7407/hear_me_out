import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/main.dart';
import 'package:hear_me_out/providers/camera_provider.dart';
import 'package:hear_me_out/services/camera.dart';
import 'package:hear_me_out/services/local_storage.dart';
import 'package:hear_me_out/views/chat_list_screen.dart';
import 'package:hear_me_out/views/conversation_screen.dart';
import 'package:hear_me_out/views/login_screen.dart';
import 'package:hear_me_out/views/on_boarding.dart';
import 'package:hear_me_out/views/search_screen.dart';
import 'package:hear_me_out/views/signup_screen.dart';
import 'package:hear_me_out/views/camera_screen.dart';
import 'package:provider/provider.dart';

class AppRoot extends StatefulWidget {
  final List<CameraDescription> cameras;

  AppRoot({this.cameras});

  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  bool isLoggedIn = false;

  @override
  void initState() {
    getLoggedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: isLoggedIn ? ChatListScreen() : SignupScreen()
        //  TestScreen(
        //   cameras: cameras,
        // ),
        );
  }

  getLoggedState() async {
    await SharedPreferencesHelper.getData(
            SharedPreferencesHelper.sharedPreferenceUserLoggenInKey)
        .then((value) {
      if (value != null) {
        setState(() {
          isLoggedIn = value;
        });
      }
    });
  }
}
