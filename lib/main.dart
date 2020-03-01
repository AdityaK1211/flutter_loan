import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_loan/app_screens/body_flutter.dart';
import 'app_screens/login.dart';

//void main() => runApp(MyApp());
void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Flutter Application",
    home: MyFlutter()
));

class MyFlutter extends StatefulWidget {
  _MyFlutterState createState() => _MyFlutterState();
}
class _MyFlutterState extends State<MyFlutter> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),
            () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Login()
              )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
            fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                radius: 50.0,
                                child: Icon(
                                  Icons.account_balance,
                                  color: Colors.white,
                                  size: 50.0,
                                )
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.0),
                              ),
                              Text("FAST LOAN",style: TextStyle(color: Colors.blueAccent,fontSize: 30.0,fontWeight: FontWeight.bold))
                            ],
                          )
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(backgroundColor: Colors.blueAccent,),
                            Padding(padding: EdgeInsets.only(top: 30.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Developed in India with Love ", style: TextStyle(color: Colors.black45, fontSize: 18.0,fontWeight: FontWeight.bold)),
                                Icon(Icons.favorite, color: Colors.pink, size: 24.0)
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlutterLogo(size: 40.0),
                                Text("Flutter", style: TextStyle(color: Colors.black45, fontSize: 18.0, fontWeight: FontWeight.bold,))
                              ],
                            )
                          ],
                        )
                      )
                    ],
                  )
                ],
            )
        );
  }
}