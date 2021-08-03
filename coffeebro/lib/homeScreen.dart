import 'dart:async';

import 'package:coffeebro/coffeeScreen.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 // Completer<GoogleMapController> _controller = Completer();
  //static const LatLng _center = const LatLng(41.078541, 29.051183);
  //MapType _currentMapType = MapType.normal;

  /*void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("CoffeBro"),
            backgroundColor: Colors.brown[800],
          ),
          body: Stack(
            children: [
              /*GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition:
                    CameraPosition(target: _center, zoom: 11.0),
                mapType: _currentMapType,
                markers: Set<Marker>.of(markers.values),
              ),*/
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Colors.brown[800],
                    child: Image.asset("assets/images/coffee.png"),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => CoffeeScreen()));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 110.0, right: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    heroTag: "btn2",
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.map,
                      color: Colors.grey[700],
                    ),
                    //onPressed: _onMapTypeButtonPressed,
                  ),
                ),
              )
            ],
          ),
        ));
  }

 /* void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });*/
  }

 /* Map<MarkerId, Marker> markers = <MarkerId, Marker>{
    MarkerId('marker_id_1'): Marker(
      markerId: MarkerId('marker_id_1'),
      position: LatLng(41.078541, 29.051183),
      infoWindow: InfoWindow(title: 'Starbucks', snippet: '5 stars rating'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    ),
    MarkerId('marker_id_1'): Marker(
      markerId: MarkerId('marker_id_1'),
      position: LatLng(41.001551, 29.0539185),
      infoWindow: InfoWindow(title: 'Starbucks', snippet: '5 stars rating'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    ),
  };
}*/
