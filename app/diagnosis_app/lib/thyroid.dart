import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'globals.dart' as globals;


class ThyroidPage extends StatefulWidget {
  @override
  _ThyroidPageState createState() => _ThyroidPageState();
}

class _ThyroidPageState extends State<ThyroidPage> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(child:Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color:Colors.black),
        backgroundColor: Color(0xffefefef),
        title: Text("Thyroid Test", style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Color(0xffefefef),
            padding: EdgeInsets.all(20),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),
                Container(
                  width: 56,height: 3, color: Colors.red
                ),
                SizedBox(height: 20,),
                Text("Please provide the details given in your thyroid test report to make the diagnosis. Make sure to enter them correctly.", style: TextStyle(fontSize: 20, color: Color(0xff666666))),
              ],
            ),
          ),
          
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding:EdgeInsets.all(5), 
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Fill the details and hit the button to make diagnosis.", style: TextStyle(fontSize: 22, color: Color(0xff666666))),
                  _FormBuilder()
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class _FormBuilder extends StatefulWidget{
  @override
  _FormBuilderState createState(){
    return _FormBuilderState();
  }
}

class _FormBuilderState extends State<_FormBuilder> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  String _result = "null", _buttonText = "SUBMIT";
  Map<String,dynamic> _formData = {
    "thyroid_surgery" : 0,
    "pregnant" : 0,
    "age" : 80,
    "sex" : 1,
    "T3" : 0.8,
    "TT4" : 105,
  };

  List<String> _pregnantCases = ['No', 'Yes'];
  String _pregnant = "No";
  List<String> _genders = ['Male', 'Female'];
  String _gender = "Female";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Number of Thyroid surgeries", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['thyroid_surgery'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                setState((){
                  _formData['thyroid_surgery'] = double.parse(value);
                });
              },
            ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Are you pregnant now?", style: TextStyle(fontSize: 18),),
            Container(
              width: 25,
              child:DropdownButton<String>(
                value: _pregnant,
                elevation: 16,
                iconSize: 0,
                style: TextStyle(color: Colors.black87),
                underline: Container(height: 0,color: Colors.black54,),
                onChanged: (String newValue) {
                  setState(() {
                    _pregnant = newValue;
                    if(newValue == "Yes")
                      _formData['pregnant'] = 1;
                    else _formData['pregnant'] = 0;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                items: _pregnantCases.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, textAlign: TextAlign.right,),
                  );
                }).toList(),
              ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Age", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['age'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                this.setState((){
                  _formData['age'] = double.parse(value);
                });
              },
            ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Sex", style: TextStyle(fontSize: 18),),
            Container(
              width: 40,
              child:DropdownButton<String>(
                value: _gender,
                elevation: 16,
                iconSize: 0,
                style: TextStyle(color: Colors.black87),
                underline: Container(height: 0,color: Colors.black54,),
                onChanged: (String newValue) {
                  setState(() {
                    _gender = newValue;
                    if(newValue == "Male")
                      _formData['sex'] = 1;
                    else _formData['sex'] = 0;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                items: _genders.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, textAlign: TextAlign.right,),
                  );
                }).toList(),
              ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("T3", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['T3'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                this.setState((){
                  _formData['T3'] = double.parse(value);
                });
              },
            ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("TT4", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['TT4'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                this.setState((){
                  _formData['TT4'] = double.parse(value);
                });
              },
            ))
          ],),
          RaisedButton(
            textColor: Colors.white,
            color: Color(0xff6200de),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(100),
            ),
            child: Padding(
              padding: EdgeInsets.all(15), 
              child: _loading? 
                Container(width:15,height:15,child:CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white), strokeWidth: 3,))
                :
                Text('$_buttonText')
            ),
            onPressed: () {
              setState(() {
                _loading = true;
              });
              _submit(context);
            }
          )
        ],
      ),
    );
  }

  _submit(BuildContext context) async{
    print("Called");
    //set API token
    Map<String, dynamic> _requestBody = {};
    _requestBody['token'] = 'demo-api-token-4F3jpeacm2aRzZw';
    _requestBody['data'] = _formData;
    try{
      var response = await Requests.post(
        globals.url + '/predict-thyroid',
        body: _requestBody,
        bodyEncoding: RequestBodyEncoding.JSON);
        var resp = jsonDecode(response.content());
        print(resp);
        if(resp['status'] == 0){
          print("in status == 0");
          this.setState(() {
            _loading = false;
            _result = resp['diagnosis'];
          });
          _showSnackBar(context);
        }
        else{
          print("in status != 0");
          setState(() {
            _loading = false;
            _buttonText = "Sorry some error occured. Erro : " + resp['details'];
          });
      }  
    }
    catch (e){
      setState(() {
        _loading = false;
        _result = "Exception occured. Details : " + e.toString();
      });
    }
  }

  _showSnackBar(var context){
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(days: 365),
        backgroundColor: Color(0xff6200de),
        elevation: 30,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft:Radius.circular(30))),
        content: Container(
          padding: EdgeInsets.only(top : 20),
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("RESULT", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text("According to the values provided, our system diagnosed it as :", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10,),
                  Text("$_result", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                ],
              ),
              RaisedButton(
                child: Text("OKAY", style: TextStyle(fontSize: 16),),
                color: Colors.white10,
                onPressed: (){
                  setState(() {
                    _loading = false;
                    _result = "null";
                    _buttonText = 'SUBMIT';
                  });
                  Scaffold.of(context).hideCurrentSnackBar();
                },
              )
            ],
          )
        ),
      )
    );
  }
}