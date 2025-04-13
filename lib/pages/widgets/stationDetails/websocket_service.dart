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
  final Duration _retryDelay = const Duration(seconds: 5);

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
      notifyListeners(); // Notify listeners about connection status
      print('WebSocket connected!');

      // Listen for WebSocket messages
      _channel!.stream.listen((data) {
        _onMessageReceived(data);
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

  // Handle incoming WebSocket messages
  void _onMessageReceived(String data) {
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

  // Send a message through the WebSocket
  void sendMessage(String message) {
    if (_isConnected && _channel != null) {
      _channel!.sink.add(message);
      print('Sent message: $message');
    } else {
      print('Cannot send message, WebSocket is not connected.');
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
