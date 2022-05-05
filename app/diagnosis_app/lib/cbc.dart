import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'globals.dart' as globals;


class CBCPage extends StatefulWidget {
  @override
  _CBCPageState createState() => _CBCPageState();
}

class _CBCPageState extends State<CBCPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color:Colors.black),
        backgroundColor: Color(0xffefefef),
        title: Text("Complete Blood Count", style: TextStyle(color: Colors.black),),
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
                Text("Please provide the details given in your CBC test report to make the diagnosis. Make sure to enter them correctly.", style: TextStyle(fontSize: 20, color: Color(0xff666666))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(padding:EdgeInsets.all(5), child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
    // "plt" : 0.00,
    // "wbc" : 0.00,
    // "neut" : 0.00,
    // "mono" : 0.00,
    // "lymph" : 0.00,
    // "eo": 0.00,
    // "ig" : 0.00,
    // "rbc" : 0.00,
    // "mpv" : 0.00
    "plt" : 58.0,
    "wbc" : 3.55,
    "neut" : 1.66,
    "mono" : 0.33,
    "lymph" : 1.43,
    "eo": 0.12,
    "ig" : 0.0,
    "rbc" : 3.4,
    "mpv" : 11.6
  };

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
            Text("Platelet Count (PLT)", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['plt'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                setState((){
                  _formData['plt'] = double.parse(value);
                });
              },
            ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("White Blood Cell (WBC)", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['wbc'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                this.setState((){
                  _formData['wbc'] = double.parse(value);
                });
              },
            ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Neutrophils (NEUT)", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['neut'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                this.setState((){
                  _formData['neut'] = double.parse(value);
                });
              },
            ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Monocytes (MONO)", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['mono'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                this.setState((){
                  _formData['mono'] = double.parse(value);
                });
              },
            ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Lymphocytes (LYMPH)", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['lymph'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                this.setState((){
                  _formData['lymph'] = double.parse(value);
                });
              },
            ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Eosinophils (EO)", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['eo'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                this.setState((){
                  _formData['eo'] = double.parse(value);
                });
              },
            ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Immunoglobulin (IG)", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['ig'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                this.setState((){
                  _formData['ig'] = double.parse(value);
                });
              },
            ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Red Blood Cell (RBC)", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['rbc'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                this.setState((){
                  _formData['rbc'] = double.parse(value);
                });
              },
            ))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("Mean Platelet Volume (MPV)", style: TextStyle(fontSize: 18),),
            Container(
              width: 100,
              child:TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.end,
              initialValue: _formData['mpv'].toString(),
              decoration:InputDecoration(
                border: InputBorder.none,
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (value){
                this.setState((){
                  _formData['mpv'] = double.parse(value);
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
        globals.url + '/predict-cbc',
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