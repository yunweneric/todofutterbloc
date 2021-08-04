import 'package:flutter/material.dart';

SizedBox minorspacer() {
  return SizedBox(
    height: 10.0,
  );
}

SizedBox majorspacer() {
  return SizedBox(
    height: 30.0,
  );
}

screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

screenWidth(context) {
  return MediaQuery.of(context).size.width;
}
