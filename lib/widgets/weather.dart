import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget rain() {
  return Container(
    padding: EdgeInsets.zero,
    height: 220,
    decoration: BoxDecoration(
      border: Border.all(width: 2),
      borderRadius: BorderRadius.circular(32),
    ),
    child: Lottie.asset('assets/lotties/rain.json'),
  );
}

Widget snow() {
  return Container(
    padding: EdgeInsets.zero,
    height: 220,
    decoration: BoxDecoration(
      border: Border.all(width: 2),
      borderRadius: BorderRadius.circular(32),
    ),
    child: Lottie.asset('assets/lotties/snow.json'),
  );
}

Widget clear() {
  return Container(
    padding: EdgeInsets.zero,
    height: 220,
    decoration: BoxDecoration(
      border: Border.all(width: 2),
      borderRadius: BorderRadius.circular(32),
    ),
    child: Lottie.asset('assets/lotties/clear.json'),
  );
}

Widget clouds() {
  return Container(
    padding: EdgeInsets.zero,
    height: 220,
    decoration: BoxDecoration(
      border: Border.all(width: 2),
      borderRadius: BorderRadius.circular(32),
    ),
    child: Lottie.asset('assets/lotties/clouds.json'),
  );
}

Widget hero() {
  return Container(
    padding: EdgeInsets.zero,
    height: 220,
    decoration: BoxDecoration(
      border: Border.all(width: 2),
      borderRadius: BorderRadius.circular(32),
    ),
    child: Lottie.asset('assets/lotties/hero.json'),
  );
}
