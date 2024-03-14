import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;
  const MyButton({
    super.key,
    required this.buttonName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(4, 224, 92, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 19),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
