import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeFn {

  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTimeFn({this.location,this.flag,this.url});

  Future<void> getTime() async {
    try{
      Response response=await get('http://worldtimeapi.org/api/timezone/$url');
      Map data=jsonDecode(response.body);
      String datetime=data['datetime'];
      String offsetHours=data['utc_offset'].substring(1,3);
      String offsetMinutes=data['utc_offset'].substring(4);

      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offsetHours),minutes: int.parse(offsetMinutes)));

      isDayTime=now.hour>6 &&now.hour<20?true:false;
      time=DateFormat.jm().format(now);
    }catch(e){
      print('exception caught $e');
      time='exception';
    }
  }
}