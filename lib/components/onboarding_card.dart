import 'package:flutter/material.dart';

class InterChangingCards extends StatefulWidget {
  @override
  _InterChangingCardsState createState() => _InterChangingCardsState();
}

class _InterChangingCardsState extends State<InterChangingCards> {
  int viewNumber = 0;

  static List<double> firstContainerHeights = [
    458 + spaceBetweenContainers,
    168,
    159,
  ];

  static double secondContainerHeight = 277;

  static double spaceBetweenContainers = 13;

  List<double> secondContainerMargins = [
    0,
    firstContainerHeights[0] - secondContainerHeight,
    0,
  ];

  List<double> firstContainerMargins = [
    0,
    0,
    secondContainerHeight + spaceBetweenContainers,
  ];

  List<String> containerTexts = [
    "Kindness is the language which the deaf can hear and the blind can see.",
    "Don't be shy and connect with everyone",
    "Hear Me Always , Hear Me Out!",
  ];

  List<String> containerImages = [
    "assets/images/landing1.png",
    "assets/images/landing2.png",
    "assets/images/landing3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: firstContainerHeights[0],
          child: Stack(
            children: <Widget>[
              // Container 2
              AnimatedContainer(
                margin: EdgeInsets.only(
                  top: secondContainerMargins[viewNumber],
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                duration: Duration(milliseconds: 250),
                height: secondContainerHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(
                        0.0,
                        3,
                      ),
                      blurRadius: 10,
                    )
                  ],
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     containerImages[viewNumber],
                  //   ),
                  //   fit: BoxFit.scaleDown,
                  // ),
                ),
                child: Image.asset(
                  containerImages[viewNumber],
                  width: double.infinity,
                  fit: BoxFit.scaleDown,
                ),
              ),

              // Container 1
              AnimatedContainer(
                margin: EdgeInsets.only(top: firstContainerMargins[viewNumber]),
                duration: Duration(milliseconds: 250),
                height: firstContainerHeights[viewNumber],
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(
                        0.0,
                        3,
                      ),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      viewNumber == 0
                          ? SizedBox(
                              height: 40,
                            )
                          : Container(),
                      Text(
                        containerTexts[viewNumber],
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                      ),
                      viewNumber == 0
                          ? Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 30,
                                  horizontal: 20,
                                ),
                                child: Image.asset(
                                  containerImages[viewNumber],
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            )
                          : Container(
                              width: 0.0,
                              height: 0.0,
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),

        // Action Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
                borderRadius: BorderRadius.circular(
                  121,
                ),
                child: Container(
                  width: 80,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      121,
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "SKIP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(4288253858),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MainNavigation(),
                  //   ),
                  // );
                }),
            InkWell(
              borderRadius: BorderRadius.circular(121),
              child: Container(
                width: 80,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    121,
                  ),
                  color: Color(4282498717),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        viewNumber == 2 ? "FINISH" : "NEXT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.play_arrow,
                        size: 14,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                if (viewNumber < firstContainerHeights.length - 1) {
                  setState(() {
                    ++viewNumber;
                  });
                } else {
                 print('De7k2');
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
