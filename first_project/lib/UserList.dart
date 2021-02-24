import 'package:first_project/model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class UserList extends StatelessWidget {
  final List<User> users;

  UserList({this.users});

  ListView _buildListView() {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
                margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: index % 2 == 0 ? Colors.pinkAccent : Colors.green,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 15, top: 30)),
                    Icon(Icons.face),
                    Padding(padding: EdgeInsets.only(right: 15)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          'Username : ${users[index].username}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 5)),
                        Text(
                          'Password : ${users[index].password}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Column(
                              children: [
                                Text(
                                  'Date : ',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${DateFormat.yMd().format(users[index].createdDate)}',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: this._buildListView(),
    );
  }
}
