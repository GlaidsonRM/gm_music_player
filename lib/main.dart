import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_music_player/controller/play_controller.dart';
import 'package:gm_music_player/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: 'ggrrmm@gmail.com', password: '123456');

  Get.lazyPut(() => PlayController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GM Music Player',
      theme: ThemeData(
        primaryColor: Color(0xFF272E36),
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
