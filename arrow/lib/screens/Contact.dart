import 'package:flutter/material.dart';
import '../function/AppDrawer.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  int devLevel=99;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:AppDrawer(),
      backgroundColor: Colors.grey[900],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            devLevel+=1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
      appBar: AppBar(
        title:Text(
          'Contact',
          ),
        centerTitle:true,
        backgroundColor: Colors.grey[850],
        elevation:0.0
      ),
      body:Padding(
        padding:EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child:Column(
        //          crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/OQ.png'),
                      radius: 40.0,
                    )),
                    Divider(
                      height: 90.0,
                      color: Colors.grey[800],),
                    Text(
                    'Name',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2.0,
                        color: Colors.grey,
                      ),),
                    SizedBox(height: 10.0,),
                    Text(
                    'Sijil.S',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.amberAccent,
                        fontFamily: 'IndieFlower'
                      ),),
                      SizedBox(height: 30.0,),
                      Text(
                    'Developer Level',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2.0,
                        color: Colors.grey,
                      ),),
                    SizedBox(height: 10.0,),
                    Text(
                    '${devLevel.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.amberAccent,
                        fontFamily: 'IndieFlower'
                      ),),
                      SizedBox(height: 30.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.email,
                            color: Colors.grey[400],
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            'oliverqueen@thearrow.com',
                            style: TextStyle(
                              fontFamily: 'IndieFlower',
                              color: Colors.amberAccent,
                              fontSize: 18.0,
                              letterSpacing: 1.0
                            ),
                          )
                        ],
                      )
            ],
        )
      ),
      
    );
  }
}
