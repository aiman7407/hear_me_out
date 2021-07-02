import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  final String username;
  final String email;


  SearchTile({this.username, this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(username,style: TextStyle(),),
              Text(email,style: TextStyle(),),
            ],
          ),
          Spacer(),
          Container(
            color: Colors.red,
            child: Text('message'),)
        ],
      ),
    );
  }
}
