import 'package:first_project/UserList.dart';
import 'package:first_project/model/User.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String _username;
  String _password;
  List<User> _users = List<User>();
  final usernameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _insertUser() {
    if (_username.isEmpty || _password.isEmpty) return;
    setState(() {
      User user = User(
          username: _username,
          password: _password,
          createdDate: DateTime.now());
      _users.add(user);
      _username = '';
      _password = '';
      usernameEditingController.text = '';
      passwordEditingController.text = '';
    });
  }

  void _onShowModalBottomSheet() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: usernameEditingController,
                  onChanged: (value) => {
                    this.setState(() {
                      _username = value;
                    })
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(30))),
                      labelText: 'Enter your username'),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  cursorColor: Colors.pink,
                  autofocus: false,
                  obscureText: true,
                  controller: passwordEditingController,
                  onChanged: (value) => {
                    this.setState(() {
                      _password = value;
                    })
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(30))),
                      labelText: 'Enter your password'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    ButtonTheme(
                      padding: EdgeInsets.all(15),
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.pinkAccent,
                        onPressed: () {
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Username : $_username, Password : $_password',
                              ),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          _insertUser();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Đăng ký',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    ButtonTheme(
                      padding: EdgeInsets.all(15),
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.redAccent,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Hủy bỏ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Xin chào thế giới',
            style: TextStyle(fontFamily: 'Raleway-Regular'),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.add), onPressed: _onShowModalBottomSheet)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _onShowModalBottomSheet,
          backgroundColor: Colors.pinkAccent,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserList(
                  users: _users,
                )
              ],
            ),
          ),
        ));
  }
}
