import 'package:ana_rusadze_car_app/data/dummy_data.dart';
import 'package:ana_rusadze_car_app/models/car.dart';
import 'package:ana_rusadze_car_app/models/car_repository.dart';
import 'package:ana_rusadze_car_app/widget/car_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  static const routeName = '/edit-screen';

  @override
  State<StatefulWidget> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    final carId = ModalRoute.of(context)!.settings.arguments as int;
    final selectedCar = DUMMY_DATA.firstWhere((car) => car.id == carId);

    final TextEditingController _imageUrlController = TextEditingController(text: selectedCar.imageUrl);
    final TextEditingController _idController = TextEditingController(text: selectedCar.id.toString());
    final TextEditingController _brandController = TextEditingController(text: selectedCar.brand);
    final TextEditingController _modelController = TextEditingController(text: selectedCar.model);
    final TextEditingController _yearController = TextEditingController(text: selectedCar.year.toString());
    final TextEditingController _descriptionController = TextEditingController(text: selectedCar.description);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff6fb0f6),
          centerTitle: true,
          title: const Text(
            'Edit',
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            addTextField("Please enter Image Url", _imageUrlController, false),
            addTextField("Please enter ID", _idController, true),
            addTextField("Please enter Brand", _brandController, false),
            addTextField("Please enter Model", _modelController, false),
            addTextField("Please enter Year",  _yearController, true),
            addTextField("Please enter Description", _descriptionController, false),
            const Padding(
              padding: EdgeInsets.all(50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                    height: 40,
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("BACK"),
                    color: const Color(0xff6fb0f6),
                    textColor: Colors.white),
                MaterialButton(
                    height: 40,
                    onPressed: () {
                      setState(() {
                        var car = Car(id: int.parse(_idController.text),
                            brand: _brandController.text,
                            model: _modelController.text,
                            imageUrl: _imageUrlController.text,
                            year: int.parse(_yearController.text),
                            description: _descriptionController.text);
                        CarRepository().editCar(car, DUMMY_DATA.indexOf(selectedCar));
                        Navigator.of(context).pop(false);
                      });
                    },
                    child: const Text("EDIT"),
                    color: const Color(0xff6fb0f6),
                    textColor: Colors.white),
              ],
            )
          ],
        ),
      ),
    );

  }
}
