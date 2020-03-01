import 'package:flutter/material.dart';

import 'loan.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('FAST LOAN'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ChoicePage(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;
  final String desc;
  const Choice({this.title, this.icon,this.desc});
}

const List<Choice> choices = <Choice>[
Choice(title: 'PERSONAL LOAN', icon: Icons.person, desc: "A personal loan is a type of unsecured loan and helps you meet your current financial needs. You don’t usually need to pledge any security or collateral while availing a personal loan and your lender provides you with the flexibility to use the funds as per your need. It can serve as your solution for managing your travel costs and wedding expenses as well as the expenses of a medical emergency, home renovation, debt consolidation and others."),
Choice(title: 'HOME LOAN', icon: Icons.home, desc: "A home loan is an amount of money that an individual borrows from a bank or money lending company at a certain rate of interest to be paid with the EMI every month. The property is taken as a security by the money lending company for the Home Loan. The property can either be commercial or personal in nature. When the borrower cannot pay the dues, the lender will possess all the legal rights to recover the outstanding loan amount by sale of the property in question."),
Choice(title: 'CAR LOAN', icon: Icons.directions_car, desc: "Commercial vehicle loans are loans offered to borrowers, usually self-employed individuals, trusts, partnership firms, organisations, etc., for the purchase of vehicles for commercial or business purposes. These Car loans are availed by those who are involved in the transportation business. A commercial vehicle loan can be used to purchase buses, trucks, tippers, tankers, light and small commercial vehicles."),
Choice(title: 'EDUCATION LOAN', icon: Icons.import_contacts, desc: "A student loan is a type of loan designed to help students pay for post-secondary education and the associated fees, such as tuition, books and supplies, and living expenses. It may differ from other types of loans in the fact that the interest rate may be substantially lower and the repayment schedule may be deferred while the student is still in school."),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 150.0,
              color: textStyle.color,
            ),
            Text(
              choice.title,
              style: textStyle,
            ),
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
              child: Text(
                  choice.desc,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
              )
            ),
            Container(
              margin: EdgeInsets.only(right:20, top: 40, bottom: 20),
              child: ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    child: Text("Apply Now"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loan())
                      );
                    },
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}