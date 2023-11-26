// ignore_for_file: library_private_types_in_public_api

import 'package:evenfoto/Api/auth_services.dart';
import 'package:evenfoto/Api/firebase_api.dart';
import 'package:evenfoto/Modulos/Notificacion/notification_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inicio(
        userName: '',
        userEmail: '',
      ),
      navigatorKey: navigatorKey,
      routes: {
        NotificationScreen.route: (context) => const NotificationScreen()
      },
    );
  }
}
