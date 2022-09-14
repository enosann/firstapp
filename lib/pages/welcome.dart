// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todayscordinate/pages/corkboard.dart';
import 'package:todayscordinate/pages/materialboard.dart';
import 'package:todayscordinate/pages/whiteboard.dart';
import 'package:todayscordinate/widgets/drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final key = GlobalKey<ScaffoldState>();
  String? item = 'Select mode';
  var location = {};

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.rajdhaniTextTheme()),
      home: Scaffold(
        key: key,
        drawer: const Draw(),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/home.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            DrawIcon(key),
            SizedBox(
              height: screenSize.height * 0.27,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: screenSize.width * 0.5,
                  height: screenSize.height * 0.05,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Expanded(
                      child: DropdownButton(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        items: const [
                          DropdownMenuItem(
                            child: Text('Select mode'),
                            value: 'Select mode',
                          ),
                          DropdownMenuItem(
                            child: Text('Cork Board'),
                            value: 'Cork Board',
                          ),
                          DropdownMenuItem(
                            child: Text('White Board'),
                            value: 'White Board',
                          ),
                          DropdownMenuItem(
                            child: Text('Material Board'),
                            value: 'Material Board',
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            item = value!;
                            switch (value) {
                              case 'Cork Board':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CorkBoard()),
                                );
                                break;
                              case 'White Board':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const WhiteBoard()),
                                );
                                break;
                              case 'Material Board':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MaterialBoard()),
                                );
                                break;
                            }
                          });
                        },
                        isExpanded: true,
                        value: item,
                      ),
                    ),
                  ),
                ),
                const Text(' '),
                SizedBox(
                  height: screenSize.height * 0.2,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
