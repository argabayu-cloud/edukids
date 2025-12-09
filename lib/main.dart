import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'services/firebase_service.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();
await FirebaseService.init();
runApp(const EduKidsApp());
}


class EduKidsApp extends StatelessWidget {
const EduKidsApp({super.key});


@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'EduKids',
debugShowCheckedModeBanner: false,
theme: ThemeData(
primarySwatch: Colors.indigo,
textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
),
home: const HomePage(),
);
}
}