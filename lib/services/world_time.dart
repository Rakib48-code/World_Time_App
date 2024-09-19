import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = ""; // Initialize with an empty string
  String flag;
  String url;
  bool isDaytime; // Declare without initializing

  // Constructor with initialization of isDaytime
  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
    this.isDaytime = true, // Corrected: "this.isDaytime" to ensure parameter assignment
  });

  Future<void> getTime() async {
    try {
      var response = await http
          .get(Uri.parse('https://www.worldtimeapi.org/api/timezone/$url'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String datetime = data["datetime"];
        String offset = data["utc_offset"].substring(1, 3); // Extract the hour part

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        // Set isDaytime based on hour
        isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

        // Format the time to a readable format
        time = DateFormat.jm().format(now);
      } else {
        print('Failed to load time data');
        time = 'Failed to load time data'; // Corrected: Set the time to error message in else block
      }
    } catch (e) {
      print('Error: $e');
      time = 'Could not get time data'; // Corrected: Set the time to error message in catch block
    }
  }
}
