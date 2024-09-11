// import 'package:flutter/material.dart';

// class TemperatureCard extends StatefulWidget {
//   @override
//   _TemperatureCardState createState() => _TemperatureCardState();
// }

// class _TemperatureCardState extends State<TemperatureCard> {
//   int temperature = 24; // Initial temperature value

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Card(
//         color: Colors.grey[850], // Dark theme card
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 5,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Icon(Icons.thermostat_outlined, size: 40, color: Colors.red),
//               SizedBox(height: 10),
//               Text('Temperature', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//               SizedBox(height: 10),
//               Text('$temperature°C', style: TextStyle(fontSize: 16, color: Colors.white)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'websocket_service.dart'; // Adjust the import as needed

class TemperatureCard extends StatelessWidget {
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
              
              // Use Consumer to get the temperature and ensure updates
              Consumer<WebSocketService>(
                builder: (context, webSocketService, child) {
                  // Format temperature with two decimal points
                  final temperature = webSocketService.temperature;
                  return Text(
                    '${temperature.toStringAsFixed(2)}°C',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
