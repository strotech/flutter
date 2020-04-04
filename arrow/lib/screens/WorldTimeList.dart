import 'package:flutter/material.dart';
import '../function/WorldTimeFn.dart';


class WorldTimeList extends StatefulWidget {
  @override
  _WorldTimeListState createState() => _WorldTimeListState();
}

class _WorldTimeListState extends State<WorldTimeList> {

  List<WorldTimeFn> locations = [
    WorldTimeFn(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTimeFn(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTimeFn(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTimeFn(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTimeFn(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTimeFn(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTimeFn(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTimeFn(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index)async{
    WorldTimeFn instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Choose a location'),
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount:locations.length,
        itemBuilder:(context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child:ListTile(
                onTap: (){
                  updateTime(index);
                },
                title:Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/${locations[index].flag}'),
                ),
              )
            ),
          );
        },

      )
    );
  }
}