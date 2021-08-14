import 'package:bytebankapp/screens/contacts_list/contacts_list.dart';
import 'package:bytebankapp/screens/dashboard/dashboard.dart';
import 'package:bytebankapp/screens/forms/contact_form.dart';
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
        primaryColor: Colors.green,
        accentColor: Colors.blueAccent.shade700,
      ),
      home: Dashboard(),
    );
  }
}
