// ignore_for_file: prefer_const_constructors
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: avoid_print
// ignore_for_filr: await_only_futures
import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading..';

  Future<void> setupWorldTime() async {
    WorldTime instance = await WorldTime(
        location: "Europe, Berlin",
        flagUrl: "germany.png",
        locationUrl: "Europe/Berlin");
    await instance.getTime();
    Navigator.restorablePushReplacementNamed(context, '/home', arguments: {
      'Location': instance.location,
      'Flag': instance.flagUrl,
      'Time': instance.time,
      'IsDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitRotatingCircle(
        color: Colors.red,
        size: 50.0,
      ),
    );
  }
}
