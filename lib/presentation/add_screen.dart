import 'package:ana_rusadze_car_app/models/car.dart';
import 'package:ana_rusadze_car_app/models/car_repository.dart';
import 'package:ana_rusadze_car_app/widget/car_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  static const routeName = '/add-screen';

  @override
  State<StatefulWidget> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff6fb0f6),
          centerTitle: true,
          title: const Text(
            'Add',
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              addTextField("Please enter Image Url", _imageUrlController, false),
              addTextField("Please enter ID", _idController, true),
              addTextField("Please enter Brand", _brandController, false),
              addTextField("Please enter Model", _modelController, false),
              addTextField("Please enter Year", _yearController, true),
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
                          if(_formKey.currentState!.validate()){
                            CarRepository().addCar(Car(
                                id: int.parse(_idController.text),
                                brand: _brandController.text,
                                model: _modelController.text,
                                imageUrl: _imageUrlController.text,
                                year: int.parse(_yearController.text),
                                description: _descriptionController.text));
                            Navigator.of(context).pop(false);
                          }
                        });
                      },
                      child: const Text("ADD"),
                      color: const Color(0xff6fb0f6),
                      textColor: Colors.white),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
