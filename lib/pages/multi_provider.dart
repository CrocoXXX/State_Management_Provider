import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/height_provider.dart';
import 'package:flutter_provider/pages/weight_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MultiProvider extends StatelessWidget {
  const MultiProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightProvider = Provider.of<HeightProvider>(context);
    var weightProvider = Provider.of<WeightProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Weight (kg)',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // NOTE: Menggunakan Consumer
              // Consumer<WeightProvider>(
              //   builder: (context, weightProvider, _) => Slider(
              //     min: 1,
              //     max: 100,
              //     divisions: 100,
              //     label: weightProvider.weight.round().toString(),
              //     value: weightProvider.weight,
              //     onChanged: (newValue) {
              //       newValue = newValue.roundToDouble();
              //       debugPrint('Weight $newValue');
              //       weightProvider.weight = newValue;
              //     },
              //   ),
              // ),
              Slider(
                min: 1,
                max: 100,
                divisions: 100,
                label: weightProvider.weight.round().toString(),
                value: weightProvider.weight,
                onChanged: (newValue) {
                  newValue = newValue.roundToDouble();
                  debugPrint('Weight $newValue');
                  weightProvider.weight = newValue;
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Your Height (cm)',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // NOTE: Menggunakan Consumer
              // Consumer<HeightProvider>(
              //   builder: (context, heightProvider, _) => Slider(
              //     min: 1,
              //     max: 200,
              //     divisions: 200,
              //     value: heightProvider.height,
              //     label: heightProvider.height.round().toString(),
              //     activeColor: Colors.pink,
              //     inactiveColor: Colors.pink.withOpacity(0.2),
              //     onChanged: (newValue) {
              //       newValue = newValue.roundToDouble();
              //       debugPrint('Height $newValue');
              //       heightProvider.height = newValue;
              //     },
              //   ),
              // ),
              Slider(
                min: 1,
                max: 200,
                divisions: 200,
                value: heightProvider.height,
                label: heightProvider.height.round().toString(),
                activeColor: Colors.pink,
                inactiveColor: Colors.pink.withOpacity(0.2),
                onChanged: (newValue) {
                  newValue = newValue.roundToDouble();
                  debugPrint('Height $newValue');
                  heightProvider.height = newValue;
                },
              ),
              const SizedBox(height: 50),
              // NOTE: Menggunakan Consumer
              // Consumer<WeightProvider>(
              //   builder: (context, weightProvider, _) =>
              //       Consumer<HeightProvider>(
              //     builder: (context, heightProvider, _) => Text(
              //       'Your BMI: \n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
              //       style: GoogleFonts.poppins(
              //         fontSize: 24,
              //         fontWeight: FontWeight.w500,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // )
              Text(
                'Your BMI: \n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
