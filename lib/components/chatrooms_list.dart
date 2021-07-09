import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/src/const.dart';
import 'package:hear_me_out/src/const_strings.dart';

import 'chatrooms_tile.dart';

class ChatroomsList extends StatelessWidget {
  final Stream chatRoomSream;

  ChatroomsList({this.chatRoomSream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: chatRoomSream,
        builder: (context, snapshot) {
          QuerySnapshot values = snapshot.data;

          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: values.docs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ChatroomTile(
                        chatRoomId: values.docs[index][CHATROOM_ID],
                        username: values.docs[index][CHATROOM_ID],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Divider(
                          color: kSecondColor,
                        ),
                      )
                    ],
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: kMainColor,
              ),
            );
          }
        });
  }
}
