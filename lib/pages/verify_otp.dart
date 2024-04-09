import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_connect/components/button.dart';
import 'package:ngo_connect/components/text_field.dart';
import 'package:ngo_connect/pages/home.dart';

class VerifyOTP extends StatefulWidget {
  String verificationId;
  String displayName;
  String email;
  String password;
  VerifyOTP({
    super.key,
    required this.verificationId,
    required this.displayName,
    required this.email,
    required this.password,
  });

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final TextEditingController _otpController = TextEditingController();

  void ontap() async {
    try {
      PhoneAuthCredential credential = await PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: _otpController.text);
      FirebaseAuth.instance.signInWithCredential(credential);
      FirebaseAuth.instance.currentUser?.updateDisplayName(widget.displayName);
      FirebaseAuth.instance.currentUser?.updateEmail(widget.email);
      FirebaseAuth.instance.currentUser?.updatePassword(widget.password);

      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Verify OTP",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          MyTextField(
              lable: 'OTP', obscureText: false, controller: _otpController),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            buttonName: 'Verify',
            onTap: ontap,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
