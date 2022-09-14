// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:todayscordinate/checkers/hotlevel.dart';

class Mate extends StatelessWidget {
  Mate(this.tem, this.time, {Key? key}) : super(key: key);

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
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
