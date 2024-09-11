// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'dart:math';

// class AcousticSoundGraph extends StatefulWidget {
//   @override
//   _AcousticSoundGraphState createState() => _AcousticSoundGraphState();
// }

// class _AcousticSoundGraphState extends State<AcousticSoundGraph> {
//   final List<FlSpot> _spots = [];
//   double _time = 0;
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();

//     // Simulate periodic updates every 100 milliseconds
//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       setState(() {
//         _time += 0.1; // Increment time
//         // Generate non-linear waveform data
//         double value = sin(_time * 2 * pi * 0.1) * 5 + 5;
//         _spots.add(FlSpot(_time, value));

//         // Optionally, maintain a maximum size for the list
//         if (_spots.length > 100) {
//           _spots.removeAt(0);
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.grey[850],
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Acoustic Sound', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//             SizedBox(height: 20),
//             SizedBox(
//               height: 200,
//               child: LineChart(
//                 LineChartData(
//                   gridData: FlGridData(
//                     show: true,
//                     getDrawingHorizontalLine: (value) {
//                       return FlLine(
//                         color: Colors.white12,
//                         strokeWidth: 1,
//                       );
//                     },
//                     getDrawingVerticalLine: (value) {
//                       return FlLine(
//                         color: Colors.white12,
//                         strokeWidth: 1,
//                       );
//                     },
//                   ),
//                   titlesData: FlTitlesData(
//                     show: true,
//                     leftTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 40,
//                       getTextStyles: (context, value) =>
//                           const TextStyle(color: Colors.white, fontSize: 12),
//                       interval: 1,
//                     ),
//                     bottomTitles: SideTitles(
//                       showTitles: true,
//                       getTextStyles: (context, value) =>
//                           const TextStyle(color: Colors.white, fontSize: 12),
//                       interval: 2,
//                     ),
//                     topTitles: SideTitles(showTitles: false),
//                     rightTitles: SideTitles(showTitles: false),
//                   ),
//                   borderData: FlBorderData(
//                     show: true,
//                     border: Border.all(color: Colors.white10),
//                   ),
//                   minX: _time - 10,
//                   maxX: _time,
//                   minY: 0,
//                   maxY: 10,
//                   lineBarsData: [
//                     LineChartBarData(
//                       spots: _spots,
//                       isCurved: true,
//                       colors: [Colors.orange],
//                       barWidth: 4,
//                       isStrokeCapRound: true,
//                       dotData: FlDotData(show: false),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:provider/provider.dart';
// import 'websocket_service.dart';  // Import the WebSocket service

// class AcousticSoundGraph extends StatefulWidget {
//   @override
//   _AcousticSoundGraphState createState() => _AcousticSoundGraphState();
// }

// class _AcousticSoundGraphState extends State<AcousticSoundGraph> {
//   final List<FlSpot> _spots = [];
//   double _time = 0;
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();

//     // Simulate periodic updates every 100 milliseconds
//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       setState(() {
//         _time += 0.1; // Increment time

//         // Get the current value from WebSocketService
//         final acousticSound = Provider.of<WebSocketService>(context, listen: false).acousticSound;

//         _spots.add(FlSpot(_time, acousticSound));

//         // Optionally, maintain a maximum size for the list
//         if (_spots.length > 100) {
//           _spots.removeAt(0);
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.grey[850],
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Acoustic Sound', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//             SizedBox(height: 20),
//             SizedBox(
//               height: 200,
//               child: LineChart(
//                 LineChartData(
//                   gridData: FlGridData(
//                     show: true,
//                     getDrawingHorizontalLine: (value) {
//                       return FlLine(
//                         color: Colors.white12,
//                         strokeWidth: 1,
//                       );
//                     },
//                     getDrawingVerticalLine: (value) {
//                       return FlLine(
//                         color: Colors.white12,
//                         strokeWidth: 1,
//                       );
//                     },
//                   ),
//                   titlesData: FlTitlesData(
//                     show: true,
//                     leftTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 40,
//                       getTextStyles: (context, value) =>
//                           const TextStyle(color: Colors.white, fontSize: 12),
//                       interval: 1,
//                     ),
//                     bottomTitles: SideTitles(
//                       showTitles: true,
//                       getTextStyles: (context, value) =>
//                           const TextStyle(color: Colors.white, fontSize: 12),
//                       interval: 2,
//                     ),
//                     topTitles: SideTitles(showTitles: false),
//                     rightTitles: SideTitles(showTitles: false),
//                   ),
//                   borderData: FlBorderData(
//                     show: true,
//                     border: Border.all(color: Colors.white10),
//                   ),
//                   minX: _time - 10,
//                   maxX: _time,
//                   minY: 0,
//                   maxY: 10,
//                   lineBarsData: [
//                     LineChartBarData(
//                       spots: _spots,
//                       isCurved: true,
//                       colors: [Colors.orange],
//                       barWidth: 4,
//                       isStrokeCapRound: true,
//                       dotData: FlDotData(show: false),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
// }


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:provider/provider.dart';
// import 'websocket_service.dart';  // Import the WebSocket service

