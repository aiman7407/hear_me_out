import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/components/search_list.dart';
import 'package:hear_me_out/services/database.dart';
import 'package:hear_me_out/services/local_storage.dart';
import 'package:hear_me_out/src/const.dart';
import 'package:hear_me_out/src/const_function.dart';
import 'package:hear_me_out/src/const_strings.dart';
import 'package:hear_me_out/src/user_data_const.dart';
import 'package:hear_me_out/views/conversation_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  DataBaseHelper dbHelper = DataBaseHelper();

  QuerySnapshot searchSnapshot;
  String name, email;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)

                ),
                color: kSilverColor.withOpacity(0.4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                    controller: searchController,
                    style: TextStyle(color: kMainColor,
                    fontSize: 23
                    ),
                    decoration: InputDecoration(
                          hintText: 'Search User Name',
                          border: InputBorder.none),
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
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            initiateSearch();
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SearchList(
              searchSnapshot: searchSnapshot,
            ),
          )
        ],
      ),
    );
  }

  initiateSearch() async {
    if (searchController.text.isNotEmpty) {
      await dbHelper.getUserByUsername(searchController.text).then((snapshot) {
        setState(() {
          searchSnapshot = snapshot;
        });
        print("$searchSnapshot");
        setState(() {});
      });
    }
  }


}
