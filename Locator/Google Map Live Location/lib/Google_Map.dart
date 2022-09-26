import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> map = Completer();
  static const CameraPosition google = CameraPosition(
    target: LatLng(21.1591425, 72.6822094),
    zoom: 14.4746,
  );

  final List<Marker> markers = <Marker>[];

  MapType GoogleMapType = MapType.normal;

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Google Map"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _onMapTypeButtonPressed,
              icon: const Icon(Icons.map_outlined)),
          IconButton(
            icon: const Icon(Icons.location_pin),
            onPressed: () async {
              getUserCurrentLocation().then((val) async {
                print(val.latitude.toString() + " " + val.longitude.toString());

                // marker added for current users location
                markers.add(
                  Marker(
                    markerId: const MarkerId("1"),
                    position: LatLng(val.latitude, val.longitude),
                  ),
                );

                // specified current users location
                CameraPosition cameraPosition = CameraPosition(
                  target: LatLng(val.latitude, val.longitude),
                  zoom: 14,
                );

                final GoogleMapController controller = await map.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {});
              });
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        child: SafeArea(
          child: GoogleMap(
            initialCameraPosition: google,
            markers: Set<Marker>.of(markers),
            mapType: GoogleMapType,
            myLocationEnabled: true,
            compassEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              map.complete(controller);
            },
          ),
        ),
      ),
    );
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      GoogleMapType =
      GoogleMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }
}
