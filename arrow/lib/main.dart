import 'package:arrow/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'screens/Contact.dart';
import 'screens/Quote.dart';
import 'screens/Delayer.dart';
import 'screens/WorldTime.dart';
import 'screens/WorldTimeHome.dart';
import 'screens/WorldTimeList.dart';
import 'screens/wrapper.dart';


void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(StreamProvider<User>.value(
  value:AuthService().user,
  child:   MaterialApp(
    initialRoute: '/contact',
    routes: {
      '/quotes':(context)=>Quote(),
      '/contact':(context)=>Contact(),
      '/delayer':(context)=>Delayer(),
      '/worldtimeloading':(context)=>WorldTime(),
      '/worldtimehome':(context)=>WorldTimeHome(),
      '/worldtimelist':(context)=>WorldTimeList(),
      '/wrapper':(context)=>Wrapper(),
    },
    
   ),
));}

