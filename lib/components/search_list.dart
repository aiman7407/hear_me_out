import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/components/search_tile.dart';
import 'package:hear_me_out/services/database.dart';
import 'package:hear_me_out/src/const_strings.dart';

class SearchList extends StatelessWidget {
  final QuerySnapshot searchSnapshot;

  SearchList({this.searchSnapshot});

  @override
  Widget build(BuildContext context) {

    print('eeeeeeeeeeeeeeeeeeeee'+searchSnapshot.toString());
    if(searchSnapshot==null)
      {
        return Text('add search ya bacha masr');
      }

    if(searchSnapshot.docs.isEmpty)
      {return Text('no data here yet');}
    else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: searchSnapshot.docs.length,
          itemBuilder: (context, index) {
            return searchSnapshot.docs == null
                ? Container(
                    child: Text('no data yet'),
                  )
                : SearchTile(
                    email: searchSnapshot.docs[index][USERS_EMAIL],
                    username: searchSnapshot.docs[index][USERS_USERNAME],
                  );
          });
    }
  }
}
