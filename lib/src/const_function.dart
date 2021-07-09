import 'package:flutter/material.dart';

void navigateTo({context, screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void navigateAndFinish({context, screen}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => screen,
    ),
    (route) => false,
  );
}
