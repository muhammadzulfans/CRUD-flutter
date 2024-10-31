import 'package:crud_online/deleteData.dart';
import 'package:crud_online/otomatisGet.dart';
import 'package:crud_online/postData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'getData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OtomatisGet(),
    );
  }
}