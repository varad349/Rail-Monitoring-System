import 'package:flutter/material.dart';

class TemperatureCard extends StatefulWidget {
  @override
  _TemperatureCardState createState() => _TemperatureCardState();
}

class _TemperatureCardState extends State<TemperatureCard> {
  int temperature = 24; // Initial temperature value

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
              Icon(Icons.thermostat_outlined, size: 40, color: Colors.red),
              SizedBox(height: 10),
              Text('Temperature', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 10),
              Text('$temperature°C', style: TextStyle(fontSize: 16, color: Colors.white)),
              // SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       // Example: Updating the temperature value (you can replace this logic with API data)
              //       temperature = (temperature + 1) % 40; // Just an example to simulate change
              //     });
              //   },
              //   child: Text('Increase Temperature'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
