import 'package:flutter/material.dart';
import 'package:ura/ui/pages/home/indexpage.dart';
import 'package:ura/ui/shared/utils/uisizing.dart';

void main() {
  runApp(const UraApp());
}

class UraApp extends StatelessWidget {
  const UraApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IndexPage(),
    );
  }
}
