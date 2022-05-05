import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './cbc.dart';
import './diabetes.dart';
import './thyroid.dart';

void main(){
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xffefefef),
    statusBarIconBrightness: Brightness.dark
  ));
}

class MyApp extends StatelessWidget { 
  @override
  Widget build (BuildContext ctxt) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'National',
        iconTheme: IconThemeData(
          color: Colors.black
        )
      ),
      home: Scaffold(
        backgroundColor: Color(0xffefefef),
        body: HomeScreen()
      )
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(32),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 60,),
            Container(
              child: Image.asset('assets/logo.png', height: 50,),
            ),
            SizedBox(height: 40,),
            Text("Welcome to", style: TextStyle(fontSize: 36, color: Color(0xff444444))),
            Text("the new", style: TextStyle(fontSize: 40,color: Color(0xff6200de))),
            Text("Diagnosis App", style: TextStyle(fontSize: 40,color: Color(0xff444444))),
            SizedBox(height: 30,),
            Container(
              width: 56,height: 3, color: Colors.red
            ),
            SizedBox(height: 30,),
            Text("Choose your test to proceed", style: TextStyle(fontSize: 26, color: Color(0xff666666))),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x226200de),
                    spreadRadius: 5, blurRadius: 20
                  )
                ]
              ),
              child:Column(
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.all(20),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Complete Blood Count", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_right, color: Color(0xff6200de),),
                      ],
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CBCPage()),
                      );
                    },
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(20),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Diabetes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_right, color: Color(0xff6200de),),
                      ],
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DiabetesPage()),
                      );
                    },
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(20),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Thyroid", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_right, color: Color(0xff6200de),),
                      ],
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThyroidPage()),
                      );
                    },
                  )
                ],
              )
            )
          ],
        )
      ],
    );
  }
}