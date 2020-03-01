import 'package:flutter/material.dart';
import 'package:flutter_app_loan/app_screens/welcome.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final _textController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> openDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Fill the Username and Password"),
          actions: <Widget>[
            FlatButton(
              child: Text("Continue"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.blue[600],
                  Colors.blue[400],
                  Colors.blue[200]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  controller: _textController,
                                  decoration: InputDecoration(
                                      hintText: "Username",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                  obscureText: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: <Widget>[
                            Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                            SizedBox(width: 90.0,),
                            Text("Don't have an account?", style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                        Container(
                          child: Center(
                            child: ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                  color: Colors.redAccent,
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    _textController.clear(); //Clear value
                                    _passwordController.clear(); //Clear value
                                  }
                                ),
                                RaisedButton(
                                  color: Colors.blue,
                                  child: Text("Login"),
                                  onPressed: () {
                                    if(_textController.text == "admin" && _passwordController.text == "root") {
                                      _textController.clear();
                                      _passwordController.clear();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Welcome())
                                      );
                                    }
                                    else if(_textController.text=="" || _passwordController.text=="") {
                                      return openDialog();
                                    }
                                  },
                                )
                              ],
                            )
                          )
                        ),
                        SizedBox(height: 30,),
                        ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UsernameValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Username can\'t be empty' : null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}