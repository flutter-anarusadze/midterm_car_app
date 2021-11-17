import 'package:ana_rusadze_car_app/presentation/add_screen.dart';
import 'package:ana_rusadze_car_app/presentation/details_screen.dart';
import 'package:ana_rusadze_car_app/presentation/edit_screen.dart';
import 'package:ana_rusadze_car_app/presentation/home_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CarsApp());
}

class CarsApp extends StatelessWidget {
  const CarsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cars App',
      home: HomeScreen(),
      routes: {
        DetailsScreen.routeName: (ctx) => const DetailsScreen(),
        AddScreen.routeName: (ctx) => const AddScreen(),
        EditScreen.routeName: (ctx) => const EditScreen()
      },
    );
  }
}
