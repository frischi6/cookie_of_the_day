import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorPage extends StatefulWidget {
  @override
  State<SensorPage> createState() => _SensorState();
}

class _SensorState extends State<SensorPage> {
  double _x = 0, _y = 0, _z = 0;
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = accelerometerEvents.listen((event) {
      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            sensorView(context),
            Text('x: $_x'),
            Text('y: $_y'),
            Text('z: $_z'),
          ],
        ),
      ),
    );
  }

  sensorView(BuildContext context) {
    return Container();
  }
}
