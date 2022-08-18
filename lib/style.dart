
import 'package:flutter/cupertino.dart';

BoxDecoration appGradient() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff5B3896),
        Color(0xff482679),
        Color(0xff310f51),
      ]
    ),
  );
}