import 'package:flutter/material.dart';
import '../function/WorldTimeFn.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldTime extends StatefulWidget {
  @override
  _WorldTimeState createState() => _WorldTimeState();
}

class _WorldTimeState extends State<WorldTime> {

  String time='loading';

  void setUpWorldTime()async{
    WorldTimeFn instance=WorldTimeFn(location:'Kolkata',flag:'india.png',url:'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/worldtimehome',arguments:{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:SpinKitCircle(
        color: Colors.white,
        size: 50.0,
      )
    );
  }
}