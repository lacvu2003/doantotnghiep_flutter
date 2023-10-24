import 'package:doantotnghiep/Screens/home.dart';
import 'package:doantotnghiep/Screens/landing.dart';
import 'package:doantotnghiep/Screens/login.dart';
import 'package:doantotnghiep/Screens/statistics.dart';
import 'package:doantotnghiep/data/model/add_date.dart';
import 'package:doantotnghiep/widgets/bottomnavigationbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var user = preferences.getString('username');
  runApp(MaterialApp(
    home: user == null ? HomePage() : Bottom(),
  ));
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
        home: HomePage());
  }
}
