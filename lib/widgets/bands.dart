// ignore_for_file: camel_case_types, duplicate_ignore, must_be_immutable

import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class CorkBand extends StatelessWidget {
  CorkBand(this.weather, this.per, this.uv, {Key? key}) : super(key: key);

  String weather;
  num per;
  String uv;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        weather,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 71,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'rain : $per %',
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            'uv : $uv',
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ]);
  }
}

class WhiteBand extends StatelessWidget {
  WhiteBand(this.weather, this.per, this.uv, {Key? key}) : super(key: key);

  String weather;
  num per;
  String uv;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 155,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 50,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            'rain : $per %',
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'uv : $uv',
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialBand extends StatelessWidget {
  MaterialBand(this.weather, this.per, this.uv, {Key? key}) : super(key: key);

  String weather;
  num per;
  String uv;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        weather,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 71,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'rain : $per %',
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            'uv : $uv',
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ]);
  }
}
