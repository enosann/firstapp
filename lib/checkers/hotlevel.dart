import 'package:flutter/material.dart';
import 'package:todayscordinate/widgets/clothes.dart';

Widget checkHotlevel(num tem) {
  if (tem < 5) {
    return down();
  } else if (tem < 8) {
    return wcoat();
  } else if (tem < 12) {
    return trench();
  } else if (tem < 16) {
    return sweater();
  } else if (tem < 20) {
    return cardigan();
  } else if (tem < 24) {
    return lshirt();
  } else if (tem < 28) {
    return hshirt();
  } else if (tem < 32) {
    return tshirt();
  } else {
    return tank();
  }
}
