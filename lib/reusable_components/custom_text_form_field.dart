import 'package:flutter/material.dart';

typedef validatorType = String? Function(String?)?;

class CustomTextFormField extends StatefulWidget {
  IconData suffixIcon;
  String hintText;
  TextInputType inputType;
  TextEditingController controller;
  validatorType validator;

  CustomTextFormField({
    super.key,
    required this.suffixIcon,
    required this.hintText,
    required this.inputType,
    required this.controller,
    required this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        cursorColor: Colors.black,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white),
          ),
          suffixIcon: Icon(
            widget.suffixIcon,
            color: Colors.blueAccent,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
