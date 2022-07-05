import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cookie_of_the_day/model/cookies.dart';
import 'dart:math' as math;

class CookieMaitenancePage extends StatefulWidget {
  @override
  _CookieMaitenancePageState createState() => _CookieMaitenancePageState();
}

class _CookieMaitenancePageState extends State<CookieMaitenancePage> {
  final myTextController = TextEditingController();

  @override
  void dispose() {
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cookie maitenance'),
      ),
      body: Container(
        child: Column(
          children: [Expanded(child: cookieList(context)), cookieForm(context)],
        ),
      ),
    );
  }

  Widget cookieList(BuildContext context) {
    var cookies = Provider.of<Cookies>(context);

    return ListView.builder(
        itemCount: cookies.cookies.length,
        itemBuilder: (context, index) {
          return Card(child:ListTile(
            title: Text(
              cookies.cookies[index],
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 5),
            ),
            tileColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(.7),
          ),);
        });
  }

  Widget cookieForm(BuildContext context) {
    var cookies = Provider.of<Cookies>(context);
    return Column(
      children: [
        TextField(
          controller: myTextController,
          decoration: InputDecoration(
            filled: true,
            hintText: 'enter new cookie',
          ),
        ),
        ElevatedButton(
            onPressed: () {
              if (myTextController.text.isNotEmpty) {
                cookies.add(myTextController.text);
                myTextController.clear();
              }
            },
            child: Text('add'))
      ],
    );
  }
}
