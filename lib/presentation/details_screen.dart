import 'package:ana_rusadze_car_app/models/car_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../data/dummy_data.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/details-screen';

  @override
  State<StatefulWidget> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  dynamic addCarInfo(String title, String description) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title, style: const TextStyle(fontSize: 24, color: Colors.black)),
        Text(description,
            style: const TextStyle(fontSize: 22, color: Colors.black)),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final carId = ModalRoute.of(context)!.settings.arguments as int;
    final selectedCar = DUMMY_DATA.firstWhere((car) => car.id == carId);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xff6fb0f6),
            centerTitle: true,
            title: const Text(
              'Details',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () =>
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          AlertDialog(
                            title: const Text('Delete Car'),
                            content: const Text('Do you really want to delete selected car?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, "No"),
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    CarRepository().removeCar(DUMMY_DATA.indexOf(selectedCar));
                                    Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false);
                                  });
                                },
                                child: const Text("yes"),
                              ),
                            ],
                          ),
                    ),
              )
            ]),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/car_placeholder.png',
                    image: selectedCar.imageUrl,
                    fit: BoxFit.contain,
                  )),
              addCarInfo("Brand:", selectedCar.brand),
              addCarInfo("Model:", selectedCar.model),
              addCarInfo("Year:", selectedCar.year.toString()),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(selectedCar.description,
                      style:
                      const TextStyle(fontSize: 20, color: Colors.black)))
            ],
          ),
        ));
  }
}
