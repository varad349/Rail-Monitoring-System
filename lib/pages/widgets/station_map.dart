import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';  // Import latlong2 for coordinates

class StationMap extends StatefulWidget {
  final LatLng stationLocation;

  StationMap({required this.stationLocation});

  @override
  _StationMapState createState() => _StationMapState();
}

class _StationMapState extends State<StationMap> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: SizedBox(
        height: 300,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FlutterMap(
            options: MapOptions(
              center: widget.stationLocation,
              zoom: 11,
              interactiveFlags: ~InteractiveFlag.doubleTapDragZoom,
            ),
            children: [
              openStreetMapTileLayer,
              MarkerLayer(
                markers: [
                  Marker(
                    point: widget.stationLocation,
                    width: 60,
                    height: 60,
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.location_pin,
                      size: 60,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
