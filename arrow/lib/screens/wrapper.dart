import 'package:arrow/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './brew/home/home.dart';
import './brew/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user=Provider.of<User>(context);
    print('in wrapper start');
    print(user);
    print('in wrapper end');
    if(user==null){
      return Authenticate();
    }else{
      return Home();
    }
    
  }
}