import 'package:ngo_connect/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _pwController =TextEditingController();
  final TextEditingController _confirmpwController =TextEditingController();

  //tap to go to register page
  final void Function()? onTap;
  RegisterPage({
    super.key,
    required this.onTap,
    });

  //register
  void register(BuildContext context){
    //call auth service
    final auth =AuthService();

    //check if password == confirm password
    if(_pwController.text==_confirmpwController.text){
      try{
        auth.signUpWithEmailPassword(
        _emailController.text,
        _confirmpwController.text
      );
      } catch (e){
        showDialog(
        context: context,
         builder: (context)=> AlertDialog(
          title: Text(e.toString()),
         ),
        );
      }
    }
    //if password dont match >> show error
    else{
      showDialog(
        context: context,
         builder: (context)=> const AlertDialog(
          title: Text("Passwords don't match!"),
         ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      
    );
  }
}