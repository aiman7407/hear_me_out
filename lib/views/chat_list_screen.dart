import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/components/chatrooms_list.dart';
import 'package:hear_me_out/components/chatrooms_tile.dart';
import 'package:hear_me_out/services/auth.dart';
import 'package:hear_me_out/services/database.dart';
import 'package:hear_me_out/services/local_storage.dart';
import 'package:hear_me_out/src/const.dart';
import 'package:hear_me_out/src/const_function.dart';
import 'package:hear_me_out/src/const_strings.dart';
import 'package:hear_me_out/src/user_data_const.dart';
import 'package:hear_me_out/views/search_screen.dart';
import 'login_screen.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}



class _ChatListScreenState extends State<ChatListScreen> {
  Auth auth = Auth();
  DataBaseHelper dbHelper = DataBaseHelper();
  Stream chatRoomSream;

  @override
  void initState() {
    print(Constants.userName);
    getRooms();
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Hear Me Out',
          style: TextStyle(fontSize: 20, color: kMainColor),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
            ),
            color: kMainColor,
            onPressed: () {
              auth.signout().then((value) {
                SharedPreferencesHelper.saveUserLoggedIn(false);
                navigateAndFinish(context: context, screen: LoginScreen());
              });
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(screen: SearchScreen(), context: context);
        },
        child: Icon(Icons.person_search),
      ),
      body: Container(
        child: ChatroomsList(chatRoomSream: chatRoomSream,),
      ),
    );
  }

  getUserInfo() async {
    await SharedPreferencesHelper.getData(
        SharedPreferencesHelper.sharedPreferenceUsernameKey)
        .then((value) {
      if (value != null) {
        setState(() {
          Constants.userName = value;
        });
      }
    });


  }

  Widget chatRoomList()
  {

  }

  getRooms()
  async{
   await dbHelper.getChatRoomsList(Constants.userName).then((value){
      setState(() {
        chatRoomSream=value;
      });
    });
  }
}
