import 'package:flutter/material.dart';

Widget buildLogo(double size, String path) {
  return Image.asset(
    path,
    width: size,
  );
}
