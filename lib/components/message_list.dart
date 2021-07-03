import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/src/const.dart';
import 'package:hear_me_out/src/const_strings.dart';
import 'package:hear_me_out/src/user_data_const.dart';

import 'message_tile.dart';


class MessageList extends StatelessWidget {

  final chatMessageStream;


  MessageList({this.chatMessageStream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: chatMessageStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot values = snapshot.data;
            print(values.size);

            return Expanded(
              child: ListView.builder(
                  itemCount: values.docs.length,

                  itemBuilder: (context, index) {
                    return MessageTile(
                      message: values.docs[index][CHATS_MESSAGE],
                      isByMe:
                      values.docs[index][CHATS_SEND_BY] == Constants.userName,
                    );
                  }),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
                  backgroundColor: kMainColor,
                ));
          }
        });
  }
}
