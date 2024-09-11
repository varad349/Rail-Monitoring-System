// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:gauge_indicator/gauge_indicator.dart';
// import 'dart:math';

// class GyroscopeGauge extends StatefulWidget {
//   @override
//   _GyroscopeGaugeState createState() => _GyroscopeGaugeState();
// }

// class _GyroscopeGaugeState extends State<GyroscopeGauge> {
//   double _xDegree = 0;
//   double _yDegree = 0;
//   double _zDegree = 0;
//   int _index = 0;
//   late Timer _timer;

//   // Simulate gyroscope degree values
//   final List<double> _xValues = List.generate(100, (index) => sin(index * 0.1) * 90);
//   final List<double> _yValues = List.generate(100, (index) => cos(index * 0.1) * 90);
//   final List<double> _zValues = List.generate(100, (index) => sin(index * 0.1) * cos(index * 0.1) * 90);

//   @override
//   void initState() {
//     super.initState();

//     // Simulate periodic updates every 100 milliseconds
//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       setState(() {
//         _index = (_index + 1) % 100;
//         _xDegree = _xValues[_index];
//         _yDegree = _yValues[_index];
//         _zDegree = _zValues[_index];
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
//             Text(
//               'Gyroscope Degree (X-Y-Z Axes)',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildGauge('X Axis', _xDegree, Colors.red),
//                 _buildGauge('Y Axis', _yDegree, Colors.blue),
//                 _buildGauge('Z Axis', _zDegree, Colors.green),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildGauge(String axisLabel, double degree, Color color) {
//     return Column(
//       children: [
//         Text(axisLabel, style: TextStyle(color: Colors.white, fontSize: 16)),
//         SizedBox(
//           width: 120,
//           height: 120,
//           child: AnimatedRadialGauge(
//             duration: const Duration(milliseconds: 500),
//             curve: Curves.easeInOut,
//             radius: 60,
//             value: (degree + 90).clamp(0.0, 180.0), // Ensure value is within range
//             axis: GaugeAxis(
//               min: 0,
//               max: 180,
//               degrees: 180,
//               style: GaugeAxisStyle(
//                 thickness: 20,
//                 background: Colors.grey[700]!,
//                 segmentSpacing: 4,
//               ),
//               pointer: GaugePointer.needle(
//                 width: 16,
//                 height: 60,
//                 color: color,
//               ),
//               progressBar: GaugeProgressBar.rounded(
//                 color: color.withOpacity(0.3),
//               ),
//               segments: [
//                 GaugeSegment(
//                   from: 0,
//                   to: 60,
//                   color: color.withOpacity(0.3),
//                   cornerRadius: Radius.zero,
//                 ),
//                 GaugeSegment(
//                   from: 60,
//                   to: 120,
//                   color: color.withOpacity(0.6),
//                   cornerRadius: Radius.zero,
//                 ),
//                 GaugeSegment(
//                   from: 120,
//                   to: 180,
//                   color: color,
//                   cornerRadius: Radius.zero,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
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
// import 'package:gauge_indicator/gauge_indicator.dart';
// import 'dart:math';

// class GyroscopeGauge extends StatefulWidget {
//   @override
//   _GyroscopeGaugeState createState() => _GyroscopeGaugeState();
// }

// class _GyroscopeGaugeState extends State<GyroscopeGauge> {
//   double _xDegree = 0;
//   double _yDegree = 0;
//   double _zDegree = 0;
//   int _index = 0;
//   late Timer _timer;

//   // Simulate gyroscope degree values
//   final List<double> _xValues = List.generate(100, (index) => sin(index * 0.1) * 90);
//   final List<double> _yValues = List.generate(100, (index) => cos(index * 0.1) * 90);
//   final List<double> _zValues = List.generate(100, (index) => sin(index * 0.1) * cos(index * 0.1) * 90);

//   @override
//   void initState() {
//     super.initState();

