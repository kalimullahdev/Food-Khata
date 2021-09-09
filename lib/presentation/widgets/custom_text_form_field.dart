import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.textFieldController,
    required this.showErorsMessage,
    required this.labelText,
    required this.validator,
    required this.iconData,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController textFieldController;
  final bool showErorsMessage;
  final String labelText;
  final Validator validator;
  final IconData iconData;
  final TextInputType keyboardType;
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textFieldController,
      onChanged: (value) {},
      autovalidateMode: widget.showErorsMessage
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      validator: widget.validator,
      style: const TextStyle(fontSize: 14),
      keyboardType: widget.keyboardType,
      cursorColor: const Color(0xffff6347),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color(0xffff6347)),
        filled: true,
        suffixIcon: Icon(
          widget.showErorsMessage ? Icons.error : widget.iconData,
          color: const Color(0xffff6347),
        ),
        labelText: widget.labelText,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffff6347), width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffff6347)),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffff6347)),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
