// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todayscordinate/widgets/bands.dart';
import 'package:todayscordinate/widgets/drawer.dart';
import 'package:todayscordinate/widgets/photo.dart';

import '../checkers/uv.dart';
import '../widgets/photo.dart';

class CorkBoard extends StatefulWidget {
  const CorkBoard({Key? key}) : super(key: key);

  @override
  State<CorkBoard> createState() => _CorkBoardState();
}

class _CorkBoardState extends State<CorkBoard> {
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
    var _screenSize = MediaQuery.of(context).size;
    return MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.alluraTextTheme()),
        home: Scaffold(
            key: key,
            drawer: const Draw(),
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/background.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                DrawIcon(key),
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(children: [
                      photo(mor2, 'morning'),
                      photo(day2, 'day'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        height: _screenSize.height * 0.18,
                        width: _screenSize.width * 0.7,
                        child: Image.asset(
                          'images/musking.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      MaterialBand(we, pe, uvlevel),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          photo(eve2, 'evening'),
                          photo(night2, 'night'),
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
