import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};

  @override
  Widget build(BuildContext context) {
    try {
      data = data.isNotEmpty ?data : ModalRoute
          .of(context)!
          .settings
          .arguments as Map;

    }
    catch(e){
      data= data;
    }
    print(data);
    String bgImage = data['isDayTime'] ?'day.jpg':'370100.jpg';


    return  Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover)
          ),
          child:Padding(
            padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                ElevatedButton.icon(onPressed: () async {

                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data= {
                      'time':result['time'],
                      'location':result['location'],
                      'isDayTime':result['isDayTime'],
                      'flag':result['flag'],
                    };
                  });
                },
                  icon:Icon(Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text('Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],

                    ),),

                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.black,

                      ),
                    ),
                  ],

                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.red,
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );





  }
}
