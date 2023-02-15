import 'package:flutter/material.dart';
import 'package:world_time/world_time.dart';



class ChooseLocation extends StatefulWidget {

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations =[
    WorldTime(location: 'Kolkata', flag: 'india.jpeg', url: 'Asia/Kolkata'),
    WorldTime(location: 'Chicago', flag: 'R.png', url:'America/Chicago'),
    WorldTime(location: 'Jakarta', flag: 'th.jpeg', url: 'Asia/Jakarta'),
    WorldTime(location: 'London', flag: 'uk.jpg', url: 'Europe/London'),
    WorldTime(location: 'Melbourne', flag: 'aus.png', url: 'Australia/Melbourne'),
    WorldTime(location: 'New_York', flag: 'R.png', url: 'America/New_York'),
  ];
  void upDatetime(index) async{
    WorldTime instance = locations[index];
    await instance.getData();
    //navigate home screen
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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('choose a location '),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    upDatetime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }




      ),
    );

  }
}