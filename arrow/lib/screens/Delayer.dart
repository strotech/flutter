import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Delayer extends StatefulWidget {
  @override
  _DelayerState createState() => _DelayerState();
}

class _DelayerState extends State<Delayer> {

  String returnData='load';
  String finalReturnData='';

  Future<String> getData() async {
    String firstName =await Future.delayed(Duration(seconds: 1),(){
      return 'Oliver';
    });
    String lastName =await Future.delayed(Duration(seconds: 1),(){
      return 'Queen';
    });
    print(firstName +' - '+ lastName);
    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data=jsonDecode(response.body);
    print(data);
    return firstName;
  }

  void setGetData()async{    
    returnData=await getData();
    setState(() {
      finalReturnData=returnData;
    });
  }
  


  @override
  void initState() {
    super.initState();
    setGetData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            body: Center(
              child: Text(
                finalReturnData,
                style:TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
      ),
    );
  }
}