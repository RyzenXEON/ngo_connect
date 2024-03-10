import 'package:ngo_connect/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _pwController =TextEditingController();

  //tap to go to register page
  final void Function()? onTap;
  
  LoginPage({
    super.key,
    required this.onTap,
    });

  //login
  void login(BuildContext context) async{
    //auth service
    final authService =AuthService();

    //try login
    try{
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
    }

    //catch error
    catch(e){
      showDialog(
        context: context,
         builder: (context)=> AlertDialog(
          title: Text(e.toString()),
         ),
        );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
    );
  }
}