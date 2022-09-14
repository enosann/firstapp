// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todayscordinate/checkers/hotlevel.dart';

class Wanted extends StatelessWidget {
  Wanted(this.tem, this.time, {Key? key}) : super(key: key);

  num tem;
  String time;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(alignment: const Alignment(0, 1.4), children: [
        checkHotlevel(tem),
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
