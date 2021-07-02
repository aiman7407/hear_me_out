import 'package:flutter/material.dart';
import 'package:hear_me_out/services/auth.dart';
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

String username;
class _ChatListScreenState extends State<ChatListScreen> {
  Auth auth = Auth();

  getUserInfo() async {

    await SharedPreferencesHelper.getData(
        SharedPreferencesHelper.sharedPreferenceUsernameKey)
        .then((value) {
      if(value!=null)
      {
        setState(() {
          Constants.userName=value;
        });
      }
    });

    username = await SharedPreferencesHelper.getData(
        SharedPreferencesHelper.sharedPreferenceUsernameKey);
    setState(() {

    });
    print(username);
  }

  @override
  void initState() {
    print(Constants.userName);
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
                navigateAndFinish(context: context, screen: LoginScreen());
              });
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hhhhhhhhhhhhhhhhhh');
          navigateTo(screen: SearchScreen(), context: context);
        },
        child: Icon(Icons.person_search),
      ),
      body: Container(
        child: Text('dsf'),
      ),
    );
  }
}
