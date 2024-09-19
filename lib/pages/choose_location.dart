import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> location = [
    WorldTime(url: "Europe/London", location: 'London', flag: 'uk.png'),
    WorldTime(url: "Europe/Berlin", location: 'Athens', flag: 'greece.png'),
    WorldTime(url: "Africa/Cairo", location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: "Africa/Nairobi", location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: "America/Chicago", location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: "America/New_York", location: 'New_York', flag: 'usa.png'),
    WorldTime(url: "Asia/Seoul", location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: "Asia/Jakarta", location: 'Jakarta', flag: 'indonesia.png')
  ];

  void updateTime(index) async {
    WorldTime instance = location[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Location Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 1.0, horizontal: 4), // Add padding here
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                  // Handle tap event
                },
                title: Text(location[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${location[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
