import 'package:ana_rusadze_car_app/data/dummy_data.dart';
import 'package:ana_rusadze_car_app/models/car.dart';
import 'package:ana_rusadze_car_app/models/car_repository.dart';
import 'package:ana_rusadze_car_app/widget/car_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_screen.dart';

class HomeScreen extends StatefulWidget { HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';
  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  List<Car> carList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xff6fb0f6),
            centerTitle: true,
            title: const Text(
              'Cars App',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AddScreen.routeName);
                },
              )
            ]),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return CarItem(
                id: carList[index].id,
                imageUrl: carList[index].imageUrl,
                year: carList[index].year,
                brand: carList[index].brand);

          },
          itemCount: carList.length,
        ));
  }
}
