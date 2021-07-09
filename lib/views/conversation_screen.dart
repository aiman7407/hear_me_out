import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/components/message_list.dart';
import 'package:hear_me_out/providers/camera_provider.dart';
import 'package:hear_me_out/services/database.dart';
import 'package:hear_me_out/src/const.dart';
import 'package:hear_me_out/src/const_function.dart';
import 'package:hear_me_out/src/const_strings.dart';
import 'package:hear_me_out/src/user_data_const.dart';
import 'package:hear_me_out/views/camera_screen.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;
  final String frindUsername;
  final String messageTranslated;

  ConversationScreen(
      {this.chatRoomId, this.frindUsername, this.messageTranslated});

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
    if (widget.messageTranslated != null) {
      messageController.text = widget.messageTranslated;
    } else {
      print('no data sent here');
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kMainColor,
        title: Text(widget.frindUsername),
      ),
      body: Container(
        child: Column(
          children: [
            MessageList(
              chatMessageStream: chatMessageStream,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kSilverColor.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: messageController,
                        style: TextStyle(color: kMainColor, fontSize: 20),
                        decoration: InputDecoration(
                            hintText: 'Message', border: InputBorder.none),
                      ),
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
                    ),
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
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              navigateTo(
                                  context: context,
                                  screen: TestScreen(
                                    frindUsername: widget.frindUsername,
                                    chatRoomId: widget.chatRoomId,
                                  ));
                            }),
                      ),
                    ),
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
      FocusScope.of(context).requestFocus(new FocusNode());
      messageController.clear();
      if (messageController.text != '') {
        messageController.clear();
      }
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
