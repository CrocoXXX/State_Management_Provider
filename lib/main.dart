import 'package:flutter/material.dart';
import 'package:flutter_provider/mainchoice.dart';
import 'package:flutter_provider/pages/gender_provider.dart';
import 'package:flutter_provider/pages/height_provider.dart';
import 'package:flutter_provider/pages/weight_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GenderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeightProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HeightProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainChoice(),
      ),
    );
  }
}
