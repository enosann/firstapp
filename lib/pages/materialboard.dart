// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:todayscordinate/widgets/bands.dart';
import 'package:todayscordinate/widgets/drawer.dart';
import 'package:todayscordinate/widgets/material.dart';

import '../checkers/uv.dart';

class MaterialBoard extends StatefulWidget {
  const MaterialBoard({Key? key}) : super(key: key);

  @override
  State<MaterialBoard> createState() => _MaterialBoardState();
}

class _MaterialBoardState extends State<MaterialBoard> {
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
        home: Scaffold(
            key: key,
            drawer: const Draw(),
            appBar: AppBar(
              leading: DrawIcon(key),
              backgroundColor: Colors.green,
            ),
            backgroundColor: Colors.brown,
            body: Stack(
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                    flex: 3,
                    child: Row(children: [
                      Mate(mor2, 'morning'),
                      Mate(day2, 'day'),
                    ]),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    color: Colors.green,
                    width: 360,
                    height: _screenSize.height * 0.18,
                    child: MaterialBand(we, pe, uvlevel),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Mate(eve2, 'evening'),
                          Mate(night2, 'night'),
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
