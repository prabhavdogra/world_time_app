// ignore_for_file: prefer_const_constructors
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: avoid_unnecessary_containers
// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {}; // Data coming from loading route

  @override
  Widget build(BuildContext context) {
    // Receive the data
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    // Note that we don't need to use set state here
    // because we are not changing the state of the widget

    // print('isDayTime = ');
    // print(data['IsDayTime']);
    // Set background
    String bgImage = data['IsDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['IsDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/$bgImage',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'Location': result['Location'],
                        'Flag': result['Flag'],
                        'Time': result['Time'],
                        'IsDayTime': result['IsDayTime'],
                      };
                    });
                    print(data);
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['Location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.grey[300],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['Time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
