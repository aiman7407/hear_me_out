import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/components/message_list.dart';
import 'package:hear_me_out/services/database.dart';
import 'package:hear_me_out/src/const.dart';
import 'package:hear_me_out/src/const_strings.dart';
import 'package:hear_me_out/src/user_data_const.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;
  final String frindUsername;

  ConversationScreen({this.chatRoomId,this.frindUsername});

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  DataBaseHelper dbHelper = DataBaseHelper();

  TextEditingController messageController = TextEditingController();

  Stream chatMessageStream;

  @override
  void initState() {
    getMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kMainColor,
        title: Text(widget.frindUsername),
      ),
      body: Container(
        child: Column(
          children: [
            MessageList(chatMessageStream: chatMessageStream,),

            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: kSilverColor.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: TextField(
                      controller: messageController,
                      style: TextStyle(color: kMainColor),
                      decoration: InputDecoration(
                          hintText: 'Message', border: InputBorder.none),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              // Color(0x36FFFFFF),
                              // Color(0x0FFFFFFF),
                              kMainColor,
                              kSecondColor
                            ]),
                            borderRadius: BorderRadius.circular(40)),
                        child: IconButton(
                            iconSize: 40,
                            color: kMainColor,
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              sendMessage();
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        CHATS_MESSAGE: messageController.text,
        CHATS_SEND_BY: Constants.userName,
        CHATS_TIME: DateTime.now().microsecondsSinceEpoch
      };
      dbHelper.addConversationMessages(widget.chatRoomId, messageMap);
      FocusScope.of(context)
          .requestFocus(new FocusNode());
      messageController.clear();
    }
  }

  getMessages() {
    dbHelper.getConversationMessages(widget.chatRoomId).then((value) {
      setState(() {
        chatMessageStream = value;
      });
    });
  }
}

