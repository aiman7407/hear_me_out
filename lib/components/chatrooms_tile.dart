import 'package:flutter/material.dart';
import 'package:hear_me_out/src/const.dart';
import 'package:hear_me_out/src/const_function.dart';
import 'package:hear_me_out/src/user_data_const.dart';
import 'package:hear_me_out/views/conversation_screen.dart';

class ChatroomTile extends StatelessWidget {
  final String username;
  final String chatRoomId;

  ChatroomTile({this.username, this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    String finalUsername =
        username.replaceAll('_', '').replaceAll(Constants.userName, '');
    return GestureDetector(
      onTap: () {
        navigateTo(
            context: context,
            screen: ConversationScreen(
              frindUsername: finalUsername,
              chatRoomId: chatRoomId,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: kMainColor, borderRadius: BorderRadius.circular(40)),
              child: Text(
                username.substring(0, 1).toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              finalUsername,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
