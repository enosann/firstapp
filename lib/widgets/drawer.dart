// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todayscordinate/pages/corkboard.dart';
import 'package:todayscordinate/pages/materialboard.dart';
import 'package:todayscordinate/pages/welcome.dart';
import 'package:todayscordinate/pages/whiteboard.dart';

class Draw extends StatelessWidget {
  const Draw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text(
              'select mode',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Homepage()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Cork Board',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CorkBoard()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'White Board',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WhiteBoard()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Material Board',
              style: TextStyle(
                fontSize: 38,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MaterialBoard()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DrawIcon extends StatelessWidget {
  const DrawIcon(this.scakey, {Key? key}) : super(key: key);
  final scakey;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () {
          scakey.currentState?.openDrawer();
        },
        icon: const Icon(
          Icons.menu,
          size: 50,
        ),
      ),
    );
  }
}
