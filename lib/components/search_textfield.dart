import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_me_out/services/database.dart';
import 'package:hear_me_out/src/const.dart';

class SearchTextField extends StatefulWidget {
  final searchController;
  var searchSnapshot;

  SearchTextField({this.searchController, this.searchSnapshot});

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  DataBaseHelper dbHelper =DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(200),
      child: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: kSilverColor.withOpacity(0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [


            Expanded(
                child: TextField(
              controller: widget.searchController,
              style: TextStyle(color: kMainColor),
              decoration: InputDecoration(
                  hintText: 'Search User Name', border: InputBorder.none),
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
                    onPressed: () async {
                      if (widget.searchController.text.isNotEmpty) {
                        await dbHelper.getUserByUsername(widget.searchController.text).then((snapshot) {
                          setState(() {
                            widget.searchSnapshot = snapshot;
                          });
                          print("${widget.searchSnapshot}");
                          setState(() {});
                        });
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