// class AcousticSoundGraph extends StatefulWidget {
//   @override
//   _AcousticSoundGraphState createState() => _AcousticSoundGraphState();
// }

// class _AcousticSoundGraphState extends State<AcousticSoundGraph> {
//   final List<FlSpot> _spots = [];
//   double _time = 0;
//   double _maxY = 10; // Initialize with a default value
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();

//     // Simulate periodic updates every 100 milliseconds
//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       setState(() {
//         _time += 0.1; // Increment time

//         // Get the current value from WebSocketService
//         final acousticSound = Provider.of<WebSocketService>(context, listen: false).acousticSound;

//         // Normalize or adjust the acoustic sound value
//         double normalizedSound = acousticSound.clamp(0.0, 10.0); // Clamp to 0-10 range

//         _spots.add(FlSpot(_time, normalizedSound));

//         // Maintain a maximum size for the list
//         if (_spots.length > 100) {
//           _spots.removeAt(0);
//         }

//         // Update the maxY value based on the current maximum spot value
//         double currentMaxY = _spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);
//         _maxY = currentMaxY + 1; // Add a margin to ensure the line fits well in the chart
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.grey[850],
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Acoustic Sound', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//             SizedBox(height: 20),
//             SizedBox(
//               height: 200,
//               child: LineChart(
//                 LineChartData(
//                   gridData: FlGridData(
//                     show: true,
//                     getDrawingHorizontalLine: (value) {
//                       return FlLine(
//                         color: Colors.white12,
//                         strokeWidth: 1,
//                       );
//                     },
//                     getDrawingVerticalLine: (value) {
//                       return FlLine(
//                         color: Colors.white12,
//                         strokeWidth: 1,
//                       );
//                     },
//                   ),
//                   titlesData: FlTitlesData(
//                     show: true,
//                     leftTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 40,
//                       getTextStyles: (context, value) =>
//                           const TextStyle(color: Colors.white, fontSize: 12),
//                       interval: 1,
//                     ),
//                     bottomTitles: SideTitles(
//                       showTitles: true,
//                       getTextStyles: (context, value) =>
//                           const TextStyle(color: Colors.white, fontSize: 12),
//                       interval: 2,
//                     ),
//                     topTitles: SideTitles(showTitles: false),
//                     rightTitles: SideTitles(showTitles: false),
//                   ),
//                   borderData: FlBorderData(
//                     show: true,
//                     border: Border.all(color: Colors.white10),
//                   ),
//                   minX: _time - 10,
//                   maxX: _time,
//                   minY: 0,
//                   maxY: _maxY, // Dynamic maxY value
//                   lineBarsData: [
//                     LineChartBarData(
//                       spots: _spots,
//                       isCurved: true,
//                       colors: [Colors.orange],
//                       barWidth: 4,
//                       isStrokeCapRound: true,
//                       dotData: FlDotData(show: false),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
// }


//Improved accoustic values
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'websocket_service.dart';  // Import the WebSocket service

class AcousticSoundGraph extends StatefulWidget {
  @override
  _AcousticSoundGraphState createState() => _AcousticSoundGraphState();
}

class _AcousticSoundGraphState extends State<AcousticSoundGraph> {
  final List<FlSpot> _spots = [];
  double _time = 0;
  double _maxY = 10; // Initialize with a default value
  double _minY = 0; // Initialize with a default value
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Simulate periodic updates every 100 milliseconds
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _time += 0.1; // Increment time

        // Get the current value from WebSocketService
        final acousticSound = Provider.of<WebSocketService>(context, listen: false).acousticSound;

        // Normalize or adjust the acoustic sound value
        double normalizedSound = acousticSound.clamp(0.0, 10.0); // Clamp to 0-10 range

        _spots.add(FlSpot(_time, normalizedSound));

        // Maintain a maximum size for the list
        if (_spots.length > 100) {
          _spots.removeAt(0);
        }

        // Update the minY and maxY values based on the current data
        if (_spots.isNotEmpty) {
          double currentMaxY = _spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);
          double currentMinY = _spots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b);
          _maxY = currentMaxY + 1; // Add a margin to ensure the line fits well in the chart
          _minY = currentMinY - 1; // Add a margin below the minimum value
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Acoustic Sound', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.white12,
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.white12,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 12),
                      interval: (_maxY - _minY) / 5, // Adjust interval dynamically
                    ),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 12),
                      interval: 2,
                    ),
                    topTitles: SideTitles(showTitles: false),
                    rightTitles: SideTitles(showTitles: false),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.white10),
                  ),
                  minX: _time - 10,
                  maxX: _time,
                  minY: _minY, // Dynamic minY value
                  maxY: _maxY, // Dynamic maxY value
                  lineBarsData: [
                    LineChartBarData(
                      spots: _spots,
                      isCurved: true,
                      colors: [Colors.orange],
                      barWidth: 4,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
