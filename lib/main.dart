import 'package:flutter/material.dart';
import 'package:flutterdemo/custom_sliver_page.dart';
import 'package:flutterdemo/home_page.dart';
import 'package:flutterdemo/perisiten_header_route.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomSliverPage(), //Stateless
      // home: SwapColorDemo2(), //stateful without key
      // home: SwapColorDemo3(), //stateful with key
      // home: SwapColorDemo4(), //padding without key
      // home: SwapColorDemo5(), //padding  key
    );
  }
}
