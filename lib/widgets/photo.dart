// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:todayscordinate/checkers/hotlevel.dart';

class photo extends StatelessWidget {
  photo(this.tem, this.time, {Key? key}) : super(key: key);

  num tem;
  String time;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(alignment: const Alignment(0, 0.75), children: [
        Positioned(
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
              child: SizedBox(
                height: 145,
                width: 130,
                child: checkHotlevel(tem),
              ),
            ),
            Image.asset(
              'images/flame.png',
              height: 210,
              width: 210,
            ),
          ]),
        ),
        Text(
          time,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
