// import 'package:flutter/material.dart';
// import 'pages/landing.dart';
// import 'pages/station_details.dart'; 

// void main() {
//   runApp(RailMonitoringApp());
// }

// class RailMonitoringApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Rail Monitoring System',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MonitoringStationsPage(),
//       routes: {
//         '/station-details': (context) => StationDetailsPage(), 
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'pages/widgets/stationDetails/websocket_service.dart';  // Import the WebSocket service
// import 'pages/landing.dart';      // Import your pages
// import 'pages/station_details.dart';
// import 'pages/widgets/stationDetails/accelerometer_graph.dart';  // Import the accelerometer graph page

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => WebSocketService('ws://192.168.66.222:81/'), // Replace with your WebSocket URL
//         ),
//       ],
//       child: RailMonitoringApp(),
//     ),
//   );
// }

// class RailMonitoringApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Rail Monitoring System',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MonitoringStationsPage(),
//       routes: {
//         '/station-details': (context) => StationDetailsPage(),
//         // '/accelerometer-graph': (context) => AccelerometerGraph(),  // Add route for accelerometer graph
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'pages/widgets/stationDetails/websocket_service.dart';  // Import the WebSocket service
// import 'pages/landing.dart';      // Import your pages
// import 'pages/station_details.dart';
// import 'pages/widgets/stationDetails/accelerometer_graph.dart';  // Import the accelerometer graph page // Import the acoustic graph

// void main() {
//   runApp(RailMonitoringApp());
// }

// class RailMonitoringApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => WebSocketService('ws://192.168.66.222:81/'),  // Pass the WebSocket URL as a string
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Rail Monitoring System',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: MonitoringStationsPage(),  // Replace with your main page
//         routes: {
//           '/station-details': (context) => StationDetailsPage(),
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'pages/widgets/stationDetails/websocket_service.dart';
// import 'pages/landing.dart';
// import 'pages/station_details.dart';
// import 'pages/widgets/stationDetails/gyro_graph.dart';

// void main() {
//   runApp(RailMonitoringApp());
// }

// class RailMonitoringApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => WebSocketService('ws://192.168.66.222:81/'),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Rail Monitoring System',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: MonitoringStationsPage(),
//         routes: {
//           '/station-details': (context) => StationDetailsPage(),
//         },
//       ),
//     );
//   }
// }

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
