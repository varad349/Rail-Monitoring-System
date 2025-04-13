import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/widgets/stationDetails/websocket_service.dart';
import 'pages/landing.dart';
import 'pages/station_details.dart';
import 'pages/widgets/stationDetails/temperature_card.dart'; // Import temperature card
import 'pages/widgets/stationDetails/gyro_graph.dart';
import 'pages/widgets/stationDetails/accelerometer_graph.dart';
void main() {
  runApp(RailMonitoringApp());
}

class RailMonitoringApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WebSocketService('ws://192.168.236.222:81/'),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rail Monitoring System',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MonitoringStationsPage(),  // Replace with your main page
        routes: {
          '/station-details': (context) => StationDetailsPage(),
        },
      ),
    );
  }
}
