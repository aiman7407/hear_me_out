import 'package:flutter/material.dart';
import 'package:hear_me_out/components/chatrooms_list.dart';
import 'package:hear_me_out/services/auth.dart';
import 'package:hear_me_out/services/database.dart';
import 'package:hear_me_out/services/local_storage.dart';
import 'package:hear_me_out/src/const.dart';
import 'package:hear_me_out/src/const_function.dart';
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
    getUserInfo();
    getRooms();

    print('fffffff'+Constants.userName);
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
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {
          navigateTo(screen: SearchScreen(), context: context);
        },
        child: Icon(Icons.person_search,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Your Friend List ',

            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: kSecondColor
            ),
            ),
          ),
          Expanded(child: ChatroomsList(chatRoomSream: chatRoomSream,)),
        ],
      ),
    );
  }

  getUserInfo()  {
     SharedPreferencesHelper.getData(
        SharedPreferencesHelper.sharedPreferenceUsernameKey)
        .then((value) {
          print('value you are looking for is $value');
      if (value != null) {
        print('1value you are looking for is $value');
        setState(() {
          Constants.userName = value;
        });

        return value.toString();
      }
    });

  }

  getRooms()
  async{
    //TODO fix Shared prefrence from here
    getUserInfo();
    print('ضحكت بصوت'+Constants.userName);
   await dbHelper.getChatRoomsList(getUserInfo()).then((value){
      setState(() {
        chatRoomSream=value;
      });
    });
  }
}
