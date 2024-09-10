import 'package:flutter/material.dart';

class StatusCard extends StatefulWidget {
  final bool isWorkingProperly; // true for working properly, false for anomaly

  StatusCard({required this.isWorkingProperly});

  @override
  _StatusCardState createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: widget.isWorkingProperly ? Colors.green[800] : Colors.red[800],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[700]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            widget.isWorkingProperly ? Icons.check_circle : Icons.cancel,
            color: Colors.white,
            size: 24,
          ),
          SizedBox(width: 8),
          Text(
            widget.isWorkingProperly ? 'Working Properly' : 'Anomaly Detected',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
