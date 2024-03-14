import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String lable;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.lable,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(
            lable == 'Email'
                ? Icons.email
                : lable == 'Password'
                    ? Icons.lock
                    : lable == 'Confirm'
                        ? Icons.lock
                        : lable == 'Name'
                            ? Icons.person
                            : lable == 'Phone'
                                ? Icons.phone
                                :
                                //else search icon
                                Icons.search,
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Colors.black, width: 2)),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide:
                BorderSide(color: Color.fromRGBO(4, 224, 92, 1), width: 2),
          ),
          labelText: lable,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
