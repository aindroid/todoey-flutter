import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationService {
  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String _kPermissionGrantedMessage = 'Permission granted.';

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  _LatLong? mostRecentPosition;
  String message = '';

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    final position = await _geolocatorPlatform.getCurrentPosition();
    message = position.toString();
    mostRecentPosition =
        _LatLong(latitude: position.latitude, longitude: position.longitude);
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      message = _kLocationServicesDisabledMessage;

      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        message = _kPermissionDeniedMessage;

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      message = _kPermissionDeniedForeverMessage;

      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    message = _kPermissionGrantedMessage;
    return true;
  }

  void getLocation(Function(String) callback) {
    _getCurrentPosition().then((value) => callback(message));
  }

  void getLatLong(Function(_LatLong) callback) async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    callback(
        _LatLong(latitude: position.latitude, longitude: position.longitude));
  }
}

class _LatLong {
  final double latitude;
  final double longitude;
  _LatLong({required this.latitude, required this.longitude});
}
