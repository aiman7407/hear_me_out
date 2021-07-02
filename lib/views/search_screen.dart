import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/components/search_list.dart';
import 'package:hear_me_out/services/database.dart';
import 'package:hear_me_out/src/const.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController=TextEditingController();

  DataBaseHelper dbHelper=DataBaseHelper();

  QuerySnapshot searchSnapshot;

  @override
  void initState() {
    initialSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: kSilverColor.withOpacity(0.4),
                ) ,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded
                      (child: TextField(
                      controller: searchController,
                      style: TextStyle(
                        color: kMainColor
                      ),
                     decoration: InputDecoration(
                       hintText: 'Search User Name',
                       border: InputBorder.none
                     ),

                    )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              // Color(0x36FFFFFF),
                              // Color(0x0FFFFFFF),
                              kMainColor,
                              kSecondColor
                            ]
                          ),
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: IconButton(
                          iconSize: 40,
                            color: kMainColor,
                            icon: Icon(Icons.search,
                        color: Colors.white,
                        ), onPressed: () {
                            initialSearch();
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Expanded(
            //   child: SearchList(
            //     searchSnapshot: searchSnapshot,
            //   ),
            // )

          ],
        ),
      ),
    );
  }

   initialSearch()
  {
    searchController.text='lol';
    dbHelper.getUserByUsername(searchController.text).then((value){
      // set state
      print(searchSnapshot);
      setState(() {
        searchSnapshot=value;
      });
    });
  }
}
