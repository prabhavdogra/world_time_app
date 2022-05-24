// ignore_for_file: prefer_const_constructors
// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        locationUrl: 'Europe/London', location: 'London', flagUrl: 'uk.png'),
    WorldTime(
        locationUrl: 'Europe/Berlin',
        location: 'Athens',
        flagUrl: 'greece.png'),
    WorldTime(
        locationUrl: 'Africa/Cairo', location: 'Cairo', flagUrl: 'egypt.png'),
    WorldTime(
        locationUrl: 'Africa/Nairobi',
        location: 'Nairobi',
        flagUrl: 'kenya.png'),
    WorldTime(
        locationUrl: 'America/Chicago',
        location: 'Chicago',
        flagUrl: 'usa.png'),
    WorldTime(
        locationUrl: 'America/New_York',
        location: 'New York',
        flagUrl: 'usa.png'),
    WorldTime(
        locationUrl: 'Asia/Seoul',
        location: 'Seoul',
        flagUrl: 'south_korea.png'),
    WorldTime(
        locationUrl: 'Asia/Jakarta',
        location: 'Jakarta',
        flagUrl: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'Location': instance.location,
      'Flag': instance.flagUrl,
      'Time': instance.time,
      'IsDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flagUrl}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
