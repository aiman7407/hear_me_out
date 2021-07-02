import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/components/search_tile.dart';
import 'package:hear_me_out/src/const_strings.dart';

class SearchList extends StatelessWidget {

  final QuerySnapshot searchSnapshot;


  SearchList({this.searchSnapshot});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount:searchSnapshot.docs.length,
        itemBuilder: (context, index){
          return
            searchSnapshot!=null?

            SearchTile(
            email: 'searchSnapshot.docs[index][USERS_EMAIL]',
            username: 'searchSnapshot.docs[index][USERS_USERNAME]',
          ):Container(
              child: Text('no data yet'),
            );
        });
  }
}
