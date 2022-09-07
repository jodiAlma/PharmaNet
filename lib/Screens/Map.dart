import 'package:pharma_net/Classes/Queries.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:pharma_net/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latLng;

class map extends StatelessWidget {
  static String id = '/map';
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: latLng.LatLng(homepage.p.latitude, homepage.p.longitude),
        zoom: 17.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              point: latLng.LatLng(homepage.p.latitude, homepage.p.longitude),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.location_on,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
