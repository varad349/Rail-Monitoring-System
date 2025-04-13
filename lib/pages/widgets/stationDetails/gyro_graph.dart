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
    // Handle NaN values by setting them to 0
    double degreeValue = radianValue.isNaN ? 0.0 : radianValue * (180 / math.pi);

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
