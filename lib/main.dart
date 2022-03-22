import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_and_audio_player/provider/music_provider.dart';
import 'package:video_and_audio_player/route/m_route.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MusicProvider()),
    ],
    child: const MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      onGenerateRoute: (s) => MyRoute.generateRoute(s),
    );
  }
}

