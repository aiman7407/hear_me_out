import 'package:flutter/material.dart';
import 'package:hear_me_out/components/onboarding_card.dart';


class IntroGuideScreen extends StatefulWidget {
  @override
  _IntroGuideScreenState createState() => _IntroGuideScreenState();
}

class _IntroGuideScreenState extends State<IntroGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Hero(
              tag: "logo",
              child: Image.asset(
                "assets/icons/logo.png",
                width:80,
              ),
            ),
            SizedBox(
              height:46.54,
            ),
            InterChangingCards(),
            SizedBox(
              height:15,
            ),
          ],
        ),
      ),
    );
  }
}
