import 'dart:math';

import 'package:flutter/cupertino.dart';

class Cookies extends ChangeNotifier {

  late List<String> _cookies;

  Cookies(){
    _cookies = [
      'Wünsche dir nicht, dass es einfacher wäre. Wünsche dir, dass du besser darin wirst.',
      'Die Kunst ist, einmal mehr aufzustehen, als man umgeworfen wird.',
      'Es ist immer zu früh, um aufzugeben.',
      'Entweder wir finden einen Weg oder wir machen einen.'
    ];

  }

  add(String wisdom) {
    _cookies.add(wisdom);
    notifyListeners();
  }

  List<String> get cookies => List.unmodifiable(_cookies);

  String get cookieOfTheDay => _cookies[Random().nextInt(_cookies.length)];


}

