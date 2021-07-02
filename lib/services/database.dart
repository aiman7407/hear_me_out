import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hear_me_out/src/const_strings.dart';

class DataBaseHelper
{

    getUserByUsername(dynamic username) async {
    return await FirebaseFirestore.instance.collection(USERS_COLLECTION_NAME)
        .where(USERS_USERNAME,isEqualTo:username )
        .get();
  }

    getUserByEmail(String  email) async {
      return await FirebaseFirestore.instance.collection(USERS_COLLECTION_NAME)
          .where(USERS_EMAIL,isEqualTo:email )
          .get().catchError((e){
            print(e.toString());
      });
    }



    // Stream<QuerySnapshot>loadOrdersDetails(username)
    // {
    //   return FirebaseFirestore.instance.collection(USERS_COLLECTION_NAME).doc(username)
    //       .collection(USERS_USERNAME)
    //       .snapshots();
    // }



  uploadUserInfo(userMap)
  {
    FirebaseFirestore.instance.collection(USERS_COLLECTION_NAME)
    .add(userMap)
    ;
  }

  createChatRoom(String chatRoomId,chatRoomMap)
  {
    FirebaseFirestore.instance.collection(CHATROOM_COLLECTION_NAME)
        .doc(chatRoomId)
        .set(chatRoomMap)
        .catchError((e){
          print(e.toString());
    });
  }

    addChatRoom(chatRoom, chatRoomId)
    {
      FirebaseFirestore.instance
          .collection("chatRoom")
          .doc(chatRoomId)
          .set(chatRoom)
          .catchError((e) {
        print(e);
      });
    }

}

