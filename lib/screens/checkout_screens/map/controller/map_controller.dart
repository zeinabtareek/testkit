import 'dart:collection';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import '../../../../controller/base_controller.dart';
import '../../../../enum/view_state.dart';

class MapController extends BaseController {
  var _marker = HashSet<Marker>().obs;
  Position ?  position ;

  HashSet<Marker> get marker => _marker.value;
  final Address=''.obs;
  final location=''.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    await markLocation();
    await getGeoLocationPosition();
    setSate(ViewState.idle);
  }

  markLocation() {
    marker.add(Marker(
      markerId: MarkerId("1"),
      position: LatLng(37.25465890, 123.477478),
    ));
    _marker.value = marker;
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address.value = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    update();
  }

    }
