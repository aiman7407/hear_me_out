import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hear_me_out/src/const_strings.dart';

class DataBaseHelper
{

    getUserByUsername(dynamic username) async {
    return await FirebaseFirestore.instance.collection(USERS_COLLECTION_NAME)
        .where(USERS_USERNAME,isEqualTo:username )
        .get();
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
}

