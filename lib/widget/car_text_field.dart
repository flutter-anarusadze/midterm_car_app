import 'package:flutter/material.dart';

dynamic addTextField(String hint, TextEditingController controller, isNumeric) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
    child: Material(
      elevation: 5,
      shadowColor: Colors.grey,
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.grey, width: 3.0)),
            focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          validator: (String? value) {
            if(value!.isNotEmpty){
              if(isNumeric && int.tryParse(value) == null){
                return "Please fill only numbers";
              }else{
                return null;
              }
            }else {
              return "Please fill the field";
            }
          }),
    ),
  );
}
