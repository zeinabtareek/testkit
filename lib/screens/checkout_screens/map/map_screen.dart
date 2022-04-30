import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newapexproject/constant.dart';

import '../../order_screens/address_screen.dart';
import 'controller/map_controller.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);
  final _controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Stack(
            children: [
              (GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(_controller.position!.latitude,
                      _controller.position!.longitude),
                  zoom: 16,
                ),
                onMapCreated: (GoogleMapController googleMapController) {
                  _controller.onInit();
                  _controller.markLocation();
                },
                markers: _controller.marker,
              )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            _controller.location.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        Container(
                          child: Text(
                            _controller.Address.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _getFAB(),
      );

  }

  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: K.mainColor,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: Icon(
              Icons.subdirectory_arrow_left_sharp,
              color: K.mainColor,
            ),
            backgroundColor: K.whiteColor,
            onTap: () async {
              Get.to(AddressScreen(address: _controller.Address.toString()));
            },
            label: 'Send',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: K.mainColor),
        SpeedDialChild(
            child: Icon(
              Icons.location_on_outlined,
              color: K.mainColor,
            ),
            backgroundColor: K.whiteColor,
            onTap: () async {

              _controller.position = await _controller.getGeoLocationPosition();
              _controller.location.value =
              'Lat: ${_controller.position?.latitude} , Long: ${_controller.position?.longitude}';
              _controller.GetAddressFromLatLong(_controller.position!);
            },
            label: 'location',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: K.mainColor),
      ],
    );
  }
}
