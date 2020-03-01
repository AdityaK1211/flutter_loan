import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loan extends StatefulWidget {
  @override
  _LoanState createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  final _principleControl = TextEditingController();
  final _rateControl = TextEditingController();
  final _tenureControl = TextEditingController();
  var _principle = "";
  var _rate = "";
  var _tenure = "";
  var _emiResult = "";
  var _intrResult = "";
  var _monthResult = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
          title: const Text('FAST LOAN'),
      ),
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
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("EMI ₹ $_emiResult", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Interest ₹ $_intrResult", style: TextStyle(color: Colors.white, fontSize: 25),),
                  SizedBox(height: 10,),
                  Text("Installments $_monthResult", style: TextStyle(color: Colors.white, fontSize: 25),),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30,),
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
                                  controller: _principleControl,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: "Principle Amount ₹",
                                      hintText: "Enter Principle Amount ₹",
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
                                  controller: _rateControl,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: "Rate of Interest %",
                                      hintText: "Enter Rate of Interest %",
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
                                  controller: _tenureControl,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: "Tenure Years",
                                      hintText: "Enter Tenure Period Years",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                            child: Center(
                                child: ButtonBar(
                                  children: <Widget>[
                                    FlatButton(
                                        padding: EdgeInsets.all(20),
                                        color: Colors.redAccent,
                                        child: Text("Clear"),
                                        onPressed: () {
                                          _principleControl.clear(); //Clear value
                                          _rateControl.clear(); //Clear value
                                          _tenureControl.clear(); //Clear value
                                          _emiResult = "0.0"; //Clear value
                                          _intrResult = "0.0"; //Clear value
                                          _monthResult = "0.0"; //Clear value
                                        }
                                    ),
                                    RaisedButton(
                                      padding: EdgeInsets.all(20),
                                      color: Colors.blue,
                                      child: Text("Calculate"),
                                      onPressed: _handleCalculation,
                                    ),
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
            ),
          ],
        ),
      ),
    );
  }

  void _handleCalculation() {

    double emi = 0.0;
    double intr = 0.0;
    int p = int.parse(_principleControl.text);
    double r = double.parse(_rateControl.text);
    int n = int.parse(_tenureControl.text);

    double tr = r / 12 / 100;
    int tn = n * 12;

    emi = (p * tr * pow((1+tr), tn) / ( pow((1+tr),tn) -1));
    intr = emi * tn - p;

    _principle = p.toStringAsFixed(2);
    _rate = r.toStringAsFixed(2);
    _tenure = n.toStringAsFixed(2);
    _emiResult = emi.toStringAsFixed(2);
    _intrResult = intr.toStringAsFixed(2);
    _monthResult = tn.toString();
    setState(() {
    });
  }
}