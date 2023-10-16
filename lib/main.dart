import 'package:doantotnghiep/Screens/home.dart';
import 'package:doantotnghiep/Screens/statistics.dart';
import 'package:doantotnghiep/data/model/add_date.dart';
import 'package:doantotnghiep/widgets/bottomnavigationbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'mons',
        useMaterial3: true,
      ),
      home: Bottom(),
    );
  }
}
