import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:fl_chart/fl_chart.dart';  // Add this for colorful graphs
import 'widgets/station_map.dart';  // Import the custom map widget
import 'widgets/stationDetails/temperature_card.dart'; 
import 'widgets/stationDetails/humidity_card.dart'; 
import 'widgets/stationDetails/accelerometer_graph.dart'; 
import 'widgets/stationDetails/acoustic_sound_graph.dart';
import 'widgets/status_card.dart'; // Import the StatusCard widget

class StationDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String stationName = ModalRoute.of(context)?.settings.arguments as String;

    // Hardcoded location for the map using random coordinates
    final LatLng stationLocation = LatLng(12.8406, 80.1534); // Example: Eiffel Tower coordinates

    // Example status: true for working properly, false for anomaly
    final bool isWorkingProperly = false; // You can update this based on your logic

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$stationName Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black87, // Dark-themed app bar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Custom color for back button
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      backgroundColor: Colors.black, 
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),

            // First Row: Temperature and Humidity
            Row(
              children: [
                TemperatureCard(),
                SizedBox(width: 10),
                HumidityCard(),
              ],
            ),
            SizedBox(height: 20),

            // Status Card
            StatusCard(isWorkingProperly: isWorkingProperly),
            SizedBox(height: 20),

            AccelerometerGraph(),
            SizedBox(height: 20),

            // Acoustic Sound Graph
            AcousticSoundGraph(),
            SizedBox(height: 20),

            // "Station Location" text before the map widget
            Text(
              'Station Location',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),

            // Map Widget
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey[800]!),
              ),
              child: StationMap(stationLocation: stationLocation),  // Custom map widget
            ),
          ],
        ),
      ),
    );
  }
}
