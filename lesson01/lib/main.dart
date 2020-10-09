import 'package:flutter/material.dart';
import 'mocks/mock_location.dart';
import 'locationDetail.dart';
import 'models/location.dart';

void main() {
  final Location mockLocation = MockLocation.FetchAny();

  return runApp(MaterialApp(home: LocationDetail(mockLocation)));
}
