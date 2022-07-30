import 'package:flutter/material.dart';

class LoginGoogleButton extends StatelessWidget {
  final dynamic ontapp;
  LoginGoogleButton({this.ontapp});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all((RoundedRectangleBorder(
                side: BorderSide(color: Colors.black45),
                borderRadius: BorderRadius.circular(5.0))))),
        onPressed: ontapp,
        child: Stack(
          children: [
            Positioned.fill(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/google.png', height: 28))),
            const Center(
                child: Text(
              'Login in with google',
              style: TextStyle(color: Colors.black),
            ))
          ],
        ),
      ),
    ));
  }
}
