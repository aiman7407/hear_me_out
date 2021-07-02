import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hear_me_out/src/const_strings.dart';

class DataBaseHelper
{

  dynamic  getUserByUsername(dynamic username) async {
    return await FirebaseFirestore.instance.collection(USERS_COLLECTION_NAME)
        .where(USERS_USERNAME,isEqualTo:username )
        .get();
  }


  uploadUserInfo(userMap)
  {
    FirebaseFirestore.instance.collection(USERS_COLLECTION_NAME)
    .add(userMap)
    ;
  }
}

