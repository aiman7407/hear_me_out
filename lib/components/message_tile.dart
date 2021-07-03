import 'package:flutter/material.dart';
import 'package:hear_me_out/src/const.dart';

class MessageTile extends StatelessWidget {
  final String message;
  final bool isByMe;

  MessageTile({this.message, this.isByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: isByMe ? 0 : 24, right: isByMe?24:0),
        width: MediaQuery.of(context).size.width,
        alignment: isByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: isByMe
                      ? [kMainColor, kMainColor.withOpacity(0.5)]
                      : [
                          kSecondColor,
                          kSecondColor.withOpacity(0.5),
                        ]),
              borderRadius: isByMe
                  ? BorderRadius.only(
                      topRight: Radius.circular(23),
                      topLeft: Radius.circular(23),
                      bottomLeft: Radius.circular(23),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(23),
                      topLeft: Radius.circular(23),
                      bottomRight: Radius.circular(23),
                    ),
            ),
            child: Text(
              message,
              style: TextStyle(fontSize: 17),
            ),
          ),
        ));
  }
}
