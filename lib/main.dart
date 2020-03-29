import 'package:flutter/material.dart';
import 'package:corona_app/screens/main_screen.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Corona App",
    theme: ThemeData(
      primaryColor: Colors.grey[700],
    ),
    home: Home()));
