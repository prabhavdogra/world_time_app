// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location name for the UI
  String time = 'Loading'; // Time at that Location
  String flagUrl; // URL to the flag image asset
  String locationUrl; // Location URL for the API endpoint
  bool isDayTime = false;

  WorldTime(
      {required this.location,
      required this.flagUrl,
      required this.locationUrl});

  Future<String> getTime() async {
    try {
      var response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/$locationUrl'));
      print(response);
      Map responseData = jsonDecode(response.body);

      String datetime = responseData['datetime'];
      String offset = responseData['utc_offset'];

      String offsetHours = offset.substring(1, 3);
      String offsetMinutes = offset.substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error: $e');
      time = 'OOPS! Something went wrong';
    }
    return time;
  }
}
