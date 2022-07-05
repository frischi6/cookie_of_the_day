import 'package:cookie_of_the_day/pages/cookie_maitenance_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cookie_of_the_day/model/cookies.dart';
import 'package:shake/shake.dart';
import 'dart:math' as math;

class CookiePage extends StatefulWidget {
  @override
  _CookiePageState createState() => _CookiePageState();
}

class _CookiePageState extends State<CookiePage> {
  forceRedraw() {
    setState(() => {});
  }

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(onPhoneShake: forceRedraw);
  }

  @override
  Widget build(BuildContext context) {
    var cookies = Provider.of<Cookies>(context);
    String wisdom = cookies.cookieOfTheDay;
    return Scaffold(
      appBar: AppBar(
        title: Text('cookie of the day'),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CookieMaitenancePage();
                }));
              }),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: forceRedraw,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(.7),
                  Colors.indigo,
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(.7)
                ]),
          ),
          //color: Theme.of(context).canvasColor,
          child: Center(
            child: Text(
              wisdom,
              textScaleFactor: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
