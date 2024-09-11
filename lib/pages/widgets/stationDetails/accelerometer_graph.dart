// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'dart:math';

// class AccelerometerGraph extends StatefulWidget {
//   @override
//   _AccelerometerGraphState createState() => _AccelerometerGraphState();
// }

// class _AccelerometerGraphState extends State<AccelerometerGraph> {
//   final List<FlSpot> _xSpots = [];
//   final List<FlSpot> _ySpots = [];
//   final List<FlSpot> _zSpots = [];
//   double _time = 0;
//   int _index = 0;
//   late Timer _timer;

//   // Generate non-linear data points
//   final List<double> _xValues = List.generate(100, (index) => sin(index * 0.1) * 0.5);
//   final List<double> _yValues = List.generate(100, (index) => cos(index * 0.1) * 0.5);
//   final List<double> _zValues = List.generate(100, (index) => sin(index * 0.1) * cos(index * 0.1) * 0.5);

//   @override
//   void initState() {
//     super.initState();

//     // Simulate periodic updates every 100 milliseconds
//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       setState(() {
//         _time += 0.1; // Increment time
//         _index = (_index + 1) % 100; // Cycle through predefined values
//         _xSpots.add(FlSpot(_time, _xValues[_index]));
//         _ySpots.add(FlSpot(_time, _yValues[_index]));
//         _zSpots.add(FlSpot(_time, _zValues[_index]));

//         // Optionally, maintain a maximum size for the list
//         if (_xSpots.length > 100) {
//           _xSpots.removeAt(0);
//           _ySpots.removeAt(0);
//           _zSpots.removeAt(0);
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
//             Text('Accelerometer (X-Y-Z Coordinates)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
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
//                       interval: 0.5,
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
//                   minY: -1,
//                   maxY: 1,
//                   lineBarsData: [
//                     LineChartBarData(
//                       spots: _xSpots,
//                       isCurved: true,
//                       colors: [Colors.red],
//                       barWidth: 4,
//                       isStrokeCapRound: true,
//                       dotData: FlDotData(show: false),
//                     ),
//                     LineChartBarData(
//                       spots: _ySpots,
//                       isCurved: true,
//                       colors: [Colors.blue],
//                       barWidth: 4,
//                       isStrokeCapRound: true,
//                       dotData: FlDotData(show: false),
//                     ),
//                     LineChartBarData(
//                       spots: _zSpots,
//                       isCurved: true,
//                       colors: [Colors.green],
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
// import 'websocket_service.dart'; // Import the WebSocket service

// class AccelerometerGraph extends StatefulWidget {
//   @override
//   _AccelerometerGraphState createState() => _AccelerometerGraphState();
// }

// class _AccelerometerGraphState extends State<AccelerometerGraph> {
//   final List<FlSpot> _xSpots = [];
//   final List<FlSpot> _ySpots = [];
//   final List<FlSpot> _zSpots = [];
//   double _time = 0;
//   int _index = 0;
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();

//     // Simulate periodic updates every 100 milliseconds
//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       final webSocketService = Provider.of<WebSocketService>(context, listen: false);
//       setState(() {
//         _time += 0.1; // Increment time
//         _xSpots.add(FlSpot(_time, webSocketService.accelX));
//         _ySpots.add(FlSpot(_time, webSocketService.accelY));
//         _zSpots.add(FlSpot(_time, webSocketService.accelZ));

