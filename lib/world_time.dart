import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';
class WorldTime{
  String location;//location name for UI
  String time= ''; //time in that location
  String flag; //url to an asset flag icon
  String url; //location of url for api
  late bool isDayTime;
  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getData() async {
    try{

      var ur = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(ur);
      Map data = jsonDecode((response.body));
      print (data);
      //get properties from data
      String datetime = data['datetime'];
      String offsethrs =  data['utc_offset'].substring(0,3);
      String offsetmin= data['utc_offset'].substring(4,6);
      //print(datetime);
      //print(offset);
      //crete DateTime object
      //DateTime now = DateTime.parse(datetime);
      //print(now);
      // now = now.add(Duration(hours: int .parse(offset)));
      //print(now);
      //time=now.toString();
      DateTime utc = DateTime.parse(datetime);
      DateTime localtime = utc.add(Duration(hours: int.parse(offsethrs),
          minutes: int.parse(offsetmin)));
      isDayTime = localtime.hour>6 && localtime.hour<18 ? true:false;
      time = DateFormat.jm().format(localtime);



    }
    catch(e){
      print('caught:$e');
      time="didn't get";
    }

  }}


