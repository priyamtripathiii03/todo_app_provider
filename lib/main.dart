import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/provider/home_provider.dart';
import 'package:todo_app_provider/view/homepage.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuoteProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuoteHomePage(),
      ),
    );
  }
}


