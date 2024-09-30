import 'package:flutter/material.dart';
import 'package:test_stream/view/home_page.dart';

void main() {
  runApp(const SearchWordApp());
}

class SearchWordApp extends StatelessWidget {
  const SearchWordApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Search Words",
      home: HomePage(),
    );
  }
}
