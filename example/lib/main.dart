import 'package:flutter/material.dart';
import 'package:stacked_list/stacked_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List> data = {
      'user1': ['1', '2', '3', '4'],
      'user2': ['A', 'B', 'C']
    };

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: StackedList(data: data),
        ),
      ),
    );
  }
}
