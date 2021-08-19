import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_agenda/View/General/home.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized(); 
    await Firebase.initializeApp();
    FlutterError.onError = (FlutterErrorDetails details) {
      print(details.exception);
    };
    runApp(Home());
  }, 
  (Object error, StackTrace stack) {
    print(error);
  });
}