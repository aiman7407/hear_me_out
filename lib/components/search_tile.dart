import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/services/database.dart';
import 'package:hear_me_out/src/const.dart';
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
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: kMainColor,
          width: 2)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text('We have found your friend,\n connect together now ! '.toUpperCase(),
          style: TextStyle(
            fontSize: 21
          ),
          ),
          GestureDetector(
            onTap: () {
              createChat(username, context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              color: kMainColor,
              child: Text('click to go to $username chatroom '
                ,style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                ),
              ),
            ),
          ),
          Card(
            color: kSecondColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Friend Data :',
                    style: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  Text(
                    username,
                    style: TextStyle(fontSize: 25,
                    fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 25,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),




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
    navigateTo(
        context: context,
        screen: ConversationScreen(
          chatRoomId: chatRoomId,
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
