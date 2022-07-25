import 'package:flutter/material.dart';
import 'package:printerest_app/pages/home_page.dart';

void main() {
  runApp(const PrinterestApp());
}

class PrinterestApp extends StatelessWidget {
  const PrinterestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
