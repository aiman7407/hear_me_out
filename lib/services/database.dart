import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hear_me_out/src/const_strings.dart';

class DataBaseHelper {
  getUserByUsername(dynamic username) async {
    return await FirebaseFirestore.instance
        .collection(USERS_COLLECTION_NAME)
        .where(USERS_USERNAME, isEqualTo: username)
        .get();
  }

  getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection(USERS_COLLECTION_NAME)
        .where(USERS_EMAIL, isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection(USERS_COLLECTION_NAME).add(userMap);
  }

  addChatRoom(chatRoom, chatRoomId) {
    FirebaseFirestore.instance
        .collection(CHATROOM_COLLECTION_NAME)
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  addConversationMessages(String chatRoomId, MessageMap) {
    FirebaseFirestore.instance
        .collection(CHATROOM_COLLECTION_NAME)
        .doc(chatRoomId)
        .collection(CHATS_COLLECTION_NAME)
        .add(MessageMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  getConversationMessages(String chatRoomId) async {
    return await FirebaseFirestore.instance
        .collection(CHATROOM_COLLECTION_NAME)
        .doc(chatRoomId)
        .collection(CHATS_COLLECTION_NAME)
        .orderBy(CHATS_TIME)
        .snapshots();
  }

  getChatRoomsList(String username) async {
    return await FirebaseFirestore.instance
        .collection(CHATROOM_COLLECTION_NAME)
        .where(CHATROOM_USER, arrayContains: username)
        .snapshots();
  }
}
