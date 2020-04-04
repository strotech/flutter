import 'package:arrow/screens/brew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:arrow/services/auth.dart';
import '../shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth=AuthService();
  final _formKey = GlobalKey<FormState>();
  String email='';
  String password='';
  String error='';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign Up to the Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body:Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child:Form(
          key:_formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Email'),
                validator: (val)=> val.isEmpty?'Enter a valid email address':null,
                onChanged: (val){
                  setState(()=>email=val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Password'),
                obscureText: true,
                validator:(val)=> val.length<6?'Enter password atleast 6 characters long':null,
                onChanged: (val){
                  setState(()=>password=val);
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style:TextStyle(color:Colors.white)
                ),
                onPressed: ()async{
                  if(_formKey.currentState.validate()){
                    setState(() {
                      loading =true;
                    });   
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result==null){
                      setState((){
                        error='Please enter a valid email address';
                        loading=false;
                      });
                    }
                  }                  
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style:TextStyle(
                  color:Colors.red,
                  fontSize: 14.0
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}