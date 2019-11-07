import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location name
  String time; // time in that location
  String flag; // url to the asset flag icon
  String url; // location url for API endpoint
  bool isDayTime; // true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      // Get properties from data

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // print('$datetime, $offset');

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print('Caught error $e');
      time = 'could not get time data';
    }

    // // Simulate a network request to get username from a DB
    // String username = await Future.delayed(Duration(seconds: 2), () {
    //   return 'Yoshi';
    // });

    // // Simulate a network request to get bio for user from DB
    // String bio = await Future.delayed(Duration(seconds: 3), () {
    //   return 'Vegan, musician, egg collector';
    // });
    // print('$username - $bio');
  }
}
