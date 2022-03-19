import 'package:flutter/material.dart';
import 'package:video_and_audio_player/screens/my_home_page.dart';

class MyRoute {
  static generateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        );

        case '/second':
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        );
        
      default: 
    }
  }
}
