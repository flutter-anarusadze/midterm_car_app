import 'package:ana_rusadze_car_app/presentation/details_screen.dart';
import 'package:ana_rusadze_car_app/presentation/edit_screen.dart';
import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  final int id;
  final String brand;
  final String imageUrl;
  final int year;

  const CarItem(
      {required this.id,
      required this.brand,
      required this.imageUrl,
      required this.year});

  void navigateToDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      DetailsScreen.routeName,
      arguments: id,
    );
  }

  void navigateToEdit(BuildContext context) {
    Navigator.of(context).pushNamed(
      EditScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToDetails(context),
      onLongPress: () => navigateToEdit(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            FadeInImage(
                placeholder: const AssetImage('assets/images/car_placeholder.png'),
                image: NetworkImage(imageUrl)),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
            Text(
              brand,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
            Text(year.toString(),
                style: const TextStyle(fontSize: 16, color: Colors.black))
          ]),
        ),
      ),
    );
  }
}
