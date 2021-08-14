import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBankApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard ByteBankApp"),
        ),
        body: Column(
          children: <Widget>[
            Image.asset("images/bytebank_logo.png"),
            Container(
              height: 200,
              width: 200,
              color: Colors.green,
              child: Column(
                children: [
                  Icon(Icons.people),
                  Text("Texto do Copntainer"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
