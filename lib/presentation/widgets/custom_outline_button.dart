import 'package:flutter/material.dart';

typedef OnPressed = void Function();

class CustomOutlineButton extends StatelessWidget {
  final OnPressed onPressed;
  final String buttonText;
  const CustomOutlineButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: (MediaQuery.of(context).size.width / 5) * 3,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Colors.blue))),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
