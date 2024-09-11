// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class WebSocketService extends ChangeNotifier {
//   final WebSocketChannel _channel;
//   late StreamSubscription _subscription;

//   WebSocketService(String url) : _channel = WebSocketChannel.connect(Uri.parse(url)) {
//     _subscription = _channel.stream.listen((data) {
//       final parsedData = jsonDecode(data);
//       _temp = parsedData['temp'];
//       _accelX = parsedData['accel_x'];
//       _accelY = parsedData['accel_y'];
//       _accelZ = parsedData['accel_z'];
//       _gyroX = parsedData['gyro_x'];
//       _gyroY = parsedData['gyro_y'];
//       _gyroZ = parsedData['gyro_z'];
//       notifyListeners();
//     });
//   }

//   double _temp = 0.0;
//   double _accelX = 0.0;
//   double _accelY = 0.0;
//   double _accelZ = 0.0;
//   double _gyroX = 0.0;
//   double _gyroY = 0.0;
//   double _gyroZ = 0.0;

//   double get temp => _temp;
//   double get accelX => _accelX;
//   double get accelY => _accelY;
//   double get accelZ => _accelZ;
//   double get gyroX => _gyroX;
//   double get gyroY => _gyroY;
//   double get gyroZ => _gyroZ;

//   @override
//   void dispose() {
//     _subscription.cancel();
//     _channel.sink.close();
//     super.dispose();
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class WebSocketService with ChangeNotifier {
//   late WebSocketChannel channel;

//   // Gyroscope data
//   double _gyroX = 0.0, _gyroY = 0.0, _gyroZ = 0.0;

//   // Accelerometer data
//   double _accelX = 0.0, _accelY = 0.0, _accelZ = 0.0;

//   // Acoustic sound data
//   double _acousticSound = 0.0;

//   // Temperature data
//   int _temperature = 24; // Initial temperature value

//   WebSocketService(String url) {
//     channel = WebSocketChannel.connect(Uri.parse(url));

//     channel.stream.listen((data) {
//       final sensorData = json.decode(data);

//       // Update accelerometer data
//       _accelX = sensorData['accel_x'];
//       _accelY = sensorData['accel_y'];
//       _accelZ = sensorData['accel_z'];

//       // Update gyroscope data
//       _gyroX = sensorData['gyro_x'];
//       _gyroY = sensorData['gyro_y'];
//       _gyroZ = sensorData['gyro_z'];

//       // Update acoustic sound data
//       _acousticSound = sensorData['acoustic_sound'];

//       // Update temperature data
//       _temperature = sensorData['temperature']; // Assuming 'temperature' key

//       notifyListeners(); // Notify listeners to update the UI
//     });
//   }

//   // Gyroscope getters
//   double get gyroX => _gyroX;
//   double get gyroY => _gyroY;
//   double get gyroZ => _gyroZ;

//   // Accelerometer getters
//   double get accelX => _accelX;
//   double get accelY => _accelY;
//   double get accelZ => _accelZ;

//   // Acoustic sound getter
//   double get acousticSound => _acousticSound;

//   // Temperature getter
//   int get temperature => _temperature;

//   @override
//   void dispose() {
//     channel.sink.close();
//     super.dispose();
//   }
// }

// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/status.dart' as status;

// class WebSocketService with ChangeNotifier {
//   final String url;
//   WebSocketChannel? _channel;

//   // Data values
//   double _gyroX = 0.0, _gyroY = 0.0, _gyroZ = 0.0;
//   double _accelX = 0.0, _accelY = 0.0, _accelZ = 0.0;
//   double _acousticSound = 0.0;
//   int _temperature = 24;

//   // Connection states
//   bool _isConnected = false;
//   Timer? _reconnectTimer;
//   int _retryAttempts = 0;
//   final int _maxRetryAttempts = 5; // Limit the number of retries
//   final Duration _retryDelay = Duration(seconds: 5);

//   WebSocketService(this.url) {
//     _connect();
//   }

//   // WebSocket connection logic
//   void _connect() {
//     try {
//       _channel = WebSocketChannel.connect(Uri.parse(url));
//       _isConnected = true;
//       _retryAttempts = 0; // Reset retry attempts on successful connection

//       // Listen for WebSocket messages
//       _channel!.stream.listen((data) {
//         final sensorData = json.decode(data);

//         // Parse data from WebSocket
//         _accelX = sensorData['accel_x'];
//         _accelY = sensorData['accel_y'];
//         _accelZ = sensorData['accel_z'];

//         _gyroX = sensorData['gyro_x'];
//         _gyroY = sensorData['gyro_y'];
//         _gyroZ = sensorData['gyro_z'];

//         _acousticSound = sensorData['acoustic_sound'];
//         _temperature = sensorData['temp'];

//         notifyListeners();
//       }, onError: (error) {
//         print('WebSocket Error: $error');
//         _handleConnectionLoss();
//       }, onDone: () {
//         print('WebSocket Connection Closed');
//         _handleConnectionLoss();
//       });
//     } catch (e) {
//       print('WebSocket Connection Error: $e');
//       _handleConnectionLoss();
//     }
//   }

//   // Handle connection loss and retry logic
//   void _handleConnectionLoss() {
//     _isConnected = false;
//     notifyListeners(); // Notify that the connection is lost
//     _attemptReconnect();
//   }

//   // Attempt to reconnect after a delay
//   void _attemptReconnect() {
//     if (_retryAttempts < _maxRetryAttempts) {
//       _retryAttempts++;
//       _reconnectTimer?.cancel(); // Cancel any existing timers
//       _reconnectTimer = Timer(_retryDelay, () {
//         print('Attempting to reconnect... ($_retryAttempts)');
//         _connect();
//       });
//     } else {
//       print('Max retry attempts reached. Giving up.');
//       // Optionally notify user or log a message.
//     }
//   }

//   // Clean up resources and close the WebSocket
//   @override
//   void dispose() {
//     _reconnectTimer?.cancel();
//     _channel?.sink.close(status.goingAway);
//     super.dispose();
//   }

//   // Public getters for data
//   double get gyroX => _gyroX;
//   double get gyroY => _gyroY;
//   double get gyroZ => _gyroZ;
//   double get accelX => _accelX;
//   double get accelY => _accelY;
//   double get accelZ => _accelZ;
//   double get acousticSound => _acousticSound;
//   int get temperature => _temperature;
//   bool get isConnected => _isConnected;
// }

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketService with ChangeNotifier {
  final String url;
  WebSocketChannel? _channel;

  // Data values
  double _gyroX = 0.0, _gyroY = 0.0, _gyroZ = 0.0;
  double _accelX = 0.0, _accelY = 0.0, _accelZ = 0.0;
  double _acousticSound = 0.0;
  int _temperature = 24;

  // Connection states
  bool _isConnected = false;
  Timer? _reconnectTimer;
  int _retryAttempts = 0;
  final int _maxRetryAttempts = 5;
  final Duration _retryDelay = Duration(seconds: 5);

  WebSocketService(this.url) {
    _connect();
  }

  // WebSocket connection logic
  void _connect() {
    print('Attempting to connect to WebSocket at $url...');
    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _isConnected = true;
      _retryAttempts = 0; // Reset retry attempts on successful connection
      print('WebSocket connected!');

      // Listen for WebSocket messages
      _channel!.stream.listen((data) {
        try {
          final sensorData = json.decode(data);
          print('Received data: $sensorData');

          // Parse and validate data from WebSocket
          _accelX = _validateDouble(sensorData['accel_x'], 'accel_x');
          _accelY = _validateDouble(sensorData['accel_y'], 'accel_y');
          _accelZ = _validateDouble(sensorData['accel_z'], 'accel_z');

          _gyroX = _validateDouble(sensorData['gyro_x'], 'gyro_x');
          _gyroY = _validateDouble(sensorData['gyro_y'], 'gyro_y');
          _gyroZ = _validateDouble(sensorData['gyro_z'], 'gyro_z');

          _acousticSound = _validateDouble(sensorData['sound'], 'sound');
          _temperature = _validateInt(sensorData['temp'], 'temp');

          // Debug: Print values to console with types
          _debugPrintValues();

          notifyListeners(); // Notify listeners for updates
        } catch (e) {
          print('Data Parsing Error: $e');
        }
      }, onError: (error) {
        print('WebSocket Error: $error');
        _handleConnectionLoss();
      }, onDone: () {
        print('WebSocket Connection Closed');
        _handleConnectionLoss();
      });
    } catch (e) {
      print('WebSocket Connection Error: $e');
      _handleConnectionLoss();
    }
  }

  // Validate and ensure double type for the sensor data
  double _validateDouble(dynamic value, String fieldName) {
    if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble(); // Convert int to double if needed
    } else {
      print('Invalid type for $fieldName: Expected double, but got ${value.runtimeType}. Defaulting to 0.0.');
      return 0.0;
    }
  }

  // Validate and ensure int type for temperature data
  int _validateInt(dynamic value, String fieldName) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.toInt(); // Convert double to int if needed
    } else {
      print('Invalid type for $fieldName: Expected int, but got ${value.runtimeType}. Defaulting to 24.');
      return 24;
    }
  }

  // Handle connection loss and retry logic
  void _handleConnectionLoss() {
    _isConnected = false;
    notifyListeners(); // Notify listeners that the connection is lost
    print('WebSocket connection lost. Attempting to reconnect...');
    _attemptReconnect();
  }

  // Attempt to reconnect after a delay
  void _attemptReconnect() {
    if (_retryAttempts < _maxRetryAttempts) {
      _retryAttempts++;
      _reconnectTimer?.cancel(); // Cancel any existing timers
      print('Retry attempt $_retryAttempts of $_maxRetryAttempts...');
      _reconnectTimer = Timer(_retryDelay, () {
        print('Attempting to reconnect...');
        _connect();
      });
    } else {
      print('Max retry attempts reached. Giving up.');
      // Optionally notify user or log a message.
    }
  }

  // Clean up resources and close the WebSocket
  @override
  void dispose() {
    print('Closing WebSocket connection...');
    _reconnectTimer?.cancel();
    _channel?.sink.close(status.goingAway);
    print('WebSocket connection closed.');
    super.dispose();
  }

  // Public getters for data
  double get gyroX => _gyroX;
  double get gyroY => _gyroY;
  double get gyroZ => _gyroZ;
  double get accelX => _accelX;
  double get accelY => _accelY;
  double get accelZ => _accelZ;
  double get acousticSound => _acousticSound;
  int get temperature => _temperature;
  bool get isConnected => _isConnected;

  // Debug function to print current values and their types
  void _debugPrintValues() {
    print('Accelerometer: X=$_accelX (Type: ${_accelX.runtimeType}), '
        'Y=$_accelY (Type: ${_accelY.runtimeType}), '
        'Z=$_accelZ (Type: ${_accelZ.runtimeType})');
    print('Gyroscope: X=$_gyroX (Type: ${_gyroX.runtimeType}), '
        'Y=$_gyroY (Type: ${_gyroY.runtimeType}), '
        'Z=$_gyroZ (Type: ${_gyroZ.runtimeType})');
    print('Acoustic Sound: $_acousticSound (Type: ${_acousticSound.runtimeType})');
    print('Temperature: $_temperature (Type: ${_temperature.runtimeType})');
  }
}
