import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/components/search_tile.dart';
import 'package:hear_me_out/src/const_strings.dart';

class SearchList extends StatelessWidget {
  final QuerySnapshot searchSnapshot;

  SearchList({this.searchSnapshot});

  @override
  Widget build(BuildContext context) {
    print('eeeeeeeeeeeeeeeeeeeee' + searchSnapshot.toString());
    if (searchSnapshot == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(child: Image.asset('assets/images/search.png')),
              ],
            ),
          ),
          Text(
            'Start finding your friends now ! '.toUpperCase(),
            style: TextStyle(fontSize: 20),
          )
        ],
      );
    }

    if (searchSnapshot.docs.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(child: Image.asset('assets/images/notfound.png')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'you have no friend with this user name '.toUpperCase(),
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: searchSnapshot.docs.length,
          itemBuilder: (context, index) {
            return searchSnapshot.docs == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SearchTile(
                    email: searchSnapshot.docs[index][USERS_EMAIL],
                    username: searchSnapshot.docs[index][USERS_USERNAME],
                  );
          });
    }
  }
}