//         // Optionally, maintain a maximum size for the list
//         if (_xSpots.length > 100) {
//           _xSpots.removeAt(0);
//           _ySpots.removeAt(0);
//           _zSpots.removeAt(0);
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<WebSocketService>(
//       builder: (context, webSocketService, child) {
//         return Card(
//           color: Colors.grey[850],
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 5,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Accelerometer (X-Y-Z Coordinates)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//                 SizedBox(height: 20),
//                 SizedBox(
//                   height: 200,
//                   child: LineChart(
//                     LineChartData(
//                       gridData: FlGridData(
//                         show: true,
//                         getDrawingHorizontalLine: (value) {
//                           return FlLine(
//                             color: Colors.white12,
//                             strokeWidth: 1,
//                           );
//                         },
//                         getDrawingVerticalLine: (value) {
//                           return FlLine(
//                             color: Colors.white12,
//                             strokeWidth: 1,
//                           );
//                         },
//                       ),
//                       titlesData: FlTitlesData(
//                         show: true,
//                         leftTitles: SideTitles(
//                           showTitles: true,
//                           reservedSize: 40,
//                           getTextStyles: (context, value) =>
//                               const TextStyle(color: Colors.white, fontSize: 12),
//                           interval: 0.5,
//                         ),
//                         bottomTitles: SideTitles(
//                           showTitles: true,
//                           getTextStyles: (context, value) =>
//                               const TextStyle(color: Colors.white, fontSize: 12),
//                           interval: 2,
//                         ),
//                         topTitles: SideTitles(showTitles: false),
//                         rightTitles: SideTitles(showTitles: false),
//                       ),
//                       borderData: FlBorderData(
//                         show: true,
//                         border: Border.all(color: Colors.white10),
//                       ),
//                       minX: _time - 10,
//                       maxX: _time,
//                       minY: -1,
//                       maxY: 1,
//                       lineBarsData: [
//                         LineChartBarData(
//                           spots: _xSpots,
//                           isCurved: true,
//                           colors: [Colors.red],
//                           barWidth: 4,
//                           isStrokeCapRound: true,
//                           dotData: FlDotData(show: false),
//                         ),
//                         LineChartBarData(
//                           spots: _ySpots,
//                           isCurved: true,
//                           colors: [Colors.blue],
//                           barWidth: 4,
//                           isStrokeCapRound: true,
//                           dotData: FlDotData(show: false),
//                         ),
//                         LineChartBarData(
//                           spots: _zSpots,
//                           isCurved: true,
//                           colors: [Colors.green],
//                           barWidth: 4,
//                           isStrokeCapRound: true,
//                           dotData: FlDotData(show: false),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
// }

//above was getting out of scale result adjusting it below

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:provider/provider.dart';
// import 'websocket_service.dart'; // Import the WebSocket service

// class AccelerometerGraph extends StatefulWidget {
//   @override
//   _AccelerometerGraphState createState() => _AccelerometerGraphState();
// }
// class _AccelerometerGraphState extends State<AccelerometerGraph> {
//   final List<FlSpot> _xSpots = [];
//   final List<FlSpot> _ySpots = [];
//   final List<FlSpot> _zSpots = [];
//   double _time = 0;
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();

//     // Simulate periodic updates every 100 milliseconds
//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       final webSocketService = Provider.of<WebSocketService>(context, listen: false);
//       setState(() {
//         _time += 0.1; // Increment time
//         _xSpots.add(FlSpot(_time, webSocketService.accelX));
//         _ySpots.add(FlSpot(_time, webSocketService.accelY));
//         _zSpots.add(FlSpot(_time, webSocketService.accelZ));

//         // Optionally, maintain a maximum size for the list
//         if (_xSpots.length > 100) {
//           _xSpots.removeAt(0);
//           _ySpots.removeAt(0);
//           _zSpots.removeAt(0);
//         }
//       });
//     });
//   }

//   double _findMinY() {
//     final allSpots = [..._xSpots, ..._ySpots, ..._zSpots];
//     if (allSpots.isEmpty) return -1;
//     return allSpots.map((spot) => spot.y).reduce((value, element) => value < element ? value : element);
//   }

//   double _findMaxY() {
//     final allSpots = [..._xSpots, ..._ySpots, ..._zSpots];
//     if (allSpots.isEmpty) return 1;
//     return allSpots.map((spot) => spot.y).reduce((value, element) => value > element ? value : element);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<WebSocketService>(
//       builder: (context, webSocketService, child) {
//         final minY = _findMinY();
//         final maxY = _findMaxY();

//         return Card(
//           color: Colors.grey[850],
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 5,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Accelerometer (X-Y-Z Coordinates)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//                 SizedBox(height: 20),
//                 SizedBox(
//                   height: 200,
//                   child: LineChart(
//                     LineChartData(
//                       gridData: FlGridData(
//                         show: true,
//                         getDrawingHorizontalLine: (value) {
//                           return FlLine(
//                             color: Colors.white12,
//                             strokeWidth: 1,
//                           );
//                         },
//                         getDrawingVerticalLine: (value) {
//                           return FlLine(
//                             color: Colors.white12,
//                             strokeWidth: 1,
//                           );
//                         },
//                       ),
//                       titlesData: FlTitlesData(
//                         show: true,
//                         leftTitles: SideTitles(
//                           showTitles: true,
//                           reservedSize: 40,
//                           getTextStyles: (context, value) =>
//                               const TextStyle(color: Colors.white, fontSize: 12),
//                           interval: 0.5,
//                         ),
//                         bottomTitles: SideTitles(
//                           showTitles: true,
//                           getTextStyles: (context, value) =>
//                               const TextStyle(color: Colors.white, fontSize: 12),
//                           interval: 2,
//                         ),
//                         topTitles: SideTitles(showTitles: false),
//                         rightTitles: SideTitles(showTitles: false),
//                       ),
//                       borderData: FlBorderData(
//                         show: true,
//                         border: Border.all(color: Colors.white10),
//                       ),
//                       minX: _time - 10,
//                       maxX: _time,
//                       minY: minY, // Set the dynamic minY
//                       maxY: maxY, // Set the dynamic maxY
//                       lineBarsData: [
//                         LineChartBarData(
//                           spots: _xSpots,
//                           isCurved: true,
//                           colors: [Colors.red],
//                           barWidth: 4,
//                           isStrokeCapRound: true,
//                           dotData: FlDotData(show: false),
//                         ),
//                         LineChartBarData(
//                           spots: _ySpots,
//                           isCurved: true,
//                           colors: [Colors.blue],
//                           barWidth: 4,
//                           isStrokeCapRound: true,
//                           dotData: FlDotData(show: false),
//                         ),
//                         LineChartBarData(
//                           spots: _zSpots,
//                           isCurved: true,
//                           colors: [Colors.green],
//                           barWidth: 4,
//                           isStrokeCapRound: true,
//                           dotData: FlDotData(show: false),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
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
// import 'websocket_service.dart'; // Import the WebSocket service

// class AccelerometerGraph extends StatefulWidget {
//   @override
//   _AccelerometerGraphState createState() => _AccelerometerGraphState();
// }

// class _AccelerometerGraphState extends State<AccelerometerGraph> {
//   final List<FlSpot> _xSpots = [];
//   final List<FlSpot> _ySpots = [];
//   final List<FlSpot> _zSpots = [];
//   double _time = 0;
//   Timer? _timer; // Made nullable for proper disposal

//   @override
//   void initState() {
//     super.initState();

//     // Simulate periodic updates every 100 milliseconds
//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       final webSocketService = Provider.of<WebSocketService>(context, listen: false);

//       setState(() {
//         _time += 0.1; // Increment time

//         // Ensure that null values are handled
//         final accelX = webSocketService.accelX ?? 0.0; // Default to 0.0 if null
//         final accelY = webSocketService.accelY ?? 0.0; // Default to 0.0 if null
//         final accelZ = webSocketService.accelZ ?? 0.0; // Default to 0.0 if null

//         _xSpots.add(FlSpot(_time, accelX));
//         _ySpots.add(FlSpot(_time, accelY));
//         _zSpots.add(FlSpot(_time, accelZ));

//         // Optionally, maintain a maximum size for the list
//         if (_xSpots.length > 100) {
//           _xSpots.removeAt(0);
//           _ySpots.removeAt(0);
//           _zSpots.removeAt(0);
//         }
//       });
//     });
//   }

//   // Safeguard for empty lists
//   double _findMinY() {
//     if (_xSpots.isEmpty && _ySpots.isEmpty && _zSpots.isEmpty) {
//       return -1; // Default value when no data
//     }
//     final allSpots = [..._xSpots, ..._ySpots, ..._zSpots];
//     return allSpots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b);
//   }

//   // Safeguard for empty lists
//   double _findMaxY() {
//     if (_xSpots.isEmpty && _ySpots.isEmpty && _zSpots.isEmpty) {
//       return 1; // Default value when no data
//     }
//     final allSpots = [..._xSpots, ..._ySpots, ..._zSpots];
//     return allSpots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<WebSocketService>(
//       builder: (context, webSocketService, child) {
//         final minY = _findMinY();
//         final maxY = _findMaxY();

//         return Card(
//           color: Colors.grey[850],
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 5,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Accelerometer (X-Y-Z Coordinates)',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//                 SizedBox(height: 20),
//                 SizedBox(
//                   height: 200,
//                   child: LineChart(
//                     LineChartData(
//                       gridData: FlGridData(
//                         show: true,
//                         getDrawingHorizontalLine: (value) {
//                           return FlLine(
//                             color: Colors.white12,
//                             strokeWidth: 1,
//                           );
//                         },
//                         getDrawingVerticalLine: (value) {
//                           return FlLine(
//                             color: Colors.white12,
//                             strokeWidth: 1,
//                           );
//                         },
//                       ),
//                       titlesData: FlTitlesData(
//                         show: true,
//                         leftTitles: SideTitles(
//                           showTitles: true,
//                           reservedSize: 40,
//                           getTextStyles: (context, value) =>
//                               const TextStyle(color: Colors.white, fontSize: 12),
//                           interval: 0.5,
//                         ),
//                         bottomTitles: SideTitles(
//                           showTitles: true,
//                           getTextStyles: (context, value) =>
//                               const TextStyle(color: Colors.white, fontSize: 12),
//                           interval: 2,
//                         ),
//                         topTitles: SideTitles(showTitles: false),
//                         rightTitles: SideTitles(showTitles: false),
//                       ),
//                       borderData: FlBorderData(
//                         show: true,
//                         border: Border.all(color: Colors.white10),
//                       ),
//                       minX: _time - 10,
//                       maxX: _time,
//                       minY: minY-40, // Set the dynamic minY
//                       maxY: maxY+40, // Set the dynamic maxY
//                       lineBarsData: [
//                         LineChartBarData(
//                           spots: _xSpots,
//                           isCurved: true,
//                           colors: [Colors.red],
//                           barWidth: 4,
//                           isStrokeCapRound: true,
//                           dotData: FlDotData(show: false),
//                         ),
//                         LineChartBarData(
//                           spots: _ySpots,
//                           isCurved: true,
//                           colors: [Colors.blue],
//                           barWidth: 4,
//                           isStrokeCapRound: true,
//                           dotData: FlDotData(show: false),
//                         ),
//                         LineChartBarData(
//                           spots: _zSpots,
//                           isCurved: true,
//                           colors: [Colors.green],
//                           barWidth: 4,
//                           isStrokeCapRound: true,
//                           dotData: FlDotData(show: false),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _timer?.cancel(); // Safely cancel the timer if it's active
//     super.dispose();
//   }
// }
//updated auto scaling


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'websocket_service.dart'; // Import the WebSocket service

class AccelerometerGraph extends StatefulWidget {
  @override
  _AccelerometerGraphState createState() => _AccelerometerGraphState();
}

class _AccelerometerGraphState extends State<AccelerometerGraph> {
  final List<FlSpot> _xSpots = [];
  final List<FlSpot> _ySpots = [];
  final List<FlSpot> _zSpots = [];
  double _time = 0;
  Timer? _timer; // Made nullable for proper disposal

  @override
  void initState() {
    super.initState();

    // Simulate periodic updates every 100 milliseconds
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      final webSocketService = Provider.of<WebSocketService>(context, listen: false);

      setState(() {
        _time += 0.1; // Increment time

        // Ensure that null values are handled
        final accelX = webSocketService.accelX ?? 0.0; // Default to 0.0 if null
        final accelY = webSocketService.accelY ?? 0.0; // Default to 0.0 if null
        final accelZ = webSocketService.accelZ ?? 0.0; // Default to 0.0 if null

        _xSpots.add(FlSpot(_time, accelX));
        _ySpots.add(FlSpot(_time, accelY));
        _zSpots.add(FlSpot(_time, accelZ));

        // Optionally, maintain a maximum size for the list
        if (_xSpots.length > 100) {
          _xSpots.removeAt(0);
          _ySpots.removeAt(0);
          _zSpots.removeAt(0);
        }
      });
    });
  }

  // Safeguard for empty lists
  double _findMinY() {
    if (_xSpots.isEmpty && _ySpots.isEmpty && _zSpots.isEmpty) {
      return -1; // Default value when no data
    }
    final allSpots = [..._xSpots, ..._ySpots, ..._zSpots];
    return allSpots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b);
  }

  // Safeguard for empty lists
  double _findMaxY() {
    if (_xSpots.isEmpty && _ySpots.isEmpty && _zSpots.isEmpty) {
      return 1; // Default value when no data
    }
    final allSpots = [..._xSpots, ..._ySpots, ..._zSpots];
    return allSpots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);
  }

  double _calculateMargin(double minY, double maxY) {
    final range = maxY - minY;
    return range * 0.1; // Set margin to 10% of the range
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WebSocketService>(
      builder: (context, webSocketService, child) {
        final minY = _findMinY();
        final maxY = _findMaxY();
        final margin = _calculateMargin(minY, maxY);

        return Card(
          color: Colors.grey[850],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Accelerometer (X-Y-Z Coordinates)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
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
                          interval: (maxY - minY) / 5, // Dynamically calculate interval
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
                      minY: minY - margin, // Dynamically calculate minY with margin
                      maxY: maxY + margin, // Dynamically calculate maxY with margin
                      lineBarsData: [
                        LineChartBarData(
                          spots: _xSpots,
                          isCurved: true,
                          colors: [Colors.red],
                          barWidth: 4,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                        ),
                        LineChartBarData(
                          spots: _ySpots,
                          isCurved: true,
                          colors: [Colors.blue],
                          barWidth: 4,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                        ),
                        LineChartBarData(
                          spots: _zSpots,
                          isCurved: true,
                          colors: [Colors.green],
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
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Safely cancel the timer if it's active
    super.dispose();
  }
}
