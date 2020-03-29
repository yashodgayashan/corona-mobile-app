import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Corona Brief",
          ),
        ),
      ),
      body: Form(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }
}
