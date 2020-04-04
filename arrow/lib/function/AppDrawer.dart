import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child:Text('HyperCube'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Brew Crew'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/wrapper');
            },
          ),
          ListTile(
            title: Text('World Time'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/worldtimeloading');
            },
          ),
          ListTile(
            title: Text('Contact'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/contact');
            },
          ),
          ListTile(
            title: Text('Awesome Quotes'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/quotes');              
            },
          ),
          ListTile(
            title: Text('Delayed Screen'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/delayer');
            },
          )
        ],
      ),
    );
  }
}