import 'package:flutter/material.dart';

class HumidityCard extends StatefulWidget {
  @override
  _HumidityCardState createState() => _HumidityCardState();
}

class _HumidityCardState extends State<HumidityCard> {
  int humidity = 65; // Example of state being managed

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.grey[850], // Dark theme card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.water_drop, size: 40, color: Colors.blue),
              SizedBox(height: 10),
              Text('Humidity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 10),
              Text('$humidity%', style: TextStyle(fontSize: 16, color: Colors.white)),
              //SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       // Example: Updating the humidity value (simulated change)
              //       humidity = (humidity + 1) % 101; // Cycle through 0-100%
              //     });
              //   },
              //   child: Text('Update Humidity'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
