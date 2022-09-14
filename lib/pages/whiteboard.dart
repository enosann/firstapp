// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todayscordinate/widgets/bands.dart';
import 'package:todayscordinate/widgets/drawer.dart';

import '../checkers/uv.dart';
import '../widgets/wanted.dart';

class WhiteBoard extends StatefulWidget {
  const WhiteBoard({Key? key}) : super(key: key);

  @override
  State<WhiteBoard> createState() => _WhiteBoardState();
}

class _WhiteBoardState extends State<WhiteBoard> {
  var daily = [];
  var data = {};
  var temp = {};
  var weather = [];
  num per = 0.5;
  num pe = 50;
  num mor = 0;
  num mor2 = 0;
  num day = 0;
  num day2 = 0;
  num eve = 0;
  num eve2 = 0;
  num night = 0;
  num night2 = 0;
  num uvindex = 0;
  String uvlevel = '';

  double lat = 0;
  double lon = 0;

  var weth = {};
  String we = '';

  String timezone = '';

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    lat = position.latitude;
    lon = position.longitude;

    setState(() {});
  }

  Future<void> fetchTemparature() async {
    Response response = await Dio().get(
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=8c2fc785df0d762f06f9f8343d72915f');
    daily = response.data['daily'];
    data = daily[0];
    temp = data['feels_like'];
    mor = temp['morn'];
    mor2 = mor.floor();
    mor2 = mor2 - 273;
    day = temp['day'];
    day2 = day.floor();
    day2 = day2 - 273;
    eve = temp['eve'];
    eve2 = eve.floor();
    eve2 = eve2 - 273;
    night = temp['night'];
    night2 = night.floor();
    night2 = night2 - 273;

    weather = data['weather'];
    weth = weather[0];
    we = weth['main'];

    per = data['pop'];
    pe = per * 100;

    uvindex = data['uvi'];
    uvlevel = uvCheck(uvindex);

    timezone = response.data['timezone'];

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future(() async {
      await getLocation();
      setState(() {
        fetchTemparature();
      });
    });
  }

  final key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var _screenSize = MediaQuery.of(context).size;
    return MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.permanentMarkerTextTheme()),
        home: Scaffold(
            key: key,
            drawer: const Draw(),
            body: Stack(
              children: [
                DrawIcon(key),
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(children: [
                      Wanted(mor2, 'morning'),
                      Wanted(day2, 'day'),
                    ]),
                  ),
                  WhiteBand(we, pe, uvlevel),
                  Expanded(
                    flex: 2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Wanted(eve2, 'evening'),
                          Wanted(night2, 'night'),
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]),
              ],
            )));
  }
}
