import 'package:flutter/material.dart';
import 'package:todayscordinate/widgets/weather.dart';

Widget checkWeather(String weaher) {
  if (weaher == 'Rain') {
    return rain();
  }
  if (weaher == 'Snow') {
    return snow();
  }
  if (weaher == 'Clear') {
    return clear();
  }
  if (weaher == 'Clouds') {
    return clouds();
  } else {
    return hero();
  }
}