//     // Simulate periodic updates every 100 milliseconds
//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       setState(() {
//         _index = (_index + 1) % 100;
//         _xDegree = _xValues[_index];
//         _yDegree = _yValues[_index];
//         _zDegree = _zValues[_index];
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
//             Text(
//               'Gyroscope Degree (X-Y-Z Axes)',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildGauge('X Axis', _xDegree, Colors.red),
//                 _buildGauge('Y Axis', _yDegree, Colors.blue),
//                 _buildGauge('Z Axis', _zDegree, Colors.green),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildGauge(String axisLabel, double degree, Color color) {
//     return Column(
//       children: [
//         Text(axisLabel, style: TextStyle(color: Colors.white, fontSize: 16)),
//         SizedBox(
//           width: 120,
//           height: 120,
//           child: RadialGauge(
//             value: (degree + 90).clamp(0.0, 180.0), // Ensure value is within range
//             axis: GaugeAxis(
//               min: 0,
//               max: 180,
//               degrees: 180,
//               style: GaugeAxisStyle(
//                 thickness: 20,
//                 background: Colors.grey[700]!,
//                 segmentSpacing: 4,
//               ),
//               pointer: GaugePointer.needle(
//                 width: 8,
//                 height: 60,
//                 color: color,
//               ),
//               progressBar: GaugeProgressBar.rounded(
//                 color: Colors.transparent, // Make progress bar invisible
//               ),
//               segments: [
//                 GaugeSegment(
//                   from: 0,
//                   to: 180, // Full range
//                   color: Colors.transparent, // Ensure segments are transparent
//                   cornerRadius: Radius.zero,
//                 ),
//               ],
//             ),
//             child: Center(
//               child: Text(
//                 '${degree.toStringAsFixed(1)}°',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:gauge_indicator/gauge_indicator.dart';
// import 'package:provider/provider.dart';
// import 'websocket_service.dart';  // Adjust the import as needed

// class GyroscopeGauge extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Get the gyroscope data from the WebSocketService provider
//     final webSocketService = Provider.of<WebSocketService>(context);

//     return Card(
//       color: Colors.grey[850],
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Gyroscope Degree (X-Y-Z Axes)',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildGauge('X Axis', webSocketService.gyroX, Colors.red),
//                 _buildGauge('Y Axis', webSocketService.gyroY, Colors.blue),
//                 _buildGauge('Z Axis', webSocketService.gyroZ, Colors.green),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildGauge(String axisLabel, double degree, Color color) {
//     return Column(
//       children: [
//         Text(axisLabel, style: TextStyle(color: Colors.white, fontSize: 16)),
//         SizedBox(
//           width: 120,
//           height: 120,
//           child: RadialGauge(
//             value: (degree + 90).clamp(0.0, 180.0), // Ensure value is within range
//             axis: GaugeAxis(
//               min: 0,
//               max: 180,
//               degrees: 180,
//               style: GaugeAxisStyle(
//                 thickness: 20,
//                 background: Colors.grey[700]!,
//                 segmentSpacing: 4,
//               ),
//               pointer: GaugePointer.needle(
//                 width: 8,
//                 height: 60,
//                 color: color,
//               ),
//               progressBar: GaugeProgressBar.rounded(
//                 color: Colors.transparent, // Make progress bar invisible
//               ),
//               segments: [
//                 GaugeSegment(
//                   from: 0,
//                   to: 180, // Full range
//                   color: Colors.transparent, // Ensure segments are transparent
//                   cornerRadius: Radius.zero,
//                 ),
//               ],
//             ),
//             child: Center(
//               child: Text(
//                 '${degree.toStringAsFixed(1)}°',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;  // Import for mathematical constants and functions
import 'websocket_service.dart';  // Adjust the import as needed

class GyroscopeGauge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the gyroscope data from the WebSocketService provider
    final webSocketService = Provider.of<WebSocketService>(context);

    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gyroscope Degree (X-Y-Z Axes)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildGauge('X Axis', webSocketService.gyroX, Colors.red),
                _buildGauge('Y Axis', webSocketService.gyroY, Colors.blue),
                _buildGauge('Z Axis', webSocketService.gyroZ, Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGauge(String axisLabel, double radianValue, Color color) {
    // Convert radian to degrees
    double degreeValue = radianValue * (180 / math.pi);

    return Column(
      children: [
        Text(axisLabel, style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(
          width: 120,
          height: 120,
          child: RadialGauge(
            value: (degreeValue + 90).clamp(0.0, 180.0), // Ensure value is within range
            axis: GaugeAxis(
              min: 0,
              max: 180,
              degrees: 180,
              style: GaugeAxisStyle(
                thickness: 20,
                background: Colors.grey[700]!,
                segmentSpacing: 4,
              ),
              pointer: GaugePointer.needle(
                width: 8,
                height: 60,
                color: color,
              ),
              progressBar: GaugeProgressBar.rounded(
                color: Colors.transparent, // Make progress bar invisible
              ),
              segments: [
                GaugeSegment(
                  from: 0,
                  to: 180, // Full range
                  color: Colors.transparent, // Ensure segments are transparent
                  cornerRadius: Radius.zero,
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${degreeValue.toStringAsFixed(1)}°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
