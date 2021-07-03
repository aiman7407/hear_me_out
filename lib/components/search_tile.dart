import 'package:flutter/material.dart';
import 'package:hear_me_out/services/database.dart';
import 'package:hear_me_out/src/const_function.dart';
import 'package:hear_me_out/src/const_strings.dart';
import 'package:hear_me_out/src/user_data_const.dart';
import 'package:hear_me_out/views/conversation_screen.dart';

class SearchTile extends StatelessWidget {
  final String username;
  final String email;

  SearchTile({this.username, this.email});

  DataBaseHelper dbHelper = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                username,
                style: TextStyle(),
              ),
              Text(
                email,
                style: TextStyle(),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              createChat(username, context);
            },
            child: Container(
              color: Colors.red,
              child: Text('message'),
            ),
          )
        ],
      ),
    );
  }

  createChat(String username, context) {
    List<String> users = [Constants.userName, username];
    String chatRoomId = getChatRoomId(Constants.userName, username);

    Map<String, dynamic> chatRoom = {
      CHATROOM_USER: users,
      CHATROOM_ID: chatRoomId,
    };
    dbHelper.addChatRoom(chatRoom, chatRoomId);
    navigateTo(context: context, screen: ConversationScreen(chatRoomId: chatRoomId,
    frindUsername: username,
    ));
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }
}
